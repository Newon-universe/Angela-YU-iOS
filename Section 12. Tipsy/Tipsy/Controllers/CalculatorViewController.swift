//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var total = "0.0"
    var currentRatio = 0
    var numberOfPeople = 2

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let currentRatio = Double(sender.currentTitle!.dropLast())! / 100
        print(currentRatio)
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if sender.value > 12 {
            sender.value = 12
        }
        
        let value = String(Int(sender.value))
        
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = value
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let perCost = Double(billTextField.text!)! / Double(splitNumberLabel.text!)!
        
        var perResult = perCost
        
        if tenPctButton.isSelected {
            perResult *= 1.1
            currentRatio = 10
        } else if twentyPctButton.isSelected {
            perResult *= 1.2
            currentRatio = 20
        }
        
        total = String(format: "%.02f", perResult)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = total
            destinationVC.tip = currentRatio
            destinationVC.split = numberOfPeople
        }
    }
}

