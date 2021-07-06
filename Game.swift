//
//  Game.swift
//  FGF
//
//  Created by Aurélien Waxin on 19/04/2021.
//

import Foundation



class Game {
    
    private let player1 = Player(playerNumber: 1)
    private let player2 = Player(playerNumber: 2)
    private var characterNames = [String]()
    private var diedCharacter = [Character]()
    private var battleRound = Int()
    
    
    // Annonce de debut de partie
    func startGame() {
        
        print (" 📯 WELCOME TO THE BATTLE ! 📯 ")
        print("")
        print("Before starting.. here are some rules :")
        print("")
        print ("Your fight will take place on a turn-based basis..")
        print ("Before fighting , you must compose a team of three characters..")
        print ("Each character will be equipped with his favorite weapon..")
        print ("The first player to run out of characters in his team, loses.")
        print("")
        print("")
        print ("Now.. Make your team ! ")
        print ("")
        game.createTeams()
        game.startBattle()
        game.statsEndGame()
    }
    
    
    // Fonction creation d'equipe
   private func createTeams(){
        
        for player in [player1, player2] {
            
            print("")
            print("PLAYER \(player.playerNumber) , choose a character :")
            print ("")
            
            while player.team.count < 3 {
                print ("1: 🛡 Warrior (100 PV / Sword 25dg)  2: 🧙🏼‍♂️ Priest (100 PV / Stick 10dg)  3: 🔪 Thief (100 PV / Knife 15dg)  4: 🪓 Lumberjack (100 PV/ Axe 30dg)  5: 🏹 Bowman (100 PV / Bow 15dg) ")
                let choice = readLine()!
                if Int(choice) == Int(choice) {
                    switch Int(choice) {
                    
                    case 1 :
                        askNameValid(CharacterDescription: "You chose 🛡 Warrior, give him a name :", player: player, type: 1)
                        
                    case 2 :
                        askNameValid(CharacterDescription: "You chose 🧙🏼‍♂️ Priest, give him a name :", player: player, type: 2)
                        
                    case 3 :
                        askNameValid(CharacterDescription: "You chose 🔪 Thief, give him a name :", player: player, type: 3)
                        
                    case 4 :
                        askNameValid(CharacterDescription: "You chose 🪓 Lumberjack, give him a name :", player: player, type: 4)
                        
                    case 5 :
                        askNameValid(CharacterDescription: "You chose 🏹 Bowman, give him a name :", player: player, type: 5)
                        
                    default :
                        print("")
                        print (" ❌ Choose a valid character ")
                        
                    }
                    if player.team.count == 0 || player.team.count <= 2 {
                        print("")
                        print("Choose another fighter :")
                    }
                    if player2.team.count == 3 {
                        print("")
                        print("Your teams are ready..")
                        print("Now up to..")
                        print("")
                        print("⚔️ THE FIGHT ! ⚔️ ")
                        print("")
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    
    //Confirme le choix de character et lui demande un nom valide
    private func askNameValid(CharacterDescription : String , player : Player, type : Int) {
        print(CharacterDescription)
        var characterNameisInvalid = true
        while characterNameisInvalid == true {
            let characterName = readLine()!
            if characterNameIsValid(name: characterName) {
                characterNameisInvalid = false
                let character: Character
                switch type {
                case 1:
                    character = Warrior(name: characterName)
                case 2:
                    character = Priest(name: characterName)
                case 3:
                    character = Thief(name: characterName)
                case 4:
                    character = Lumberjack(name: characterName)
                case 5:
                    character = Bowman(name: characterName)
                default:
                    character = .init(life: 0, name: "", weapon: Weapon.init(name: "", damage: 0))
                }
                player.team.append(character)
                characterNames.append(characterName)
            } else {
                print(" Choose a name : ")
            }
        }
        
    }
    
    
    //Check si le nom est valide
    private func characterNameIsValid (name: String) -> Bool {
        if name.count < 3 {
            print(" ❌ Invalid name ")
            return false
        }
        if characterNames.contains(name){
            print(" ⛔️ This name is already taken ")
            return false
        }
        return true
    }
    
    // Fonction tour de combat
    private func turnOfFight (attacker: Player, defender: Player)  {
        
        // Choix du character
        print("PLAYER \(attacker.playerNumber) Select a character to do the action :")
        print("")
        
        let attackingCharacter = attacker.selectCharacter()
        if Bool.random(){
            newWeaponFor(character: attackingCharacter)
        }
        
        print("")
        print("What action do you want him to do ? ")
        print("")
        print("1. ⚔️ Attack ")
        print("2. 🧪 Heal ")
        
        let action = readLine()!
        if Int(action) == Int(action) {
        switch Int(action) {
        case 1:
            print("")
            print("Select target 🎯 :")
            print("")
            let targetCharacter = defender.selectCharacter()
            
            attackingCharacter.attack(target: targetCharacter)
            
        case 2:
            print("")
            print("Select target 🎯 :")
            print("")
            let targetCharacter = attacker.selectCharacter()
            
            attackingCharacter.actionOn(otherCharacter: targetCharacter)
            
        default: print("")
                 print("Invalid choice...")
                 print("")
                 print("Next player !")
                 print("")
                 
            
        }
      }
    }
    
    
    //Fonction debut de bataille
    func startBattle(){
        fight()
    }
    // Fonction de bataille tour par tour
    private func fight() {
        while teamAlive(player: player1) && teamAlive(player: player2){
            
            turnOfFight(attacker: player1, defender: player2)
            battleRound += 1
            
            if teamAlive(player: player2){
                
                turnOfFight(attacker: player2, defender: player1 )
            }
        }
    }
    // Check si l'equipe est encore en vie
    private func teamAlive(player : Player) -> Bool {
        for (index , Character) in player.team.enumerated() {
            if Character.life <= 0 {
                diedCharacter.append(Character)
                player.team.remove(at: index)
            }
        }
        if player.team.count == 0 {
            return false
        }
        return true
    }
    
    //Attribution d'une arme aléatoire
    private func newWeaponFor(character: Character) {
        let newWeapon = Chest().randomWeapon()!
        
        print(newWeapon.description())
        print("")
        print("Do you want to use it ?")
        print("1: YES ")
        print("2: NO ")
        
        let response = readLine()!
        if Int(response) == Int(response){
        switch Int(response){
        case 1 : character.weapon = newWeapon
        case 2 : return
        default :
                print("Invalid choice ! The chest disappears... 💨 ")
                
            }
        }
    }
    // Fonction Statistique de fin de jeu 
    private func statsEndGame() {
        print("")
        print("")
        
        if teamAlive(player: player1) {
            print( " 🏆 Player 1 WIN ! ")
            print("")
            print("\(player1.team.forEach{element in print(element.name)}) are alive and won the battle ! ")
            print("Player 2 lost , there are no more character alive..")
        } else {
            print(" 🏆 Player 2 WIN ! ")
            print("")
            print("\(player2.team.forEach{element in print(element.name)}) are alive and won the battle ! ")
            print("Player 1 lost , there are no more character alive..")
        }
        
        print("")
        print(" 📜 Here are the stats of the game 📜 ")
        print("")
        print("Battle round : \(battleRound)")
        print("")
        print("Dead characters : ")
        print("")
        
        for  Character in diedCharacter {
            print("Name : \(Character.name), Life : \(Character.life) ")
        }
    }
}
