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
    
    var N:Int = 1
    var rangeMax:Int {
        get {
            return self.chars.characters.count
        }
    }
    
    func getNext() -> String {
        let rand = RandomUtil.randIntRange(0, to: self.range)
        return "\(self.chars[advance(self.chars.startIndex, rand)])"
    }
    
    func isMatch() -> Bool {
        return true
    }
    
}
