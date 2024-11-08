//
//  HomeDataModelTests.swift
//  InsectsDetectorTests
//
//  Created by Tomasz Wojtyniak on 13/04/2024.
//

import Testing
@testable import InsectsDetector
import Foundation

final class HomeViewModelTests {

    var viewModel: HomeViewModel!

    init() {
        viewModel = HomeViewModel()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)  // Clear UserDefaults for each test
    }

    deinit {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)  // Clean up UserDefaults
        viewModel = nil
    }
    
    @MainActor
    @Test func testLoadData_loadsAndSortsDetectedInsects() {
        // Arrange: Set up UserDefaults with test data
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        let date1 = Date()
        let date2 = date1.addingTimeInterval(-86400) // 1 day before

        let insect1 = DetectedInsect(date: date1, image: .bee, prediction: "Bee")
        let insect2 = DetectedInsect(date: date2, image: .ant, prediction: "Ant")
        
        let insectData1 = try! JSONEncoder().encode(insect1)
        let insectData2 = try! JSONEncoder().encode(insect2)
        
        let insectDict1 = try! JSONSerialization.jsonObject(with: insectData1, options: []) as! [String: Any]
        let insectDict2 = try! JSONSerialization.jsonObject(with: insectData2, options: []) as! [String: Any]
        
        UserDefaults.standard.set(insectDict1, forKey: "DetectedInsect 1")
        UserDefaults.standard.set(insectDict2, forKey: "DetectedInsect 2")
        
        // Act: Load data
        viewModel.loadData()
        
        // Assert: Check if data was loaded and sorted by date descending
        #expect(viewModel.detectedInsectsData.count == 2)
        #expect(viewModel.detectedInsectsData[0].predictions == "Bee")
        #expect(viewModel.detectedInsectsData[1].predictions == "Ant")
    }
    
    @Test func testDecodeDictionary_validData_returnsDetectedInsect() {
        // Arrange: Create a sample dictionary that matches DetectedInsect structure
        let date = Date()
        //let insect = DetectedInsect(name: "Butterfly", date: date)
        let insect = DetectedInsect(date: date, image: .butterfly, prediction: "Butterfly")
        let insectData = try! JSONEncoder().encode(insect)
        let insectDict = try! JSONSerialization.jsonObject(with: insectData, options: []) as! [String: Any]

        // Act: Attempt to decode
        let decodedInsect = viewModel.decodeDictionary(from: insectDict, toType: DetectedInsect.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.string(from: date)

        // Assert: Check if decoding was successful and values match
        #expect(decodedInsect != nil)
        #expect(decodedInsect?.predictions == "Butterfly")
        #expect(decodedInsect?.date == dateString)
    }

    @Test func testDecodeDictionary_invalidData_returnsNil() {
        // Arrange: Set up an invalid dictionary that should fail decoding
        let invalidDict: [String: Any] = ["invalidKey": "invalidValue"]

        // Act: Attempt to decode
        let decodedInsect = viewModel.decodeDictionary(from: invalidDict, toType: DetectedInsect.self)

        // Assert: Decoding should fail, resulting in nil
        #expect(decodedInsect == nil)
    }
}
