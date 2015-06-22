//
//  LimitedQueue.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

class LimitedQueue<T> {

    let limit:Int
    var queue:[T?]
    
    init(limit: Int) {
        self.limit = limit
        self.queue = [T?](count: self.limit, repeatedValue: nil)
    }
    
    func add(item: T) {
        for var idx = self.limit - 1; idx > 0; idx-- {
            self.queue[idx] = self.queue[idx - 1]
        }
        self.queue[0] = item
    }
    
    func getLast() throws -> T {
        if let item:T = self.queue[self.limit - 1] {
            return item
        }
        throw LimitedQueueError.MissingQueueElement
    }
    
}
