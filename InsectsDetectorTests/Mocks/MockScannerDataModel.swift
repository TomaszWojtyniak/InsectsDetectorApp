//
//  MockScannerDataModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//

import SwiftUI
@testable import InsectsDetector

public class MockScannerDataModel: ScannerDataModel {
    
    public override func loadThumbnail() async {
        self.thumbnailImage = Image("ant")
    }
    
    public override func handleCameraPreviews() async {
        self.isImageCaptured = true
    }
}
