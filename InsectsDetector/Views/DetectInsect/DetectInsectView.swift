//
//  DetectInsectView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/08/2024.
//

import SwiftUI

struct DetectInsectView: View {
    @Binding var showingSheet: Bool
    var dataModel = DetectInsectDataModel()
    
    var image: UIImage
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 224, height: 224)
                    .aspectRatio(contentMode: .fill)
                
                Spacer()
                
                if let predictions = self.dataModel.predictions {
                    Text("Predictions:")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    Text(predictions)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .onAppear {
                            dataModel.saveDetectedInsect(image: image)
                        }
                }
                
                Button {
                    showingSheet = false
                } label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.accent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                
                
            }
            .onAppear {
                self.dataModel.classifyImage(image: image)
            }
        }
        .navigationTitle("Identify the insect")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    DetectInsectView(showingSheet: .constant(true), image: UIImage(systemName: "photo") ?? UIImage())
}
