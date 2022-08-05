struct Enemy {
    var health:Int {
        willSet {
            print("His health is changed \(health) to \(newValue)")
        }
    }
    var attackStrength: Int
    
    init(health: Int, attackStrength : Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    
    mutating func takeDamage(amount: Int){
        self.health -= amount
    }
    
    func move() {
        print("Walk forwards.")
    }
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}


