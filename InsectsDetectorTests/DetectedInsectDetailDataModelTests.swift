//
//  DetectedInsectDetailDataModelTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
@testable import InsectsDetector

final class DetectedInsectDetailDataModelTests {

    var dataModel: DetectedInsectDetailDataModel!
    
    init() {
        dataModel = DetectedInsectDetailDataModel()
    }
    
    deinit {
        dataModel = nil
    }
    
    @Test func testGetBestPredictedInsect_withValidPrediction_returnsCorrectInsect() {
        // Given
        let prediction = "Bee: 95% \nAnt: 75%"
        
        // When
        let result = dataModel.getBestPredictedInsect(predictions: prediction)
        
        // Then
        #expect(result == Insect.bee, "Expected the insect to be 'Bee' based on the prediction string.")
    }
    
    @Test func testGetBestPredictedInsect_withNonMatchingInsect_returnsDefaultInsect() {
        // Given
        let prediction = "UnknownInsect: 85%"
        
        // When
        let result = dataModel.getBestPredictedInsect(predictions: prediction)
        
        // Then
        #expect(result == Insect.ant, "Expected the insect to default to 'Ant' for unknown insect names.")
    }
    
    @Test func testGetBestPredictedInsect_withEmptyString_returnsDefaultInsect() {
        // Given
        let prediction = ""
        
        // When
        let result = dataModel.getBestPredictedInsect(predictions: prediction)
        
        // Then
        #expect(result == Insect.ant, "Expected the insect to default to 'Ant' for an empty prediction string.")
    }
    
    @Test func testGetBestPredictedInsect_withOnlyConfidence_returnsDefaultInsect() {
        // Given
        let prediction = ": 95%"
        
        // When
        let result = dataModel.getBestPredictedInsect(predictions: prediction)
        
        // Then
        #expect(result == Insect.ant, "Expected the insect to default to 'Ant' when no valid insect name is provided.")
    }
}
