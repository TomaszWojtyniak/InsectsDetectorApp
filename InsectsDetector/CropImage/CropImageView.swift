//
//  CropImageView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/08/2024.
//

import SwiftUI

struct CropImageView: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
    }
}

#Preview {
    CropImageView(image: Image(""))
}
