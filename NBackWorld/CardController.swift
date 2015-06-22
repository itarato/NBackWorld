//
//  CardController.swift
//  NBackWorld
//
//  Created by Peter Arato on 21/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import UIKit

class CardController : UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.label.text = "loading..."
    }
    
    func present(text: String) -> Void {
        self.label.text = text
    }
    
}
