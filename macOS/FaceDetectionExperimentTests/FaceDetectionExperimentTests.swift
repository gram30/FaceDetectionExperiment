//
//  FaceDetectionExperimentTests.swift
//  FaceDetectionExperimentTests
//
//  Created by mono on 2017/08/28.
//  Copyright © 2017 Vakona Inc. All rights reserved.
//

import XCTest
@testable import FaceDetectionExperiment

class FaceDetectionExperimentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func printOkCount(accuracy: Accurecy, onlyPortrail: Bool) {
        print("ok")
        (1...12).forEach {
            let image = NSImage(contentsOf: URL(fileURLWithPath: "/Users/mono/Desktop/1588/OK/ok_\($0).jpg"))!
            print(countFace(image: image, accuracy: accuracy, onlyPortrail: onlyPortrail))
        }
    }

    func printNgCount(accuracy: Accurecy, onlyPortrail: Bool) {
        print("ng")
        (1...12).forEach {
            let image = NSImage(contentsOf: URL(fileURLWithPath: "/Users/mono/Desktop/1588/NG/ng_\($0).jpg"))!
            print(countFace(image: image, accuracy: accuracy, onlyPortrail: onlyPortrail))
        }
    }

    func testExample() {
        print("portrait")
        print("\(Accurecy.high)")
        printOkCount(accuracy: .high, onlyPortrail: true)
        printNgCount(accuracy: .high, onlyPortrail: true)
        print("\(Accurecy.default)")
        printOkCount(accuracy: .default, onlyPortrail: true)
        printNgCount(accuracy: .default, onlyPortrail: true)
        print("\(Accurecy.low)")
        printOkCount(accuracy: .low, onlyPortrail: true)
        printNgCount(accuracy: .low, onlyPortrail: true)
        print("not portrait")
        print("\(Accurecy.high)")
        printOkCount(accuracy: .high, onlyPortrail: false)
        printNgCount(accuracy: .high, onlyPortrail: false)
        print("\(Accurecy.default)")
        printOkCount(accuracy: .default, onlyPortrail: false)
        printNgCount(accuracy: .default, onlyPortrail: false)
        print("\(Accurecy.low)")
        printOkCount(accuracy: .low, onlyPortrail: false)
        printNgCount(accuracy: .low, onlyPortrail: false)
    }
    
}
