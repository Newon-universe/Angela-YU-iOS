//
//  main.swift
//  ClassesDemo
//
//  Created by Kim Yewon on 2022/07/23.
//

var skeleton = Enemy(health: 100, attackStrength: 10)
skeleton.takeDamage(amount: 15)

var skeleton2 = skeleton

skeleton.takeDamage(amount: 10)
print(skeleton2.health)
