//
//  Image+Extension.swift
//  InsectsDetector
//
//  Created by Tomasz Wojtyniak on 13/08/2024.
//

import SwiftUI

extension Image {
    func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self.resizable().aspectRatio(contentMode: .fit))
        let view = controller.view

        let targetSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}
