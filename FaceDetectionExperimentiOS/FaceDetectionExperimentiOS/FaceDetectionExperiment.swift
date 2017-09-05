//
//  FaceDetectionExperiment.swift
//  FaceDetectionExperimentiOS
//
//  Created by mono on 2017/09/05.
//  Copyright © 2017 Vakona Inc. All rights reserved.
//

import Foundation
import UIKit

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

func countFace(image: UIImage, accuracy: Accurecy) -> Int {
    let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy.options)!
    let ciImage = CIImage(cgImage: image.cgImage!)
    let imageOptions = [CIDetectorImageOrientation: image.exifOrientation]
    let faces = detector.features(in: ciImage, options: imageOptions)
    return faces.count

}

extension UIImage {
        var exifOrientation: Int {
        switch (imageOrientation) {
        case .up:
            return 1
        case .down:
            return 3
        case .left:
            return 8
        case .right:
            return 6
        case .upMirrored:
            return 2
        case .downMirrored:
            return 4
        case .leftMirrored:
            return 5
        case .rightMirrored:
            return 7
        }
    }
}
