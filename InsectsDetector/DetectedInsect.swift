//
//  DetectedInsect.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 15/08/2024.
//

import SwiftUI

struct DetectedInsect: Codable, Hashable {
    let date: String
    let image: String
    let predictions: String
    
    init(date: Date, image: UIImage, prediction: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.string(from: date)
        
        guard let imageData = image.pngData() else {
              fatalError("Error encoding image as string")
          }
        let imageBase64String = imageData.base64EncodedString()
        
        self.date = dateString
        self.image = imageBase64String
        self.predictions = prediction
    }
    
    init(date: String, image: String, prediction: String) {
        self.date = date
        self.image = image
        self.predictions = prediction
    }
    
    func toDictionary() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else {
            return nil
        }
        
        return dictionary
    }
    
    func getDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self.date) {
            return date
        } else {
            print("Failed to convert string to Date")
            return Date()
        }
    }
    
    func getImage() -> UIImage {
        guard let imageData = Data(base64Encoded: self.image) else {
            return UIImage()
        }
        
        return UIImage(data: imageData) ?? UIImage()
    }
    
    static func fromDictionary(_ dictionary: [String: Any]) -> DetectedInsect? {
        guard let prediction = dictionary["predictions"] as? String else {
            return nil
        }
        
        return DetectedInsect(date: Date(), image: UIImage(named: "ant")!, prediction: prediction)
    }
}
