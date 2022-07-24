//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBriain = CalculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderTouch(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", heightSlider.value) + "m"
        weightLabel.text = String(Int(weightSlider.value)) + "Kg"
    }
    
    @IBAction func caculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
                
        calculatorBriain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bmiValue = calculatorBriain.getBMIValue()
            destinationVC.advice = calculatorBriain.getAdvice()
            destinationVC.color = calculatorBriain.getColor()
        }
    }
}

