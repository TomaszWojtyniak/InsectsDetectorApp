//
//  DetectedInsectItemView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import SwiftUI

struct DetectedInsectItemView: View {
    
    var viewModel = DetectedInsectItemViewModel()
    var detectedInsect: DetectedInsect
    
    var body: some View {
        HStack(spacing: 10) {
            Image(uiImage: detectedInsect.getImage())
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.getBestPrediction(predictions: detectedInsect.predictions))
                    .font(.body)
                Text(viewModel.getFormattedDateString(date: detectedInsect.getDate()))
                    .font(.caption2)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    DetectedInsectItemView(detectedInsect: DetectedInsect(date: "", image: "", prediction: ""))
}
