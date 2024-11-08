//
//  MockImagePredictor.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import UIKit
@testable import InsectsDetector

class MockImagePredictor: ImagePredictor {
    
    var mockPredictions: [Prediction]?
    var shouldThrowError = false
    var makePredictionsCalled = false
    
    override func makePredictions(for image: UIImage, completionHandler: @escaping ([Prediction]?) -> Void) throws {
        makePredictionsCalled = true
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Test Error"])
        } else {
            completionHandler(mockPredictions)
        }
    }
}