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
    @IBOutlet weak var cardWrapperView: UIView!
    
    var rule:NBackRule?
    var score:Int = 0;
    var cardCtrl:CardController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cardCtrl = CardController(nibName: "CardView", bundle: nil)
        self.cardWrapperView.addSubview(self.cardCtrl!.view)
        self.cardCtrl?.view.frame = self.cardWrapperView.frame
        
        self.rule = SimpleCharNBack(N: 1)
        
        self.refreshDisplay()
    }
    
    func refreshDisplay() {
        self.scoreLabel.text = "NBackWorld | Score: \(self.score)"
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

