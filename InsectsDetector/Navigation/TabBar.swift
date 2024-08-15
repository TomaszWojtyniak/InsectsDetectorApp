//
//  TabBar.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 28/04/2024.
//

import SwiftUI

struct TabBar: View {
    @State private var selection: AppScreen? = .home
    @State private var showingSheet = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground.withAlphaComponent(0.3)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
                ForEach(AppScreen.allCases) { screen in
                    screen.destination
                        .tag(screen as AppScreen?)
                        .tabItem { screen.label }
                        .toolbar(.hidden)
                        
                    
                }
            }
            
            Button {
                showingSheet.toggle()
            } label: {
                Image(systemName: "camera.fill")
                    .resizable()
                    .tint(Color.white)
                    .frame(width: 30, height: 25)
                    .aspectRatio(contentMode: .fit)
            }.sheet(isPresented: $showingSheet) {
                ScannerNavigationStack(showingSheet: $showingSheet)
            }
            .frame(width: 60, height: 60)
            .background(Color.accentColor)
            .clipShape(Circle())
            .padding(.bottom)
        }
        .ignoresSafeArea(.keyboard)
        .onChange(of: selection, { oldValue, newValue in
            if newValue == .empty {
                  self.selection = oldValue
              }
        })
    }
}

#Preview {
    TabBar()
}

struct SheetOpen: EnvironmentKey {
    static var defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var sheetOpen: Binding<Bool> {
        get { self[SheetOpen.self] }
        set { self[SheetOpen.self] = newValue }
    }
}
