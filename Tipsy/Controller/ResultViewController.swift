  //
  //  ResultViewController.swift
  //  Tipsy
  //
  //  Created by Lucas Couto on 19/07/23.
  //  Copyright © 2023 The App Brewery. All rights reserved.
  //

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!
  
  var totalPerPerson: String?
  var peopleNumber: String?
  var tipPerc: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    totalLabel.text = totalPerPerson
    settingsLabel.text = "Split between \(peopleNumber ?? "0") people, with \(tipPerc ?? "0%") tip."
  }
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
