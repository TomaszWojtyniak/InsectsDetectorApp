//
//  HomeDataModelTests.swift
//  InsectsDetectorTests
//
//  Created by Tomasz Wojtyniak on 13/04/2024.
//

import Testing
@testable import InsectsDetector

struct HomeDataModelTests {
    
    @Test func test_loading_data_empty_list() async throws {
        let homeDataModel = HomeViewModel()
        #expect(homeDataModel.detectedInsectsData == [])
    }
}
