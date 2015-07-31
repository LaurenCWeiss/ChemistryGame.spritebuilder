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
//    var nextLevelName: String!
    var oxygenCounter: Int = 0
    var hydrogenCounter: Int = 0
    var carbonCounter: Int = 0
    var goal: Int = 0
    var smallLabel: String = " "
    var careerUpSmallLabel: String = " "
    var careerUpSmallLabelForLevel: String = ""
    var level: Int = 0
    var magnitude:CGPoint = CGPointZero
    var spawnThese: [Int] = []
    var ElementImage1: Int = 0
    var ElementImage2: Int = 0
    var ElementImage3: Int = 0
    var ElementImage4: Int = 0
    var ElementImage1Name: String!
    var ElementImage2Name: String!
    var ElementImage3Name: String!
    var ElementImage4Name: String!
    var label1Title: String!
    var label2Title: String!
    var label3Title: String!
    var label4Title: String!
    var label1FontName: String!
    var label1FontSize: CGFloat = 30.0
    var labelColor1: CGFloat = 0.0
    var labelColor2: CGFloat = 0.0
    var labelColor3: CGFloat = 0.0
    var labelColor4: CGFloat = 0.0
    var randomMin: Int = 0
    var randomMax: Int = 0
    
    var counters = [String: Int]()
    
    var MyNewCareerScientistImage: String!
    
    
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
        //numbers of atoms of elements
 
        var level1 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level1.hydrogenCounter = 8
        
        
        // How many of an element do you have left
        level1.counters["Oxygen"] = 1
        level1.counters["Hydrogen"] = 2
    
//        level1.carbonCounter = 0
        level1.goal = 3
        level1.smallLabel = "Water"
        level1.level = 1
        level1.ElementImage1 = 1
        level1.ElementImage2 = 1
        level1.ElementImage1Name = "Art Assets/Hydrogen.png"
        level1.ElementImage2Name = "Art Assets/Oxygen.png"
        
        level1.magnitude = ccp(0,30)
        level1.spawnThese = [3,1,2,3]
        level1.randomMin = 1
        level1.randomMax = 3
        
        
        //add intern career level
        level1.careerUpSmallLabel = "Congrats! You're an intern!"
        level1.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        //career level scene from main menu
        level1.careerUpSmallLabelForLevel = "Intern"
        
        levels.append(level1)
        
        
        var level2 = Data()
//        level2.oxygenCounter = 2
//        level2.hydrogenCounter = 0
        level2.goal = 2
        level2.level = 2
        level2.smallLabel = "Oxygen gas"
        level2.magnitude = ccp(50,30)
        level2.spawnThese = [1,1,1,1,2]

        levels.append(level2)
        
//        var level3 = Data()
//        level3.hydrogenCounter = 2
//        level3.oxygenCounter = 5
//        level3.goal = 7
//        level3.level = 3
//        level3.smallLabel = "Water"
//
//
//        levels.append(level3)
//        
//        var level4 = Data()
//        level4.hydrogen = 1
//        level4.oxygen = 4
//        level4.goal = 5
//        level4.level = 4
//        level4.smallLabel = "Water"
//
//
//        levels.append(level4)
//        
//        var level5 = Data()
//        level5.hydrogen = 1
//        level5.oxygen = 4
//        level5.goal = 5
//        level5.level = 4
//        level5.smallLabel = "Water"
//
//        
//        levels.append(level5)
//        
//        var level6 = Data()
//        level6.hydrogen = 1
//        level6.oxygen = 4
//        level6.goal = 5
//        level6.level = 4
//        level6.smallLabel = "Water"
//
//        
//        levels.append(level6)
//        
//        var level7 = Data()
//        level7.hydrogen = 1
//        level7.oxygen = 4
//        level7.goal = 5
//        level7.level = 4
//        level7.smallLabel = "Water"
//
//        
//        levels.append(level7)
//        
//        var level8 = Data()
//        level8.hydrogen = 1
//        level8.oxygen = 4
//        level8.goal = 5
//        level8.level = 4
//        level8.smallLabel = "Water"
//  
//        
//        levels.append(level8)
//        

        

    }

}