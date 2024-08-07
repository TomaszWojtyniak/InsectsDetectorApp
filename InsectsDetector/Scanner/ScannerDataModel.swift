//
//  ScannerDataModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 07/08/2024.
//

import SwiftUI
import PhotosUI

@Observable
final class ScannerDataModel {
    var image: Image?
    var thumbnailImage: Image?
    
    func loadThumbnailImage() {
        Task {
            let fetchOptions = PHFetchOptions()
            fetchOptions.fetchLimit = 1
            let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            
            if let firstAsset = fetchResult.firstObject {
                let manager = PHImageManager.default()
                let options = PHImageRequestOptions()
                options.isSynchronous = true
                options.deliveryMode = .highQualityFormat
                
                manager.requestImage(for: firstAsset, targetSize: CGSize(width: 50, height: 50), contentMode: .aspectFit, options: options) { image, _ in
                    if let image = image {
                        self.thumbnailImage = Image(uiImage: image)
                    }
                }
            }
        }
    }
}
