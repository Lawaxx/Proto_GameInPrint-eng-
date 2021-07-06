//
//  Players.swift
//  FGF
//
//  Created by Aurélien Waxin on 19/04/2021.
//

import Foundation



final class Player {
    init(playerNumber: Int, team: [Character] = []) {
        self.playerNumber = playerNumber
        self.team = team
    }
    
    
    var playerNumber : Int
    var team : [Character] = []
    var teamAlive : Bool {
        team.map { $0.isDead }.isEmpty
    }
    //Ajout de character
    func addCharacter(_ character: Character){
        team.append(character)
    }
    var diedCharacter : [Character] = []
    
    
    //Fonction Selection de personnage
    func selectCharacter() -> Character {
        for (index, character) in team.enumerated() {
            print("Character #\(index + 1)  \(character.name) \(character.life)PV \(character.weapon.damage)dg")
        }
        
        // Check si le choix n'est pas mort
        if let choice = readLine(){
            if let choiceInt = Int(choice) {
                if choiceInt >= 1 && choiceInt <= team.count {
                    let character = team[choiceInt - 1]
                    if character.isDead {
                        print("This character is dead !")
                    } else {
                        return team[choiceInt - 1]
                    }
                }
            }
        }
        
        return selectCharacter()
    }
    
    // Verification si la team est encore en vie 
    func teamAlive(player : Player) -> Bool {
        for (index , Character) in player.team.enumerated() {
            if Character.life < 0 {
                diedCharacter.append(Character)
                player.team.remove(at: index)
            }
        }
        if player.team.count == 0 {
            return false
        }
        return true
    }
    
    
    
    
}
