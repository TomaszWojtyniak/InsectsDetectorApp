//
//  CIImage+Extension.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/08/2024.
//

import CoreImage

extension CIImage {
    
    var cgImage: CGImage? {
        let ciContext = CIContext()
        
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else {
            return nil
        }
        
        return cgImage
    }
    
}
