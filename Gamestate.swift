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
    let researcherLevel = 5
    var highestCompletedLevel = 1
//    var passed:[Bool] = []
    
    //array of 30 levels all defaulted to passed being false
    
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
        }
        
    }
    
    var levelUpData: (text: String, imageName: String) {
        switch highestCompletedLevel {
        case 0...internLevel:
            return ("You're an intern!", "Art Assets/Scientist1.png")
        case (internLevel + 1)...researcherLevel:
            return ("You're a researcher!", "Art Assets/Scientist2.png")
        default:
            return ("add more stuff", "Art Assets/Scientist1.png")
        }
    }
}