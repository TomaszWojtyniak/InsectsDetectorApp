//
//  ScannerView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI

struct ScannerView: View {
    @State private var model = ScannerDataModel()
    @Binding var showingSheet: Bool
    
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
                
                ButtonsView()
                    .environment(model)
            }
            .task {
                model.isImageCaptured = false
                model.cameraManager.capturedPhoto = nil
                await model.cameraManager.configureSession()
                await model.cameraManager.startSession()
                await model.loadThumbnail()
            }
        }.navigationDestination(isPresented: $model.isImageCaptured) {
            if let cgImage = model.cameraManager.capturedPhoto {
                //CropImageView(image: UIImage(cgImage: cgImage))
                DetectInsectView(showingSheet: $showingSheet, image: UIImage(cgImage: cgImage))
            }
        }
    }
}


#Preview {
    ScannerView(showingSheet: .constant(true))
}
