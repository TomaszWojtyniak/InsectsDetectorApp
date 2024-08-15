//
//  DetectedInsectDetailView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import SwiftUI

struct DetectedInsectDetailView: View {
    
    var viewModel = DetectedInsectDetailViewModel()
    var detectedInsect: DetectedInsect
    var body: some View {
        NavigationStack {
            Image(uiImage: detectedInsect.getImage())
                .resizable()
                .frame(width: 224, height: 224)
                .aspectRatio(contentMode: .fill)
            
            Spacer()
            
            Text("Predictions:")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text(detectedInsect.predictions)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
        }
        .padding(.bottom, 50)
        .padding()
        .navigationTitle("Insect detected")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    DetectedInsectDetailView(detectedInsect: DetectedInsect(date: "", image: "", prediction: ""))
}
