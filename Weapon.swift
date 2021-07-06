//
//  Weapon.swift
//  FGF
//
//  Created by Aurélien Waxin on 19/04/2021.
//

import Foundation

// Classe d'armes

class Weapon {
    
    var name : String
    var damage : Int
    
    init(name:String, damage:Int){
        
        self.name = name
        self.damage = damage
    }
    
    // Fonction description de l'arme
    func description(){
        print("His damage points are : \(self.damage) dg")
    }
}




final class Sword : Weapon {
    
    init(){
        
        super.init(name: "Sword", damage: 25)
    }
}

final class Knife : Weapon {
    
    init(){
        
        super.init(name: "Knife", damage: 15)
    }
}

final class Stick : Weapon {
    
    init(){
        
        super.init(name: "Stick", damage: 10)
    }
}

final class Axe : Weapon {
    
    init(){
        
        super.init(name: "Axe", damage: 30)
    }
}

final class Bow : Weapon {
    
    init(){
        
        super.init(name: "Bow", damage: 15)
    }
}

final class Excalibur : Weapon {
    
    init() {
        
        super.init(name: "Excalibur", damage: 50)
    }
}
