//
//  DetectInsectDataModelTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import SwiftUI
@testable import InsectsDetector

final class DetectInsectDataModelTests {
    
    var dataModel: DetectInsectDataModel!
    var mockImagePredictor: MockImagePredictor!
    
    init() {
        mockImagePredictor = MockImagePredictor()
        dataModel = DetectInsectDataModel()
        dataModel.imagePredictor = mockImagePredictor
    }
    
    deinit {
        dataModel = nil
        mockImagePredictor = nil
    }
    
    @Test func testClassifyImage_withMockPredictions() {
        // Given
        let sampleImage = UIImage(named: "ant")!
        let mockPrediction = Prediction(classification: "Ant,Formicidae", confidencePercentage: "85")
        mockImagePredictor.mockPredictions = [mockPrediction]
        
        // When
        dataModel.classifyImage(image: sampleImage)
        
        // Then
        #expect(mockImagePredictor.makePredictionsCalled == true, "The makePredictions method should have been called.")
        #expect(dataModel.predictions == ": 85%", "The prediction string should be formatted as expected.")
    }
    
    @Test func testClassifyImage_withError() {
        // Given
        let sampleImage =  UIImage(named: "ant")!
        mockImagePredictor.shouldThrowError = true
        
        // When
        dataModel.classifyImage(image: sampleImage)
        
        // Then
        #expect(dataModel.predictions == nil, "Predictions should be nil if an error occurs during classification.")
    }
    
    @MainActor
    @Test func testSaveDetectedInsect_savesInUserDefaults() {
        // Given
        let sampleImage = UIImage(named: "ant")!
        dataModel.predictions = "Ant: 85%"
        
        // When
        dataModel.saveDetectedInsect(image: sampleImage)
        
        // Then
        let userDefaults = UserDefaults.standard
        let savedKeys = userDefaults.dictionaryRepresentation().keys.filter { $0.hasPrefix("DetectedInsect") }
        
        #expect(savedKeys.isEmpty == false, "A DetectedInsect should be saved in UserDefaults.")
        
        if let key = savedKeys.first,
           let savedDict = userDefaults.dictionary(forKey: key) {
            let savedInsect = DetectedInsect.fromDictionary(savedDict)
            #expect(savedInsect?.predictions == "Ant: 85%", "The prediction should match the saved insect's prediction.")
        }
    }
}
