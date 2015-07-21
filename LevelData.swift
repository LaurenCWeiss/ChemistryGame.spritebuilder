//
//  Levels.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

//Data not inheriting from anything, and it makes logical sense that data objects are unique, so we
//make defined a struct, as opposed to a class
struct Data {
    var nextLevelName: String!
    var oxygen: Int = 0
    var hydrogen: Int = 0
    var nitrogen: Int = 0
    var potassium: Int = 0
    var goal: Int = 0
    var smallLabel: String = " "
    var level: Int = 0
    
}

//TODO: make singleton
struct LevelData {
    private static let defaults = NSUserDefaults.standardUserDefaults()
    
    //init to level - 1 (because array index starting at 0)
   //saves the level that the user was most currently on so that when they open their phone again the level has been saved!
    static var curLevel: Int {
        get {
           return defaults.integerForKey("curLevel")
       
        }
        //could say set(newLevel) but then we would have to put newLevel in the setter which would be bad code when we can just use newValue that is built into the systme
        set {
            defaults.setInteger(newValue, forKey: "curLevel")
            println(curLevel)
        }
    }
    
    var levels:[Data] = [Data]()
    
    init() {
        var level1 = Data()
        level1.hydrogen = 2
        level1.oxygen = 1
        level1.goal = 3
        level1.smallLabel = "Water"
        level1.level = 1
        
        levels.append(level1)
        
        var level2 = Data()
        level2.oxygen = 2
        level2.goal = 2
        level2.level = 2
        level2.smallLabel = "Oxygen gas"

        levels.append(level2)
        
        var level3 = Data()
        level3.hydrogen = 2
        level3.oxygen = 5
        level3.goal = 7
        level2.level = 3
        level3.smallLabel = "Water"

        levels.append(level3)
        
        var level4 = Data()
        level4.hydrogen = 1
        level4.oxygen = 4
        level4.goal = 5
        level2.level = 4
        level4.smallLabel = "Water"

        levels.append(level4)
    }

}