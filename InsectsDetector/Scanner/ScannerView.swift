//
//  ScannerView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI

struct ScannerView: View {
    @State private var model = ScannerDataModel()
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                if let image = model.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height)
                } else {
                    ContentUnavailableView("No image", systemImage: "xmark.circle.fill")
                        
                }
            }
            
            Spacer()
            
            ButtonsView()
                .environment(model)
        }
    }
}


#Preview {
    ScannerView()
}
