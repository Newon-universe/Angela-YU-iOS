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


    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let currentRatio = Double(sender.currentTitle!.dropLast())! / 100
        print(currentRatio)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if sender.value > 12 {
            sender.value = 12
        }
        
        let value = String(Int(sender.value))
        
        splitNumberLabel.text = value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billTextField)
    }
}

