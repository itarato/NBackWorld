//
//  NBackRuleConfiguration.swift
//  NBackWorld
//
//  Created by Peter Arato on 28/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

class NBackRuleConfiguration {

    private var _N:Int = 1
    var N:Int {
        get {
            return self._N
        }
        set {
            if newValue >= 1 {
                self._N = newValue
            }
        }
    }
    
    private var _range:Int = 2
    var range:Int {
        get {
            return self._range
        }
        set {
            if newValue >= 2 {
                self._range = newValue
            }
        }
    }
    
    static var selections:[String:String] = [
        "Alphabet": "ABCDEFGHIJKLMNOPQRSTUVWXY",
        "Numbers": "0123456789",
        "Heads": "🐶🐱🐻🐷🐼🐭🐹🐮🐯🐰",
        "Card": "♠️♣️♥️♦️",
        "Colors": "🔴🔵⚫️⚪️",
        "Nature": "🍄🌹🍀🌵🌲🌴🌼🌻",
        "Food": "🍣🍓🍆🍤🍟🍏🍒",
    ]
    
    var selection:String!
    
    init(N: Int = 1, range: Int = 2, selection: String = "Alphabet") {
        self.N = N
        self.range = range
        self.selection = selection
    }
    
}
