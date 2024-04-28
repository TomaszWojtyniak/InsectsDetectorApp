//
//  ContentView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/04/2024.
//

import SwiftUI

struct ContentView: View {
    var coreMLLauncher = CoreMLLauncher()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            // Example usage
            coreMLLauncher.testModel()
        }
    }
}

#Preview {
    ContentView()
}
