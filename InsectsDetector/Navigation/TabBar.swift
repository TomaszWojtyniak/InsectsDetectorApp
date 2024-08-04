//
//  TabBar.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI

struct TabBar: View {
    @State private var selection: AppScreen? = .home
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen as AppScreen?)
                    .tabItem { screen.label }
            }
        }
    }
}

#Preview {
    TabBar()
}
