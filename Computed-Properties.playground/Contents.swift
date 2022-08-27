import Foundation

var pizzaInInches: Int = 10 {
    willSet {

    }
    didSet {
        if pizzaInInches > 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 33
print(pizzaInInches)

var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

// when you use computed property
// 1. should be var, const (let) doesn't make sense
// 2. should infer return type
// when you make method, if it doesn't have input and output,
// and all it does is execute a block of code then considier whether if you can instead use a computed property
// it will help you make less mistakes.
// minimize error, makes our code more dynamic, maintainable and easier to understand.

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
    set {
        print("numberOfSlices now has a new value which is \(newValue)")
    }
}


var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 4
print(numberOfPeople)
