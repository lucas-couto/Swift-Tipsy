//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Lucas Couto on 19/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

struct CalculatorBrain{
  
  var bill: Bill?
  var calculation: Double?
  
  mutating func calculateBill(totalBill: String, tipPerc: Double, peopleNumber: Double){
    
    let totalDoubleBill = Double(totalBill) ?? 0.0
    let peopleIntNumber = Int(peopleNumber)
    
    let totalPerPerson = (totalDoubleBill * (1 + tipPerc)) / peopleNumber
    bill = Bill(totalBill: totalDoubleBill, totalPerPerson: totalPerPerson, peopleNumber: peopleIntNumber, tipPerc: tipPerc)
  }
  
  func getTotalPerPerson() -> String {
    let totalPerPersonString = String(format: "%.2f", bill?.totalPerPerson ?? 0.0)
    return totalPerPersonString
  }
  
  func getPeopleNumber() -> String {
    let peopleNumberString = String(format: "%.0d", bill?.peopleNumber ?? 0.0)
    return peopleNumberString
  }
  
  func getTipPerc() -> String{
    let tipPerc = (bill?.tipPerc ?? 0.0) * 100
    let intTipPerc = Int(tipPerc)
    
    let tipPercString = "\(intTipPerc)%"
    return tipPercString
  }
  
  
}
