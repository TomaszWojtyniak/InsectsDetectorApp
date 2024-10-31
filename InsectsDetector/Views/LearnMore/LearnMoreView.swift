//
//  LearnMoreView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 30/10/2024.
//

import SwiftUI

struct LearnMoreView: View {
    
    let insect: Insect
    var dataModel = LearnMoreDataModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(insect.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                Text(insect.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(insect.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle(insect.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnMoreView(insect: .ant)
}
