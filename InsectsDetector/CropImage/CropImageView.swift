//
//  CropImageView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 08/08/2024.
//

import SwiftUI

struct CropImageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var model = CropImageDataModel()
    
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var croppedImage: UIImage? = nil
    
    @State var isImageCropped: Bool = false

    var image: Image
    var cropSize: CGSize = CGSize(width: 350, height: 350)
    
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale)
                            .offset(x: offset.width, y: offset.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset = CGSize(width: lastOffset.width + value.translation.width, height: lastOffset.height + value.translation.height)
                                    }
                                    .onEnded { value in
                                        lastOffset = offset
                                    }
                            )
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        scale = value.magnitude
                                    }
                            )
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                        
                        Rectangle()
                            .stroke((colorScheme == .dark) ? .white : .black, lineWidth: 4)
                            .frame(width: cropSize.width, height: cropSize.height)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }

                Button {
                    self.croppedImage = model.cropImage(cropSize: self.cropSize,
                                                        scale: self.scale,
                                                        offset: self.offset,
                                                        image: self.image)
                    self.isImageCropped = true
                } label: {
                    Text("Crop")
                        .frame(width: 300)
                        .padding()
                        .background(.accent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

            }
        }.navigationDestination(isPresented: $isImageCropped) {
            if let croppedImage {
                DetectInsectView(image: Image(uiImage: croppedImage))
            }
        }
        .navigationTitle("Crop the image")
    }
}

#Preview {
    CropImageView(image: Image(systemName: "photo"))
}
