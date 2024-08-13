//
//  CGImage+Extension.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/08/2024.
//

import CoreGraphics
import UIKit

extension CGImage {
    func rotated(byDegrees degrees: CGFloat) -> CGImage? {
        let radians = degrees * CGFloat.pi / 180
        var newSize = CGRect(origin: .zero, size: CGSize(width: self.width, height: self.height))
            .applying(CGAffineTransform(rotationAngle: radians)).size

        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        let colorSpace = self.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!
        guard let context = CGContext(data: nil,
                                      width: Int(newSize.width),
                                      height: Int(newSize.height),
                                      bitsPerComponent: self.bitsPerComponent,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: self.bitmapInfo.rawValue) else {
            return nil
        }

        context.translateBy(x: newSize.width / 2, y: newSize.height / 2)
        context.rotate(by: radians)
        context.translateBy(x: -CGFloat(self.width) / 2, y: -CGFloat(self.height) / 2)

        context.draw(self, in: CGRect(x: 0, y: 0, width: CGFloat(self.width), height: CGFloat(self.height)))

        return context.makeImage()
    }
}
