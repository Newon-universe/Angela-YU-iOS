//
//  Item.swift
//  Todoey
//
//  Created by Kim Yewon on 2022/08/15.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Item {
    var title: String
    var done: Bool
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
