//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jonathan Porta on 8/25/14.
//  Copyright (c) 2014 Jonathan Porta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  let tipCalculator = TipCalculatorModel(total: 35.89, taxRate: 0.085)
  
  @IBOutlet var totalTextField : UITextField!
  @IBOutlet var taxPercentageSlider : UISlider!
  @IBOutlet var taxPercentageLabel : UILabel!
  @IBOutlet var resultsTextView : UITextView!
  
  func refreshUI() {
    totalTextField.text = String(format: "%0.2f", tipCalculator.total)
    taxPercentageSlider.value = Float(tipCalculator.taxRate) * 100.0
    taxPercentageLabel.text = "Tax Percentage (\(Int(taxPercentageSlider.value)))"

    var possibleTips = tipCalculator.getPossibleTips()
    var results = ""
    for (tipPercent, tipValue) in possibleTips {
      results += "\(tipPercent)%: \(tipValue)\n"
    }
    resultsTextView.text = results
    resultsTextView.textAlignment = NSTextAlignment.Center
  }
  
  @IBAction func calculate(sender : AnyObject) {
    tipCalculator.taxRate = Double(taxPercentageSlider.value) / 100.0
    tipCalculator.total = Double((totalTextField.text as NSString).doubleValue)
    refreshUI()
  }
  
  @IBAction func viewTapped(sender : AnyObject) {
    totalTextField.resignFirstResponder()
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      refreshUI()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
}