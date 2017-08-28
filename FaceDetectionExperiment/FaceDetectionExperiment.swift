//
//  FaceDetectionExperiment.swift
//  FaceDetectionExperiment
//
//  Created by mono on 2017/08/28.
//  Copyright © 2017 Vakona Inc. All rights reserved.
//

import Foundation
import AppKit

enum Accurecy {
    case
    `default`,
    high,
    low

    var options: [String: Any] {
        switch self {
        case .default: return [:]
        case .high: return [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        case .low: return [CIDetectorAccuracy: CIDetectorAccuracyLow]
        }
    }
}

func countFace(image: NSImage, accuracy: Accurecy, onlyPortrail: Bool) -> Int {
    return countFace(image: image.cgImage, accuracy: accuracy, onlyPortrail: onlyPortrail)
}

func countFace(image: CGImage, accuracy: Accurecy, onlyPortrail: Bool) -> Int {
    let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy.options)!
    let ciImage = CIImage(cgImage: image)
    let imageOptions = onlyPortrail ? [CIDetectorImageOrientation: 1] : [:]
    let faces = detector.features(in: ciImage, options: imageOptions)
    return faces.count

}

extension NSImage {
    var cgImage: CGImage {
        var imageRect = NSRect(x: 0, y: 0, width: size.width, height: size.height)
        guard let image =  cgImage(forProposedRect: &imageRect, context: nil, hints: nil) else {
            fatalError()
        }
        return image
    }
}
