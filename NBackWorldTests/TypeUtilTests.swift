//
//  TypeUtilTests.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import XCTest
@testable import NBackWorld

class TypeUtilTests: XCTestCase {
    
    func testXOR() {
        XCTAssertTrue(true ^ false)
        XCTAssertTrue(false ^ true)
        XCTAssertFalse(true ^ true)
        XCTAssertFalse(false ^ false)
    }
    
    func testNotXOR() {
        XCTAssertTrue(true ~^ true)
        XCTAssertTrue(false ~^ false)
        XCTAssertFalse(true ~^ false)
        XCTAssertFalse(false ~^ true)
    }
    
}
