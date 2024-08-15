//
//  ScannerNavigationStack.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI

struct ScannerNavigationStack: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        NavigationStack {
            ScannerView(showingSheet: $showingSheet)
        }
    }
}

#Preview {
    ScannerNavigationStack(showingSheet: .constant(true))
}
