//
//  Calculate.swift
//  Calculator
//
//  Created by Kim Yewon on 2022/08/31.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (num: Double, calculation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        guard let number = number else { return nil }
        
        switch symbol {
        case "+/-": return number * -1
        case "AC": return 0
        case "%": return number * 0.01
        case "=": return performTwoNumCalculation(n2: number)
        default:
            intermediateCalculation = (num: number, calculation: symbol)
            return nil
        }
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        guard let n1 = intermediateCalculation?.num, let operation = intermediateCalculation?.calculation else { fatalError() }
        
        switch operation {
        case "+": return n1 + n2
        case "-": return n1 - n2
        case "×": return n1 * n2
        case "÷": return n1 / n2
        default: return nil
        }
    }
}
