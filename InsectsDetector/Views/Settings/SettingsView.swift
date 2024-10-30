//
//  SettingsView.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 05/08/2024.
//

import SwiftUI

struct SettingsView: View {
    
    private var viewModel = SettingViewModel()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Button {
                        showAlert.toggle()
                    } label: {
                      Text("Reset data")
                        .padding(.horizontal, 10)
                        .fontWeight(.semibold)
                        .frame(minHeight: 19)
                    }
                    .padding(.vertical, 0)
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.red)
                    .tint(Color(uiColor: .tertiarySystemFill))
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                    .alert("Reset data", isPresented: $showAlert) {
                        Button("Reset", role: .destructive) {
                            viewModel.clearUserDefaultsData()
                        }
                        Button("Cancel", role: .cancel) {}
                    } message: {
                        Text("Warning! This will DELETE your current data")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
