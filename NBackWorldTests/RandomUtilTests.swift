//
//  RandomUtilTests.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import XCTest
@testable import NBackWorld

class RandomUtilTests: XCTestCase {
    
    func testRandIntRange() {
        var rands:[Int] = [Int](count: 4, repeatedValue: 0)
        
        for _ in 0...100 {
            let rand = RandomUtil.randIntRange(0, to: 3)
            rands[rand]++
        }
        
        XCTAssertTrue(rands[0] > 0)
        XCTAssertTrue(rands[1] > 0)
        XCTAssertTrue(rands[2] > 0)
        XCTAssertTrue(rands[3] == 0)
    }
    
}
