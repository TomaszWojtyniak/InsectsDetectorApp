//
//  DetectedInsectTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import SwiftUI
@testable import InsectsDetector

final class DetectedInsectTests {

    @Test func testInitializationWithDateAndUIImage() throws {
        // Given
        let date = Date()
        let prediction = "Ant: 95%"
        let image = UIImage(systemName: "ant")!
        
        // When
        let detectedInsect = DetectedInsect(date: date, image: image, prediction: prediction)
        
        // Then
        #expect(detectedInsect.predictions == prediction, "Expected predictions to match the input prediction string.")
        #expect(detectedInsect.image != nil, "Expected image to be encoded and stored as a base64 string.")
        
        // Verify date format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        _ = try #require(dateFormatter.date(from: detectedInsect.date), "Expected date string to be in correct format.")
    }

    @Test func testInitializationWithStrings() {
        // Given
        let date = "2024-01-01T12:00:00Z"
        let imageBase64 = UIImage(systemName: "ant")!.pngData()!.base64EncodedString()
        let prediction = "Bee: 85%"
        
        // When
        let detectedInsect = DetectedInsect(date: date, image: imageBase64, prediction: prediction)
        
        // Then
        #expect(detectedInsect.date == date, "Expected date to match the input date string.")
        #expect(detectedInsect.image == imageBase64, "Expected image to match the input base64 string.")
        #expect(detectedInsect.predictions == prediction, "Expected predictions to match the input prediction string.")
    }

    @Test func testToDictionary() throws {
        // Given
        let date = Date()
        let prediction = "Ant: 95%"
        let image = UIImage(systemName: "ant")!
        let detectedInsect = DetectedInsect(date: date, image: image, prediction: prediction)
        
        // When
        let dictionary = detectedInsect.toDictionary()
        
        // Then
        _ = try #require(dictionary, "Expected dictionary to be successfully created from DetectedInsect.")
        #expect(dictionary?["predictions"] as? String == prediction, "Expected 'predictions' in dictionary to match.")
    }
    
    @Test func testFromDictionary() throws {
        // Given
        let prediction = "Ant: 95%"
        let dictionary: [String: Any] = [
            "predictions": prediction,
            "date": "2024-01-01T12:00:00Z",
            "image": UIImage(systemName: "ant")!.pngData()!.base64EncodedString()
        ]
        
        // When
        let detectedInsect = DetectedInsect.fromDictionary(dictionary)
        
        // Then
        _ = try #require(detectedInsect, "Expected DetectedInsect to be successfully created from dictionary.")
        #expect(detectedInsect?.predictions == prediction, "Expected predictions to match the dictionary value.")
    }
    
    @Test func testGetDate() {
        // Given
        let dateString = "2024-01-01T12:00:00Z"
        let detectedInsect = DetectedInsect(date: dateString, image: "", prediction: "")
        
        // When
        let date = detectedInsect.getDate()
        
        // Then
        let calendar = Calendar.current
        #expect(calendar.component(.year, from: date) == 2024, "Expected year to be 2024.")
        #expect(calendar.component(.month, from: date) == 1, "Expected month to be January.")
        #expect(calendar.component(.day, from: date) == 1, "Expected day to be 1.")
    }
    
    @Test func testGetImage() throws {
        // Given
        let image = UIImage(systemName: "ant")!
        let base64String = image.pngData()!.base64EncodedString()
        let detectedInsect = DetectedInsect(date: "2024-01-01T12:00:00Z", image: base64String, prediction: "")
        
        // When
        let resultImage = detectedInsect.getImage()
        
        // Then
        _ = try #require(resultImage, "Expected a valid UIImage to be decoded from base64 string.")
    }
}
