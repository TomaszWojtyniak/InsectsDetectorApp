//
//  ImagePredictorTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import Vision
import SwiftUI
@testable import InsectsDetector

final class ImagePredictorTests{
    
    var imagePredictor: ImagePredictor!
    
    init() {
        imagePredictor = ImagePredictor()
    }
    
    deinit {
        imagePredictor = nil
    }
    
    @Test func testCreateImageClassifier() throws {
        // Test if the image classifier is successfully created
        let model = ImagePredictor.createImageClassifier()
        _ = try #require(model, "Expected image classifier model to be created.")
    }
    
    @Test func testMakePredictionsInvokesCompletionHandler() throws {
        // Given
        let mockImage = UIImage(systemName: "house")!
        
        // Mock completion handler
        let completionHandler: ImagePredictor.ImagePredictionHandler = { predictions in
            #expect(predictions != nil)
        }
        
        // When
        do {
            try imagePredictor.makePredictions(for: mockImage, completionHandler: completionHandler)
        } catch {
            Issue.record("Failed to make predictions with error: \(error)")
        }
    }
}
