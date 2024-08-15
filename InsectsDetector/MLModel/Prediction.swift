//
//  Prediction.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 02/05/2024.
//

import Foundation

struct Prediction {
    /// The name of the object or scene the image classifier recognizes in an image.
    let classification: String

    /// The image classifier's confidence as a percentage string.
    ///
    /// The prediction string doesn't include the % symbol in the string.
    let confidencePercentage: String
}
