//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Jonathan Porta on 8/25/14.
//  Copyright (c) 2014 Jonathan Porta. All rights reserved.
//

import Foundation

class TipCalculatorModel {
  var subtotal: Double {
    get {
      return total / (taxRate + 1)
    }
  }
  var taxRate: Double
  var total: Double
  
  init(total:Double, taxRate:Double) {
    self.total = total
    self.taxRate = taxRate
  }
  
  func calculateTipByPercentage(tipPercentage:Double) -> Double {
    return subtotal * tipPercentage
  }
  
  func getPossibleTips() -> Dictionary<Int,Double>{
    let possibleTips = [0.15, 0.18, 0.20]
    
    var toReturn = Dictionary<Int, Double>()
    for possibleTip in possibleTips {
      let intTipPercentage = Int(possibleTip * 100)
      toReturn[intTipPercentage] = calculateTipByPercentage(possibleTip)
      println("\(possibleTip * 100)%: \(calculateTipByPercentage(possibleTip))")
    }
    return toReturn
  }
}