//
//  LimitedQueueTests.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import XCTest
@testable import NBackWorld

class LimitedQueueTests: XCTestCase {

    func testLimitedQueue() {
        let q = LimitedQueue<Int>(limit: 3)
        var throwCount:Int = 0
        
        q.add(8)
        do {
            try q.getLast()
        } catch {
            throwCount++
        }
        
        q.add(5)
        do {
            try q.getLast()
        } catch {
            throwCount++
        }
        
        q.add(9)
        do {
            let last = try q.getLast()
            XCTAssertEqual(8, last)
        } catch {
            throwCount++
        }
        
        q.add(2)
        do {
            let last = try q.getLast()
            XCTAssertEqual(5, last)
        } catch {
            throwCount++
        }
        
        XCTAssertEqual(2, throwCount)
    }
    
}
