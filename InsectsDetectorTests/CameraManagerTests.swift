//
//  CameraManagerTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import AVFoundation
@testable import InsectsDetector

final class CameraManagerTests{
    var cameraManager: CameraManager!
    
    init() {
        self.cameraManager = CameraManager()
    }

    deinit {
        cameraManager = nil
    }

    @Test func testConfigureSession_whenAuthorized_startsSession() async {
        // Arrange
        AVCaptureDevice.requestAccess(for: .video) { granted in
            #expect(granted)
        }

        // Act
        await cameraManager.configureSession()
        await cameraManager.startSession()
        
        // Assert
        #expect(cameraManager.captureSession.isRunning)
    }
}
