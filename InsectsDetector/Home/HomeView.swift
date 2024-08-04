//
//  HomeView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI

struct HomeView: View {
    private var viewModel = HomeViewModel()
    
    @State private var showingSheet = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            
            HStack {
                Button {
                    showingSheet.toggle()
                } label: {
                    Text("Scan insect")
                }
                .sheet(isPresented: $showingSheet) {
                    accessCameraView(selectedImage: self.$selectedImage)
                }
                .font(.title)
                .padding()
                .background(.accent)
                .tint(.white)
                .clipShape(.buttonBorder)
                
                Spacer()
                
                Button {
                    if let selectedImage {
                        DispatchQueue.global(qos: .userInitiated).async {
                            self.viewModel.classifyImage(image: selectedImage)
                        }
                    }
                } label: {
                    Text("Classify insect")
                }
                .font(.title)
                .padding()
                .background(.accent)
                .tint(.white)
                .clipShape(.buttonBorder)
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
