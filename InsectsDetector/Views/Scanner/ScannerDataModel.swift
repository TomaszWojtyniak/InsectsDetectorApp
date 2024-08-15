//
//  ScannerDataModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 07/08/2024.
//

import SwiftUI
import PhotosUI
import os.log

@Observable
final class ScannerDataModel {
    
    let cameraManager = CameraManager()
    
    var thumbnailImage: Image?
    var currentFrame: CGImage?
    var isImageCaptured: Bool = false
    
    init() {
        Task {
            await handleCameraPreviews()
        }
    }
    
    func handleCameraPreviews() async {
        for await image in cameraManager.previewStream {
            Task { @MainActor in
                if cameraManager.capturedPhoto == nil {
                    currentFrame = image
                } else {
                    currentFrame = cameraManager.capturedPhoto
                    cameraManager.stopSession()
                    self.isImageCaptured = true
                }
            }
        }
    }
    
    func loadThumbnail() async {
        let authorized = await PhotoLibrary.checkAuthorization()
        guard authorized else {
            logger.error("Photo library access was not authorized.")
            return
        }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchOptions.fetchLimit = 1
        let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        if let firstAsset = fetchResult.firstObject {
            let manager = PHImageManager.default()
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            options.deliveryMode = .highQualityFormat
            
            manager.requestImage(for: firstAsset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: options) { image, _ in
                if let image = image {
                    self.thumbnailImage = Image(uiImage: image)
                }
            }
        }
    }
}

fileprivate let logger = Logger(subsystem: "InsectsDetector", category: "ScannerDataModel")
