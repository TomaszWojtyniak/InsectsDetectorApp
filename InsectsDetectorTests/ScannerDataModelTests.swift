//
//  ScannerDataModelTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import SwiftUI
import PhotosUI
@testable import InsectsDetector

final class ScannerDataModelTests{
    
    var dataModel: MockScannerDataModel!
    
    init() {
        // Initialize the mock data model before each test
        dataModel = MockScannerDataModel()
    }
    
    deinit {
        dataModel = nil
    }
    
    @Test func testLoadThumbnail_setsThumbnailImage() async {
        // When
        await dataModel.loadThumbnail()
        
        // Then
        #expect(dataModel.thumbnailImage != nil, "Thumbnail image should be set.")
        #expect(dataModel.thumbnailImage == Image("ant"), "Thumbnail image should match the mocked image.")
    }
    
    @Test func testHandleCameraPreviews_setsIsImageCaptured() async {
        // When
        await dataModel.handleCameraPreviews()
        
        // Then
        #expect(dataModel.isImageCaptured == true, "isImageCaptured should be true after handleCameraPreviews is called in the mock.")
    }
    
    @Test func testHandleCameraPreviews_updatesCurrentFrame() async {
        // Given
        let sampleImage = UIImage(named: "ant")!.cgImage
        dataModel.currentFrame = sampleImage
        
        // When
        await dataModel.handleCameraPreviews()
        
        // Then
        #expect(dataModel.currentFrame == sampleImage, "Current frame should match the sample image after handleCameraPreviews.")
    }
}
