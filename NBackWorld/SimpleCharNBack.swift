//
//  SimpleCharNBack.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

class SimpleCharNBack : NBackRule {
    
    let chars:String = "ABCDEFGHIJKLMNOPQRSTUVWXY"
    let range:Int = 2
    var queue:LimitedQueue<String>
    
    var N:Int = 1
    var rangeMax:Int {
        get {
            return self.chars.characters.count
        }
    }
    
    init(N: Int) {
        self.N = N
        self.queue = LimitedQueue<String>(limit: N + 1)
    }
    
    func getNext() -> String {
        let rand = RandomUtil.randIntRange(0, to: self.range)
        let selection = "\(self.chars[advance(self.chars.startIndex, rand)])"
        queue.add(selection)
        return selection
    }
    
    func isMatch() -> Bool {
        do {
            return try self.queue.getFirst() == self.queue.getLast()
        } catch {
            return false
        }
    }
    
}
