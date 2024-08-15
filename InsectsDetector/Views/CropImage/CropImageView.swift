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
    
    @State private var scale: CGFloat = 2.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var croppedImage: UIImage? = nil
    
    @State var isImageCropped: Bool = false

    var image: UIImage
    var cropSize: CGSize = CGSize(width: 224, height: 224)
    
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale)
                            .offset(x: offset.width, y: offset.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset = CGSize(width: lastOffset.width + value.translation.width, height: lastOffset.height + value.translation.height)
                                        //print(offset)
                                    }
                                    .onEnded { value in
                                        print(offset)
                                        lastOffset = offset
                                    }
                            )
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        //scale = value.magnitude
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
            .onAppear {
                self.scale = 1.0
                self.offset = .zero
            }
        }.navigationDestination(isPresented: $isImageCropped) {
            if let croppedImage {
                DetectInsectView(showingSheet: .constant(true), image: image)
            }
        }
        .navigationTitle("Crop the image")
    }
}

#Preview {
    CropImageView(image: UIImage(systemName: "photo") ?? UIImage())
}
