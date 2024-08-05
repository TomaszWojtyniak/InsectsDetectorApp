//
//  HomeView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI

struct HomeView: View {
    private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Home")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background.secondary)
    }
}

#Preview {
    HomeView()
}
