//
//  CameraManager.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/08/2024.
//

import Foundation
import AVFoundation
import os.log
import UIKit

class CameraManager: NSObject {
    
    private let captureSession = AVCaptureSession()
    private var deviceInput: AVCaptureDeviceInput?
    private var videoOutput: AVCaptureVideoDataOutput?
    private var photoOutput: AVCapturePhotoOutput?
    private let systemPreferredCamera = AVCaptureDevice.default(for: .video)
    private var sessionQueue = DispatchQueue(label: "video.preview.session")
    
    var capturedPhoto: CGImage?
    
    private var addToPreviewStream: ((CGImage) -> Void)?
    
    func configureSession() async {
        guard await isAuthorized,
              let systemPreferredCamera,
              let deviceInput = try? AVCaptureDeviceInput(device: systemPreferredCamera)
        else { return }
        
        captureSession.beginConfiguration()
        
        defer {
            self.captureSession.commitConfiguration()
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: sessionQueue)
        
        let photoOutput = AVCapturePhotoOutput()
        
        
        guard captureSession.canAddInput(deviceInput) else {
            logger.info("Unable to add device input to capture session.")
            return
        }
        
        guard captureSession.canAddOutput(videoOutput) else {
            logger.info("Unable to add video output to capture session.")
            return
        }
        
        guard captureSession.canAddOutput(photoOutput) else {
            logger.error("Unable to add photo output to capture session.")
            return
        }
        
        if deviceInput.device.isFocusModeSupported(.continuousAutoFocus) {
            try! deviceInput.device.lockForConfiguration()
            deviceInput.device.focusMode = .continuousAutoFocus
            deviceInput.device.unlockForConfiguration()
        }
        
        captureSession.addInput(deviceInput)
        captureSession.addOutput(photoOutput)
        captureSession.addOutput(videoOutput)
        
        self.deviceInput = deviceInput
        self.photoOutput = photoOutput
        self.videoOutput = videoOutput
        
        photoOutput.maxPhotoQualityPrioritization = .quality
        
        if let connection = videoOutput.connection(with: .video) {
            connection.videoRotationAngle = 90.0
        }
        
        if let connection = photoOutput.connection(with: .video) {
            connection.videoRotationAngle = 90.0
        }
    }
    
    func startSession() async {
        guard await isAuthorized else { return }
        captureSession.startRunning()
    }
    
    func stopSession() {
        if captureSession.isRunning {
            sessionQueue.async {
                self.captureSession.stopRunning()
            }
        }
    }
    
    private var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            var isAuthorized = status == .authorized
            
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
    
    lazy var previewStream: AsyncStream<CGImage> = {
        AsyncStream { continuation in
            addToPreviewStream = { cgImage in
                continuation.yield(cgImage)
            }
        }
    }()
    
    func takePhoto() {
        guard let photoOutput = self.photoOutput else { return }
        
        sessionQueue.async {
        
            var photoSettings = AVCapturePhotoSettings()

            if photoOutput.availablePhotoCodecTypes.contains(.hevc) {
                photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
            }
            
            let isFlashAvailable = self.deviceInput?.device.isFlashAvailable ?? false
            photoSettings.flashMode = isFlashAvailable ? .auto : .off
            if let previewPhotoPixelFormatType = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
                photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoPixelFormatType]
            }
            photoSettings.photoQualityPrioritization = .balanced
            
            if let connection = photoOutput.connection(with: .video) {
                connection.videoRotationAngle = 90.0
            }
            
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
}

extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        guard let currentFrame = sampleBuffer.cgImage else { return }
        addToPreviewStream?(currentFrame)
    }
    
}

extension CameraManager: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if let error = error {
            logger.error("Error capturing photo: \(error.localizedDescription)")
            return
        }
        
        if let image = photo.cgImageRepresentation() {
            self.capturedPhoto = image
            
            addToPreviewStream?(image)
        }
    }
}

fileprivate let logger = Logger(subsystem: "InsectsDetector", category: "Camera")


