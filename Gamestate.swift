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
    
    let internLevel = 1
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
    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let result = defaults.objectForKey("passed") as? [Bool] {
            passed = result
        } else {
            for i in 1...30 {
                passed.append(false)
            }
        }
    }
    
    var levelUpData: (text: String, imageName: String) {
       
        
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