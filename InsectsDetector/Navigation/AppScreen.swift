//
//  AppScreen.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI


enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case home
    case empty
    case settings
    
    var id: AppScreen { self }
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("Home", systemImage: "house")
        case .empty:
            EmptyView()
        case .settings:
            Label("Settings", systemImage: "list.bullet")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeNavigationStack()
        case .empty:
            Spacer()
        case .settings:
            SettingsNavigationStack()
        }
    }
}


