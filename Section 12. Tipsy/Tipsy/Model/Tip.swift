//
//  Tip.swift
//  Tipsy
//
//  Created by Kim Yewon on 2022/07/26.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Tip {
    var value: Double
    var perTip: Double
    var splitPerson: Int
    
    mutating func calculate(total: Double, person: Int, tipPercent: Double) {
        value = total / Double(person)
        value *= tipPercent
    }
}
