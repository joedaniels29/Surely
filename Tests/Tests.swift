//
//  Tests.swift
//  Surely
//
//  Created by Károly Lőrentey on 2016-03-08.
//  Copyright © 2016 Károly Lőrentey.
//

import XCTest
@testable import Surely

class SurelyTests: XCTestCase {
    
    func testHello() {
        XCTAssertEqual(hello(), "Hello!")
    }
}
