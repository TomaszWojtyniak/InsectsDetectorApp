//
//  SettingViewModelTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import Foundation
@testable import InsectsDetector

final class SettingViewModelTests {

    var viewModel: SettingViewModel!
    let userDefaults = UserDefaults.standard

    init() {
        viewModel = SettingViewModel()
        
        // Prepare UserDefaults with mock data
        userDefaults.set("Insect1", forKey: "DetectedInsect1")
        userDefaults.set("Insect2", forKey: "DetectedInsect2")
        userDefaults.set("NonInsectData", forKey: "SomeOtherKey")
    }

    deinit {
        // Clean up UserDefaults
        userDefaults.removeObject(forKey: "DetectedInsect1")
        userDefaults.removeObject(forKey: "DetectedInsect2")
        userDefaults.removeObject(forKey: "SomeOtherKey")
        
        viewModel = nil
    }
    
    @Test func testClearUserDefaultsData_removesDetectedInsectKeys() {
        // Act: Call the method to clear specific keys
        viewModel.clearUserDefaultsData()
        
        // Assert: Verify that the DetectedInsect keys are removed
        #expect(userDefaults.value(forKey: "DetectedInsect1") == nil)
        #expect(userDefaults.value(forKey: "DetectedInsect2") == nil)
        
        // Assert: Verify that unrelated keys are unaffected
        #expect(userDefaults.value(forKey: "SomeOtherKey") as? String == "NonInsectData")
    }
}
