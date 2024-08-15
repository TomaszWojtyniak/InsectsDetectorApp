//
//  SettingsNavigationStack.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI

struct SettingsNavigationStack: View {
    var body: some View {
        NavigationStack {
            SettingsView()
                .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsNavigationStack()
}
