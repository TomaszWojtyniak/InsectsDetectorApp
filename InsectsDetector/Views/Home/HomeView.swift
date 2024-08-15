//
//  HomeView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI

struct HomeView: View {
    private var viewModel = HomeViewModel()
    @State private var selection: String?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.detectedInsectsData, id: \.self) { detectedInsect in
                    NavigationLink {
                        DetectedInsectDetailView(detectedInsect: detectedInsect)
                    } label: {
                        DetectedInsectItemView(detectedInsect: detectedInsect)
                    }
                }
            }
            .refreshable {
                viewModel.loadData()
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

#Preview {
    HomeView()
}
