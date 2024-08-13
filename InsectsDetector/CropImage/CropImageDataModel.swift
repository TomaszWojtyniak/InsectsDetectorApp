//
//  CropImageDataModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/08/2024.
//

import SwiftUI

@Observable
final class CropImageDataModel {
    func cropImage(cropSize: CGSize, scale: CGFloat, offset: CGSize, image: Image) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: cropSize)
        let croppedImage = renderer.image { _ in
            let uiImage = image.asUIImage()
            uiImage.draw(in: CGRect(
                x: -((uiImage.size.width * scale) / 2 - cropSize.width / 2 + offset.width),
                y: -((uiImage.size.height * scale) / 2 - cropSize.height / 2 + offset.height),
                width: uiImage.size.width * scale,
                height: uiImage.size.height * scale
            ))
        }
        return croppedImage
    }
}
