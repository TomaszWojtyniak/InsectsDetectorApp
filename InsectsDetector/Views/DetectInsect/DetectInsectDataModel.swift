//
//  DetectInsectDataModel.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import SwiftUI

@Observable
class DetectInsectDataModel {
    
    var imagePredictor = ImagePredictor()
    
    let predictionsToShow = 5
    
    var predictions: String?
    
    func saveDetectedInsect(image: UIImage) {
        let date = Date.now
        let detectedInsect = DetectedInsect(date: date, image: image, prediction: predictions ?? "")
        UserDefaults.standard.setValue(detectedInsect.toDictionary(), forKey: "DetectedInsect-\(date)-\(UUID().uuidString)")
    }
}

extension DetectInsectDataModel {
    func classifyImage(image: UIImage) {
        do {
            guard let image = image.resized(toWidth: 224) else { return }
            try self.imagePredictor.makePredictions(for: image,
                                                    completionHandler: imagePredictionHandler)
        } catch {
            print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
        }
    }
    
    private func imagePredictionHandler(_ predictions: [Prediction]?) {
        guard let predictions = predictions else {
            return
        }

        let formattedPredictions = formatPredictions(predictions)

        let predictionString = formattedPredictions.joined(separator: "\n")
        self.predictions = predictionString
        
    }
    
    private func formatPredictions(_ predictions: [Prediction]) -> [String] {
        // Vision sorts the classifications in descending confidence order.
        let topPredictions: [String] = predictions.prefix(predictionsToShow).map { prediction in
            var name = prediction.classification

            // For classifications with more than one name, keep the one before the first comma.
            if let firstComma = name.firstIndex(of: ",") {
                name = String(name.prefix(upTo: firstComma))
            }
            name = Insect(rawValue: name)?.name ?? ""
            return "\(name): \(prediction.confidencePercentage)%"
        }

        return topPredictions
    }
}
