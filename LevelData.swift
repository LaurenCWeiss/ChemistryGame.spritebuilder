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
    var nitrogenCounter: Int = 0
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
    var smallOrderLabel: String = " "
    
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
            println(newValue)
        }
    }
    
    var levels:[Data] = [Data]()
    
    init() {
        //numbers of atoms of elements
 
        var level1 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level1.hydrogenCounter = 3
        level1.oxygenCounter = 5
        
        
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
        level1.careerUpSmallLabel = "You're an intern!"
        level1.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        //career level scene from main menu
        level1.careerUpSmallLabelForLevel = "Intern"
        
        //add an order label of what the user is making in this level
        
        level1.smallOrderLabel = "Water"
        
        levels.append(level1)

        
        
        
        var level2 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level2.carbonCounter = 3
        level2.oxygenCounter = 3
        
        
        // How many of an element do you have left
        level2.counters["Carbon"] = 1
        level2.counters["Oxygen"] = 1
        
        level2.goal = 2
        level2.smallLabel = "Carbon Monoxide"
        level2.level = 2
        level2.ElementImage1 = 1
        level2.ElementImage2 = 1
        level2.ElementImage1Name = "Art Assets/Carbon.png"
        level2.ElementImage2Name = "Art Assets/Oxygen.png"
        level2.MyNewCareerScientistImage = "Art Assets/Scientist0.png"

        
        level2.magnitude = ccp(0,30)
        level2.spawnThese = [3,1,2,3]
        level2.randomMin = 1
        level2.randomMax = 3
        
        
        //add an order label of what the user is making in this level

        
        levels.append(level2)

        
        var level3 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level3.nitrogenCounter = 2
        level3.hydrogenCounter = 5
        
        
        // How many of an element do you have left
        level3.counters["Nitrogen"] = 1
        level3.counters["Hydrogen"] = 3
        
        level3.goal = 2
        level3.smallLabel = "Ammonia"
        level3.level = 3
        level3.ElementImage1 = 1
        level3.ElementImage2 = 1
        level3.ElementImage1Name = "Art Assets/Nitrogen.png"
        level3.ElementImage2Name = "Art Assets/Hydrogen.png"
        level3.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level3.magnitude = ccp(0,30)
        level3.spawnThese = [3,1,2,3]
        level3.randomMin = 1
        level3.randomMax = 3
    
        
        //add an order label of what the user is making in this level
        
        
        
        levels.append(level3)

        
        var level4 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
//        level4.carbonCounter = 3
        level4.oxygenCounter = 2
        
        
        // How many of an element do you have left
//        level4.counters["Carbon"] = 1
        level4.counters["Oxygen"] = 2
        
        level4.goal = 2
        level4.smallLabel = "Oxygen Gas"
        level4.level = 4
        level4.ElementImage1 = 1
        level4.ElementImage2 = 1
        level4.ElementImage1Name = "Art Assets/Carbon.png"
        level4.ElementImage2Name = "Art Assets/Oxygen.png"
        level4.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level4.magnitude = ccp(0,30)
        level4.spawnThese = [3,1,2,3]
        level4.randomMin = 1
        level4.randomMax = 3
        
        
        //add an order label of what the user is making in this level
        
        
        
        levels.append(level4)
        

        

    }

}