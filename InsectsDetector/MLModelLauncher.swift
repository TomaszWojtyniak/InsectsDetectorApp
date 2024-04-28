//
//  MLModelLauncher.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/04/2024.
//

import SwiftUI
import CoreML

class CoreMLLauncher {
    
    func testModel() {
        do {
            let model = try mobilenet()
            let text = try model.prediction(input_1: getImageFromLocalPath(path: "InsectsDetector/test/ant/20230517_11-06-52-585272_29_crop_jpg.rf.c22fd764e2126d69fb6991ff67c301b1.jpg")!)
            print(text)
        } catch {
            
        }
    }
    
    func getImageFromLocalPath(path: String) -> CVPixelBuffer? {
        let fileManager = FileManager.default
        
        // Check if file exists at the given path
        if fileManager.fileExists(atPath: path) {
            // Create a URL from the file path
            let imageURL = URL(fileURLWithPath: path)
            
            // Attempt to load the image from the file path
            if let imageData = try? Data(contentsOf: imageURL) {
                // Create UIImage from the loaded data
                let image = UIImage(data: imageData) ?? UIImage()
                return imageToBuffer(image: image.cgImage!)!
            }
        }
        
        return nil
    }
    
    func imageToBuffer(image: CGImage) -> CVPixelBuffer? {
      let frameSize = CGSize(width: image.width, height: image.height)

      var pixelBuffer: CVPixelBuffer?
      let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(frameSize.width), Int(frameSize.height), kCVPixelFormatType_32BGRA, nil, &pixelBuffer)

      if status != kCVReturnSuccess {
        return nil
      }

      CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
      let data = CVPixelBufferGetBaseAddress(pixelBuffer!)
      let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
      let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue)
      let context = CGContext(data: data, width: Int(frameSize.width), height: Int(frameSize.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: bitmapInfo.rawValue)

      context?.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))

      CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

      return pixelBuffer
    }
}
