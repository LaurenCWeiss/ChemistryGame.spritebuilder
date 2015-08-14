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
    let researcherLevel = 5
    
    var highestLevelNumberCompleted = 1
    var currentLevelNumber = 1
    
    var passed:[Bool] = []
    init() {
        for i in 1...30 {
            passed.append(false)
        }
    }
    
    var levelUpData: (text: String, imageName: String) {
        switch highestLevelNumberCompleted {
        case internLevel...researcherLevel - 1:
            return ("You're an intern!", "Art Assets/Scientist1.png")
        case researcherLevel:
            return ("You're a researcher!", "Art Assets/Scientist2.png")
        default:
            return ("add more stuff", "Art Assets/Scientist1.png")
        }
    }
}