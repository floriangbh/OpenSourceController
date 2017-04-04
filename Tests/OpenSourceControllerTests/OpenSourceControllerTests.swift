//
//  OpenSourceControllerTests.swift
//  OpenSourceController
//
//  Created by Florian Gabach on {TODAY}.
//  Copyright © 2017 OpenSourceController. All rights reserved.
//

import Foundation
import XCTest
import OpenSourceController

class OpenSourceControllerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(OpenSourceController().text, "Hello, World!")
    }
}

#if os(Linux)
extension OpenSourceControllerTests {
    static var allTests : [(String, (OpenSourceControllerTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
