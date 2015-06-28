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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    var rule:NBackRule?
    var score:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.noButton.hidden = true
        self.yesButton.hidden = true
        
        self.rule = SimpleCharNBack(config: ConfigurationCenter.defaultCenter().config)
        self.refreshDisplay()
    }
    
    func refreshDisplay() {
        self.scoreLabel.text = "NBackWorld | Score: \(self.score)"
        self.clearCardWrapperView()
        self.addNewCard()
    }

    private func clearCardWrapperView() {
        for cardSubView in self.cardWrapperView.subviews {
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                cardSubView.frame.origin.x = self.cardWrapperView.frame.width
                }, completion: { (Bool) -> Void in
                    cardSubView.removeFromSuperview()
            })
        }
    }
    
    private func addNewCard() {
        let cardCtrl = CardController(nibName: "CardView", bundle: nil)
        self.cardWrapperView.addSubview(cardCtrl.view)
        cardCtrl.present(self.rule!.getNext())
        cardCtrl.view.frame.size = self.cardWrapperView.frame.size
        cardCtrl.view.frame.origin.x = -self.cardWrapperView.frame.width
        
        UIView.animateWithDuration(0.3) { () -> Void in
            cardCtrl.view.frame.origin.x = 0
        }
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
    
    @IBAction func onHitNext() {
        self.refreshDisplay()
        if self.rule!.isGuessingStarted() {
            self.nextButton.hidden = true
            self.noButton.hidden = false
            self.yesButton.hidden = false
        }
    }
    
    @IBAction func onHitEnd() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func showFailAnimation() {
        let redView = UIView(frame: self.view.frame)
        redView.backgroundColor = UIColor.redColor()
        redView.alpha = 0.0
        
        self.view.addSubview(redView)
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            redView.alpha = 5.0
        }, completion: { (Bool) -> Void in
            self.hideFailAnimtion(redView)
        })
    }
    
    private func hideFailAnimtion(redView: UIView) {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            redView.alpha = 0.1
        }, completion: { (Bool) -> Void in
            redView.removeFromSuperview()
        })
    }
    
    private func checkResult(tip: Bool) {
        if (tip && self.rule!.isMatch()) || (!tip && !self.rule!.isMatch()) {
            self.score += 1
        } else {
            self.score -= 2
            self.score = self.score < 0 ? 0 : self.score
            self.showFailAnimation()
        }
        self.refreshDisplay()
    }

}
