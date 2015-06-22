//
//  TypeUtil.swift
//  NBackWorld
//
//  Created by Peter Arato on 22/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import Foundation

func ^ (left: Bool, right: Bool) -> Bool{
    return (left && !right) || (!left && right)
}

infix operator ~^ {}
func ~^ (left: Bool, right: Bool) -> Bool{
    return (left && right) || (!left && !right)
}
