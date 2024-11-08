//
//  DetectedInsectItemViewModelTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import Foundation
@testable import InsectsDetector

final class DetectedInsectItemViewModelTests {

    var viewModel: DetectedInsectItemViewModel!
    
    init() {
        viewModel = DetectedInsectItemViewModel()
    }
    
    deinit {
        viewModel = nil
    }
    
    @Test func testGetFormattedDateString_formatsCorrectly() {
        // Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Test date: January 1, 2024 at 12:00:00
        let dateComponents = DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 0)
        let testDate = Calendar.current.date(from: dateComponents)!
        
        // When
        let formattedDate = viewModel.getFormattedDateString(date: testDate)
        
        // Then
        #expect(formattedDate == "2024-01-01 12:00:00", "Formatted date string should match expected format.")
    }
    
    @Test func testGetBestPrediction_returnsBestPrediction_whenMultiplePredictionsPresent() {
        // Given
        let predictions = "Ant: 85%\nBeetle: 10%\nFly: 5%"
        
        // When
        let bestPrediction = viewModel.getBestPrediction(predictions: predictions)
        
        // Then
        #expect(bestPrediction == "Ant: 85%", "Best prediction should be the first line of predictions.")
    }
    
    @Test func testGetBestPrediction_returnsEmptyString_whenNoPredictions() {
        // Given
        let predictions = ""
        
        // When
        let bestPrediction = viewModel.getBestPrediction(predictions: predictions)
        
        // Then
        #expect(bestPrediction == "", "Best prediction should be an empty string when no predictions are provided.")
    }
    
    @Test func testGetBestPrediction_returnsEntireString_whenOnlyOnePrediction() {
        // Given
        let predictions = "Ant: 85%\n"
        
        // When
        let bestPrediction = viewModel.getBestPrediction(predictions: predictions)
        
        // Then
        #expect(bestPrediction == "Ant: 85%", "Best prediction should return the single prediction when only one is provided.")
    }
}
