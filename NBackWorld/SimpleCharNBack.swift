//
//  SimpleCharNBack.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

class SimpleCharNBack : NBackRule {
    
//    let chars:String = "ABCDEFGHIJKLMNOPQRSTUVWXY"
    let chars:String = "🐭🐹🐮🐯🐰🐱"
    
    var queue:LimitedQueue<String>
    var config: NBackRuleConfiguration
    
    required init(config: NBackRuleConfiguration) {
        self.config = config
        self.queue = LimitedQueue<String>(limit: config.N + 1)
    }
    
    func getNext() -> String {
        let rand = RandomUtil.randIntRange(0, to: self.config.range)
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
    
    func isGuessingStarted() -> Bool {
        do {
            try self.queue.getLast()
            return true
        } catch {
            return false
        }
    }
    
}
