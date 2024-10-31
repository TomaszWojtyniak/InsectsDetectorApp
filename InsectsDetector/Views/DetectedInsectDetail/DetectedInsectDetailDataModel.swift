//
//  DetectedInsectDetailViewModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import Foundation

@Observable
class DetectedInsectDetailDataModel {
    
    func getBestPredictedInsect(predictions: String) -> Insect {
        if var firstWord = predictions.components(separatedBy: " ").first {
            firstWord = firstWord.trimmingCharacters(in: CharacterSet(charactersIn: ":"))
            let insect = Insect.matchInsect(insectName: firstWord) ?? .ant
            return insect
        }
        return .ant
    }
}
