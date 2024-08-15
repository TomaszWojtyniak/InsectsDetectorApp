//
//  SettingViewModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import SwiftUI

@Observable
class SettingViewModel {
    
    func clearUserDefaultsData() {
        let userDefaults = UserDefaults.standard
        let allKeys = userDefaults.dictionaryRepresentation().keys
        let filteredKeys = allKeys.filter { $0.hasPrefix("DetectedInsect") }
        
        for key in filteredKeys {
            userDefaults.removeObject(forKey: key)
        }
        userDefaults.synchronize()
    }
}
