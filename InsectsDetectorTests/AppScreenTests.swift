//
//  AppScreenTests.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/11/2024.
//


import Testing
import SwiftUI
@testable import InsectsDetector

final class AppScreenTests {

    @Test func testAppScreenCases() {
        // Ensure all cases are present
        #expect(AppScreen.allCases.count == 3, "Expected 3 cases in AppScreen enum.")
        #expect(AppScreen.allCases.contains(.home), "Expected .home to be a case in AppScreen.")
        #expect(AppScreen.allCases.contains(.empty), "Expected .empty to be a case in AppScreen.")
        #expect(AppScreen.allCases.contains(.settings), "Expected .settings to be a case in AppScreen.")
    }
    
    @Test func testAppScreenIds() {
        // Verify each case's id
        #expect(AppScreen.home.id == .home, "Expected .home case id to match.")
        #expect(AppScreen.empty.id == .empty, "Expected .empty case id to match.")
        #expect(AppScreen.settings.id == .settings, "Expected .settings case id to match.")
    }
    
    @Test func testAppScreenLabels() throws {
        // Check if labels can be created for each case
        let homeLabel = AppScreen.home.label
        _ = try #require(homeLabel, "Expected .home label to be created.")
        
        let emptyLabel = AppScreen.empty.label
        _ = try #require(emptyLabel, "Expected .empty label to be created.")
        
        let settingsLabel = AppScreen.settings.label
        _ = try #require(settingsLabel, "Expected .settings label to be created.")
    }

    @Test func testAppScreenDestinations() throws {
        // Check if destinations can be created for each case
        let homeDestination = AppScreen.home.destination
        _ = try #require(homeDestination, "Expected .home destination to be created.")
        
        let emptyDestination = AppScreen.empty.destination
        _ = try #require(emptyDestination, "Expected .empty destination to be created.")
        
        let settingsDestination = AppScreen.settings.destination
        _ = try #require(settingsDestination, "Expected .settings destination to be created.")
    }
}
