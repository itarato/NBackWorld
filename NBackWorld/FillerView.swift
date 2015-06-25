//
//  FillerView.swift
//  NBackWorld
//
//  Created by Peter Arato on 25/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import UIKit

class FillerView : UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLog("Layout subview view")
        NSLog("\(self.frame.height)");
        NSLog("\(self.frame.width)");
        for v in self.subviews {
            v.bounds = self.bounds
            v.frame.origin.x = 0
            v.frame.origin.y = 0
        }
    }
    
}
