//
//  NBackRule.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

protocol NBackRule {
    
    init(config: NBackRuleConfiguration)
    
    func getNext() -> String
    
    func isMatch() -> Bool
    
    func isGuessingStarted() -> Bool
    
}
