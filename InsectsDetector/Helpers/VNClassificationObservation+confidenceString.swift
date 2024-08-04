//
//  VNClassificationObservation+confidenceString.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 02/05/2024.
//

import Vision

extension VNClassificationObservation {
    /// Generates a string of the observation's confidence as a percentage.
    var confidencePercentageString: String {
        return String(format: "%2.2f", confidence)
    }
}


