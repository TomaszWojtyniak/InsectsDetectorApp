//
//  DetectedInsectItemViewModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import Foundation

@Observable
class DetectedInsectItemViewModel {
    
    func getFormattedDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    func getBestPrediction(predictions: String) -> String {
        if let range = predictions.range(of: "\n") {
            return String(predictions[..<range.lowerBound])
        } else {
            return ""
        }
    }
}
