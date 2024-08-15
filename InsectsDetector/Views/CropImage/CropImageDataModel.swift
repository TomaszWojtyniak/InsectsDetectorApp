//
//  CropImageDataModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/08/2024.
//

import SwiftUI

@Observable
final class CropImageDataModel {
    func cropImage(cropSize: CGSize, scale: CGFloat, offset: CGSize, image: UIImage) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: cropSize)
        let croppedImage = renderer.image { _ in
            image.draw(in: CGRect(
                x: -((image.size.width * scale) / 2 - cropSize.width / 2 + offset.width),
                y: -((image.size.height * scale) / 2 - cropSize.height / 2 + offset.height),
                width: image.size.width * scale,
                height: image.size.height * scale
            ))
        }
        return croppedImage
    }
}
