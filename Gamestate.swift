//
//  Gamestate.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/12/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gamestate {
    
    static let sharedInstance = Gamestate()
    
    //level up constants
    let internLevel = 1
<<<<<<< HEAD
    let associateLevel = 5
     let researcherLevel = 10
    let technicianLevel = 15
    let seniorScientistLevel = 20
    let principleScientistLevel = 25
    let researchFellowLevel = 27
    let einsteinLevel = 30
    
    var highestLevelNumberCompleted = 1
    var currentLevelNumber = 1
 
    
    var passed:[Bool] = [] {
        didSet {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(passed, forKey: "passed")
            defaults.synchronize()
        }

    }
=======
    let researcherLevel = 5
    var highestCompletedLevel = 1
//    var passed:[Bool] = []
    
    //array of 30 levels all defaulted to passed being false
    
    var passed:[Bool] = []
>>>>>>> origin/myNewBranch
    init() {
<<<<<<< HEAD
<<<<<<< HEAD
        let defaults = NSUserDefaults.standardUserDefaults()
        if let result = defaults.objectForKey("passed") as? [Bool] {
            passed = result
        } else {
            for i in 1...30 {
                passed.append(false)
            }
=======
    init() {
        
        for i in 1...30 {
            passed.append(false)
>>>>>>> origin/myNewBranch
=======
    var passed:[Bool] = []
    init() {
        for i in 1...30 {
            passed.append(false)
>>>>>>> parent of a259960... STARS ARE WORKING
=======
        for i in 1...30 {
            passed.append(false)
>>>>>>> parent of a259960... STARS ARE WORKING
=======
        for i in 1...30 {
            passed.append(false)
>>>>>>> parent of a259960... STARS ARE WORKING
        }
        
    }
    
    var levelUpData: (text: String, imageName: String) {
<<<<<<< HEAD
       
        
        switch highestLevelNumberCompleted {
//        case internLevel...researcherLevel - 1:
//            return ("You're an intern!", "Art Assets/Scientist1.png")
//        case researcherLevel:
//            return ("You're a researcher!", "Art Assets/Scientist2.png")
//        default:
//            return ("You already leveled up!", "Art Assets/Scientist1.png")
            
        case internLevel...associateLevel - 1:
            
            return ("You're an intern!", "Art Assets/Scientist0.png")
            
        case associateLevel...researcherLevel-1:
            
            return ("You're an associate!", "Art Assets/Scientist1.png")
            
        case researcherLevel...technicianLevel-1:
            
=======
        switch highestCompletedLevel {
        case 0...internLevel:
            return ("You're an intern!", "Art Assets/Scientist1.png")
        case (internLevel + 1)...researcherLevel:
>>>>>>> origin/myNewBranch
            return ("You're a researcher!", "Art Assets/Scientist2.png")
            
        case technicianLevel...seniorScientistLevel-1:
            
            return ("You're a technician!", "Art Assets/Scientist3.png")
            
        case seniorScientistLevel...principleScientistLevel-1:
            
            return ("You're a senior scientist!", "Art Assets/Scientist4.png")
            
        case principleScientistLevel...researchFellowLevel-1:
            
            return ("You're a principle scientist!", "Art Assets/Scientist5.png")
            
        case researchFellowLevel...einsteinLevel-1:
            
            return ("You're a research fellow!", "Art Assets/Scientist6.png")
            
        case einsteinLevel:
            
            return ("YOU ARE EINSTEIN!", "Art Assets/Scientist7.png")
            
            
            
        default:
            
            return ("You already leveled up!", "Art Assets/Scientist7.png")
            
            
            
            
            
        }
            

    }
}