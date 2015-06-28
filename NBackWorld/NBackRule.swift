//
//  NBackRule.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

protocol NBackRule {
    
    var N:Int { set get }
    
    func getNext() -> String
    
    func isMatch() -> Bool
    
    func isGuessingStarted() -> Bool
    
}
