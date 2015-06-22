//
//  SimpleCharNBack.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

class SimpleCharNBack : NBackRule {
    
    var N:Int = 1
    
    let chars:String = "ABCDEFGHIJKLMNOPQRSTUVWXY"
    
    init() {
    }
    
    func getNext() -> String {
//        let range = self.chars.characters.count
        let range = 2
        let rand = RandomUtil.randIntRange(0, to: range)
        return "\(self.chars[advance(self.chars.startIndex, rand)])"
    }
    
    func isMatch() -> Bool {
        return true
    }
    
}
