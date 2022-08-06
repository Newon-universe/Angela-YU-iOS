//
//  main.swift
//  asPractice
//
//  Created by Kim Yewon on 2022/08/06.
//

import Foundation

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}


class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breathUnderWater() {
        print("Breathing under water.")
    }
}

let angela = Human(n: "Angela Yu")
let jack = Human(n: "Jack Bauer")
let nemo = Fish(n: "Nemo")
let num: NSNumber = 12
let word: NSString = "abc"

let neighbours: [Animal] = [angela, jack, nemo]
let nsobject: [NSObject] = [num, word]

func findNemo(from animals: [Animal]){
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            let fish = animal as! Fish
            fish.breathUnderWater()
            
            let animalFish = fish as Animal
            print(animalFish.name)
        }
    }
}

findNemo(from: neighbours)

if let fish = neighbours[1] as? Fish {
    fish.breathUnderWater()
} else {
    print("Casting has failed")
}


//as? as! use for down cast --- superclass to subclass can be failed, so need ? or !
//as uses for up cast --- subclass to superclass casiting will be never failed, so no need ? or !
