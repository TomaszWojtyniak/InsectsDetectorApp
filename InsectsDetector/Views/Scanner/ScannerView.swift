//
//  ScannerView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI
import SwiftyCrop

struct ScannerView: View {
    @State private var model = ScannerDataModel()
    @Binding var showingSheet: Bool
    @State private var croppedImage: UIImage?
    @State var isImageCropped: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geometry in
                    if let image = model.currentFrame {
                        Image(decorative: image, scale: 1)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height)
                    } else {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(2)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                }
                
                Spacer()
                
                ButtonsView(showingSheet: $showingSheet)
                    .environment(model)
            }
            .task {
                model.isImageCaptured = false
                model.cameraManager.capturedPhoto = nil
                await model.cameraManager.configureSession()
                await model.cameraManager.startSession()
                await model.loadThumbnail()
            }
            .fullScreenCover(isPresented: $model.isImageCaptured, onDismiss: {
                self.isImageCropped.toggle()
            }, content: {
                if let cgImage = model.cameraManager.capturedPhoto {
                    SwiftyCropView(
                        imageToCrop: UIImage(cgImage: cgImage),
                        maskShape: .square
                    ) { croppedImage in
                        self.croppedImage = croppedImage
                    }
                }
            })
        }.navigationDestination(isPresented: $isImageCropped) {
            if let croppedImage {
                DetectInsectView(showingSheet: $showingSheet, image: croppedImage)
            }
        }
    }
}


#Preview {
    ScannerView(showingSheet: .constant(true))
}
