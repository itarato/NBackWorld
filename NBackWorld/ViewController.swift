//
//  ViewController.swift
//  NBackWorld
//
//  Created by Peter Arato on 20/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var rule:NBackRule?
    var score:Int = 0;
    var cardCtrl:CardController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cardCtrl = CardController(nibName: "CardView", bundle: nil)
        self.view.addSubview(self.cardCtrl!.view)
        
        let frame:CGRect = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height - 100)
        self.cardCtrl?.view.frame = frame
        
        self.rule = SimpleCharNBack()
        
        self.refreshDisplay()
    }
    
    func refreshDisplay() {
        self.scoreLabel.text = ":: \(self.score) ::"
        self.cardCtrl?.present(self.rule!.getNext())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onHitNo(sender: UIButton) {
        self.checkResult(false)
    }
    
    @IBAction func onHitYes(sender: UIButton) {
        self.checkResult(true)
    }
    
    private func checkResult(tip: Bool) {
        if (tip && self.rule!.isMatch()) || (!tip && !self.rule!.isMatch()) {
            self.score += 1
        } else {
            self.score -= 2
        }
        self.refreshDisplay()
    }

}

