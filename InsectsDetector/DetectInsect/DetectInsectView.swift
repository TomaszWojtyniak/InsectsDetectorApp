//
//  DetectInsectView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/08/2024.
//

import SwiftUI

struct DetectInsectView: View {
    
    var image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFit()
        }
    }
}

#Preview {
    DetectInsectView(image: Image(systemName: "photo"))
}
