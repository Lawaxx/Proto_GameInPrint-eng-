//
//  Chest.swift
//  FGF
//
//  Created by Aurélien Waxin on 19/04/2021.
//

import Foundation



final class Chest {
    
    //Fonction attribution d'arme aléatoire 
    func randomWeapon() -> Weapon? {
        
        let randomNumber = Int.random(in: 1...6)
        
        if randomNumber == 1 {
            print(" 🎞 A Chest containing : 🗡 Sword : appears ")
            return Sword()
        }
        if randomNumber == 2 {
            print(" 🎞 A Chest containing : 🔪 Knife : appears ")
            return Knife()
        }
        if randomNumber == 3 {
            print(" 🎞 A Chest containing : 🦯 Stick : appears ")
            return Stick()
        }
        if randomNumber == 4 {
            print(" 🎞 A Chest containing : 🪓 Axe : appears ")
            return Axe()
        }
        if randomNumber == 5 {
            print(" 🎞 A Chest containing : 🏹 Bow : appears ")
            return Bow()
        }
        if randomNumber == 6 {
            print(" 🎞 A Chest containing : ⚡️ Excalibur : appears !")
            return Excalibur()
        }
        return nil
    }
}
