protocol CanFly {
    func fly()
    
}

class Bird {
    
    var isFemail = true
    
    func layEgg() {
        if isFemail {
            print("The bird makes a new bird in a shell.")
        }
    }
    
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle falps its wings and lifts off into the sky.")
    }
    
    func soar() {
        print("The eagle glids in the air using air currents.")
    }
    
    
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplance: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let myEagle = Eagle()
myEagle.fly()
//myEagle.layEgg()
//myEagle.soar()

let myPenguin = Penguin()
//myPenguin.layEgg()
//myPenguin.swim()
//myPenguin.fly()

let myPlane = Airplance()
myPlane.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)

