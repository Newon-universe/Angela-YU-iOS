//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var calculator = CalculatorLogic()
    // property initializers run before 'self' is available
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var isFinishedTypingNumber: Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        guard let calcMethod = sender.currentTitle else { fatalError("Something is wrong in here") }
    
        guard let result = calculator.calculate(symbol: calcMethod) else { return }
        displayValue = result
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        guard let numValue = sender.currentTitle else { return }
        
        if numValue == "0" && displayValue == 0 {
            return
        }
        
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else {
            if numValue == "." && displayLabel.text?.contains(".") == true {
                return
            }
            
            displayLabel.text! += numValue
        }
    }
    
}
