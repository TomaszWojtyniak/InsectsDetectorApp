//
//  HomeViewModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 02/05/2024.
//

import SwiftUI

@Observable
class HomeViewModel {
    
    var detectedInsectsData: [DetectedInsect] = []
    
    func loadData() {
        detectedInsectsData = []
        let userDefaults = UserDefaults.standard
        let allKeys = userDefaults.dictionaryRepresentation().keys
        let filteredKeys = allKeys.filter { $0.hasPrefix("DetectedInsect") }
        
        
        for key in filteredKeys {
            if let value = userDefaults.value(forKey: key) as? [String: Any] {
                if let insect = decodeDictionary(from: value, toType: DetectedInsect.self) {
                    detectedInsectsData.append(insect)
                } else {
                    print("Failed to decode dictionary")
                }
            }
        }
    }
    
    func decodeDictionary<T: Decodable>(from dictionary: [String: Any], toType type: T.Type) -> T? {
        // Convert the dictionary to Data
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else {
            return nil
        }

        // Decode the Data into the custom object
        let decoder = JSONDecoder()
        
        // If your date is in a specific format, configure the date decoding strategy
        decoder.dateDecodingStrategy = .iso8601
        
        return try? decoder.decode(T.self, from: data)
    }
}
