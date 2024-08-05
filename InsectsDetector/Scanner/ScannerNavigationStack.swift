//
//  ScannerNavigationStack.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI

struct ScannerNavigationStack: View {
    var body: some View {
        NavigationStack {
            ScannerView()
        }
    }
}

#Preview {
    ScannerNavigationStack()
}
