  //
  //  ViewController.swift
  //  Tipsy
  //
  //  Created by Angela Yu on 09/09/2019.
  //  Copyright © 2019 The App Brewery. All rights reserved.
  //

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var senderButton: UIStepper!
  
  var calculatorBrain = CalculatorBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    splitNumberLabel.text = String(format: "%.0f", senderButton.value)
      // Do any additional setup after loading the view.
  }
  
  @IBAction func tipChanged(_ sender: UIButton) {
    sender.isSelected = true
    billTextField.endEditing(true)
    
    if sender == zeroPctButton{
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = false
    }else if sender == tenPctButton{
      zeroPctButton.isSelected = false
      twentyPctButton.isSelected = false
    } else {
      zeroPctButton.isSelected = false
      tenPctButton.isSelected = false
    }
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    splitNumberLabel.text = String(format: "%.0f", sender.value)
  }
  
  
  @IBAction func calculatePressed(_ sender: UIButton) {
        
    let totalTextBill = billTextField.text ?? "0.0"
    let peopleNumber = senderButton.value
    var perc: Double?
    
    if zeroPctButton.isSelected {
      perc = 0.0
    }else if tenPctButton.isSelected {
      perc = 0.1
    }else{
      perc = 0.2
    }
    
    calculatorBrain.calculateBill(totalBill: totalTextBill, tipPerc: perc!, peopleNumber: peopleNumber)
    
    self.performSegue(withIdentifier: "goToResult", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult"{
      let destinationVC = segue.destination as! ResultViewController
      destinationVC.totalPerPerson = calculatorBrain.getTotalPerPerson()
      destinationVC.peopleNumber = calculatorBrain.getPeopleNumber()
      destinationVC.tipPerc = calculatorBrain.getTipPerc()
    }
  }
  
}

