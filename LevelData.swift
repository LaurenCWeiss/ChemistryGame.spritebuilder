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
    var carbon: Int = 0
    var goal: Int = 0
    var smallLabel: String = " "
    var level: Int = 0
    var magnitude:CGPoint = CGPointZero
    var spawnThese: [Int] = []
    
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
        level1.carbon = 0
        level1.goal = 3
        level1.smallLabel = "Water"
        level1.level = 1
        level1.magnitude = ccp(0,30)
        level1.spawnThese = [1,2,3]
        
        levels.append(level1)
        
        var level2 = Data()
        level2.oxygen = 2
        level2.hydrogen = 1
        level2.goal = 3
        level2.level = 2
        level2.smallLabel = "Oxygen gas"
        level2.magnitude = ccp(50,30)
        level2.spawnThese = [1,1,1,1,2]

        levels.append(level2)
        
        var level3 = Data()
        level3.hydrogen = 2
        level3.oxygen = 5
        level3.goal = 7
        level3.level = 3
        level3.smallLabel = "Water"


        levels.append(level3)
        
        var level4 = Data()
        level4.hydrogen = 1
        level4.oxygen = 4
        level4.goal = 5
        level4.level = 4
        level4.smallLabel = "Water"


        levels.append(level4)
        
        var level5 = Data()
        level5.hydrogen = 1
        level5.oxygen = 4
        level5.goal = 5
        level5.level = 4
        level5.smallLabel = "Water"

        
        levels.append(level5)
        
        var level6 = Data()
        level6.hydrogen = 1
        level6.oxygen = 4
        level6.goal = 5
        level6.level = 4
        level6.smallLabel = "Water"

        
        levels.append(level6)
        
        var level7 = Data()
        level7.hydrogen = 1
        level7.oxygen = 4
        level7.goal = 5
        level7.level = 4
        level7.smallLabel = "Water"

        
        levels.append(level7)
        
        var level8 = Data()
        level8.hydrogen = 1
        level8.oxygen = 4
        level8.goal = 5
        level8.level = 4
        level8.smallLabel = "Water"
  
        
        levels.append(level8)
        

        
        var level15 = Data()
        level15.hydrogen = 1
        level15.oxygen = 4
        level15.goal = 5
        level15.level = 4
        level15.smallLabel = "Water"
        
        
        levels.append(level15)
       
    
        
        
        
    }

}