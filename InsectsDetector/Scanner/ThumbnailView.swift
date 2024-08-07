//
//  ThumbnailView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 07/08/2024.
//

import SwiftUI

struct ThumbnailView: View {
    @Environment(\.colorScheme) var colorScheme
    var image: Image?
    
    var body: some View {
        ZStack {
            if let image = image {
                image
                .resizable()
                .scaledToFill()
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 50, height: 50)
        .cornerRadius(8)
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static let previewImage = Image(systemName: "photo.fill")
    static var previews: some View {
        ThumbnailView(image: previewImage)
    }
}

#Preview {
    ThumbnailView()
}
