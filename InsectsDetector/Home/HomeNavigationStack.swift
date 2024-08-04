//
//  HomeNavigationStack.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI

struct HomeNavigationStack: View {
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeNavigationStack()
}
