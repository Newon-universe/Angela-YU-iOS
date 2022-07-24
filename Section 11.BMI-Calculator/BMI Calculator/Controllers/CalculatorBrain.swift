//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Kim Yewon on 2022/07/24.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    private var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
        let color = (underweight: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), noramlWegiht: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), overWeight: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: color.underweight)
        } else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: color.noramlWegiht)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: color.overWeight)
        }
        
    }
    
    func getColor() -> UIColor {
        bmi?.color ?? UIColor.white
    }
    func getAdvice() -> String {
        bmi?.advice ?? "Error"
    }
    
}
