//
//  FaceDetectionExperimentiOSTests.swift
//  FaceDetectionExperimentiOSTests
//
//  Created by mono on 2017/09/05.
//  Copyright © 2017 Vakona Inc. All rights reserved.
//

import XCTest
@testable import FaceDetectionExperimentiOS
import UIKit

class FaceDetectionExperimentTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func printOkCount(accuracy: Accurecy) {
        print("ok")
        (1...12).forEach {
            let image = UIImage(contentsOfFile: "/Users/mono/Desktop/1588/OK/ok_\($0).jpg")!
            print(countFace(image: image, accuracy: accuracy))
        }
    }

    func printNgCount(accuracy: Accurecy) {
        print("ng")
        (1...12).forEach {
            let image = UIImage(contentsOfFile: "/Users/mono/Desktop/1588/NG/ng_\($0).jpg")!
            print(countFace(image: image, accuracy: accuracy))
        }
    }

    func testExample() {
        print("portrait")
        print("\(Accurecy.high)")
        printOkCount(accuracy: .high)
        printNgCount(accuracy: .high)
        print("\(Accurecy.default)")
        printOkCount(accuracy: .default)
        printNgCount(accuracy: .default)
        print("\(Accurecy.low)")
        printOkCount(accuracy: .low)
        printNgCount(accuracy: .low)
    }
    
}
