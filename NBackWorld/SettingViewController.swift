//
//  SettingViewController.swift
//  NBackWorld
//
//  Created by Peter Arato on 28/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

import UIKit

class SettingViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var cardVariationLabel: UILabel!
    @IBOutlet weak var nBackLabel: UILabel!
    @IBOutlet weak var cardVariationPlusMinus: UIStepper!
    @IBOutlet weak var nBackPlusMinus: UIStepper!
    @IBOutlet weak var selectionPickerView: UIPickerView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = ConfigurationCenter.defaultCenter().config
        self.cardVariationPlusMinus.value = Double(config.range)
        self.nBackPlusMinus.value = Double(config.N)
        
        let selectionKeys = NBackRuleConfiguration.selections.keys
        self.selectionPickerView.selectRow(selectionKeys.array.indexOf(config.selection)! as Int, inComponent: 0, animated: true)
        
        refreshDisplay()
    }
    
    @IBAction func onHitCardVariationStepper(sender: UIStepper) {
        ConfigurationCenter.defaultCenter().config.range = Int(sender.value)
        refreshDisplay()
    }
    
    @IBAction func onHitNBackStepper(sender: UIStepper) {
        ConfigurationCenter.defaultCenter().config.N = Int(sender.value)
        refreshDisplay()
    }
    
    private func refreshDisplay() {
        self.nBackLabel!.text = String(format: "%0.0f", self.nBackPlusMinus.value)
        self.cardVariationLabel!.text = String(format: "%0.0f", self.cardVariationPlusMinus.value)
    }
    
    @IBAction func onHitDone() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Picker view elements.
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NBackRuleConfiguration.selections.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let keys = NBackRuleConfiguration.selections.keys
        return NBackRuleConfiguration.selections[keys[advance(keys.startIndex, row)]]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let keys = NBackRuleConfiguration.selections.keys
        ConfigurationCenter.defaultCenter().config.selection = keys[advance(keys.startIndex, row)]
    }
}
