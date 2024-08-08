//
//  ButtonsView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 07/08/2024.
//

import SwiftUI
import PhotosUI

struct ButtonsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var pickerItem: PhotosPickerItem?
    @Environment(ScannerDataModel.self) var model
    
    var body: some View {
        HStack(spacing: 60) {
            
            Spacer()
            
            PhotosPicker(
                selection: $pickerItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                ThumbnailView(image: model.thumbnailImage)
            }
            .onChange(of: pickerItem) {
                Task {
                    if let image = try? await pickerItem?.loadTransferable(type: Image.self) {
                        model.image = image
                    }
                }
            }
            
            Button {
                model.cameraManager.takePhoto()
            } label: {
                Label {
                    Text("Take Photo")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder((colorScheme == .dark) ? .white : .black, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(colorScheme == .dark ? .white : .black)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Button {

            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.clear)
            }
            
            Spacer()
        
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
}

#Preview {
    ButtonsView()
}
