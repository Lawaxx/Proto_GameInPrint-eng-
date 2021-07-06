//
//  Character.swift
//  FGF
//
//  Created by Aurélien Waxin on 19/04/2021.
//

import Foundation



class Character {
    init(life: Int = 0, name: String = "", weapon: Weapon) {
        self.life = life
        self.name = name
        self.weapon = weapon
    }
    
    
    class var lifeMax : Int {
        return 100
    }
    var life : Int = 0
    var name : String = ""
    var weapon : Weapon
    var isDead : Bool {
        if life <= 0 {
            return true
        }
        return false
    }
    
    
    // Fonction basique d'attaque
    
    func attack(target: Character) {
        if target.isDead == false {
            target.life  -= weapon.damage
            print("")
            print("\(self.name) attack \(target.name) and withdraws \(self.weapon.damage) PV." )
            print("The life of \(target.name) is now : \(target.life) 🩸 ")
            print("")
        }
        if target.life <= 0 && target.isDead == true {
            target.life = 0
            print("")
            print(" ⚰️ \(target.name) is dead. He is removed from the game.")
            print("")
        }
        
        
    }
    // Fonction de soin 
    func actionOn(otherCharacter: Character){
        if otherCharacter.life == 100 {
            print("")
            print("The life of \(otherCharacter.name) is already full , he cannot be healed.")
            print("")
            return game.startBattle()
        }
        
        if otherCharacter.isDead == false && life <= 100 {
            otherCharacter.life += 15
            print ("\(self.name) returns 15 PV to \(otherCharacter.name)")
            print("The life of \(otherCharacter.name) is now : \(otherCharacter.life) ")
            print("")
        }
        if otherCharacter.isDead == true {
            otherCharacter.life = 0
            print("")
            print(" \(otherCharacter.name) is dead. He is removed from the game.")
        }
        
    }
    
}


