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
    var lithiumCounter: Int = 0
    var aluminumCounter: Int = 0
    var chlorideCounter: Int = 0
    var copperCounter: Int = 0
    var sulfurCounter: Int = 0
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
        
        level3.goal = 4
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
        
        
        
      

        var level4 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level4.carbonCounter = 2
        level4.hydrogenCounter = 2
        
        
        // How many of an element do you have left
        level4.counters["Carbon"] = 2
        level4.counters["Hydrogen"] = 2
        
        level4.goal = 4
        level4.smallLabel = "Acetylene"
        level4.level = 4
        level4.ElementImage1 = 1
        level4.ElementImage2 = 1
        level4.ElementImage1Name = "Art Assets/Carbon.png"
        level4.ElementImage2Name = "Art Assets/Hydrogen.png"
        level4.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
    
        
        level4.magnitude = ccp(0,30)
        level4.spawnThese = [3,1,2,3]
        level4.randomMin = 1
        level4.randomMax = 3
        
        
        //add an order label of what the user is making in this level
        
        levels.append(level4)
        
        
        
        
        var level5 = Data()
        //C2H4O2
        //need to this ensure that hydrogen atoms are dropped
        level5.carbonCounter = 2
        level5.hydrogenCounter = 2
        level5.oxygenCounter = 3
        
        // How many of an element do you have left
        level5.counters["Carbon"] = 2
        level5.counters["Hydrogen"] = 4
        level5.counters["Oxygen"] = 2
        
        level5.goal = 8
        level5.smallLabel = "Acetic Acid"
        level5.level = 5
        level5.ElementImage1 = 1
        level5.ElementImage2 = 1
        level5.ElementImage3 = 1

        level5.ElementImage1Name = "Art Assets/Carbon.png"
        level5.ElementImage2Name = "Art Assets/Hydrogen.png"
        level5.ElementImage3Name =  "Art Assets/Oxygen.png"

        level5.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level5.magnitude = ccp(0,30)
        level5.spawnThese = [3,1,2,3]
        level5.randomMin = 1
        level5.randomMax = 3
        
        
        //add an order label of what the user is making in this level
        
        levels.append(level5)
        
        
        var level6 = Data()
        //Lithium Nitrite-LiNO2
        //need to this ensure that hydrogen atoms are dropped
        level6.lithiumCounter = 3
        level6.nitrogenCounter = 2
        level6.oxygenCounter = 4
        
        // How many of an element do you have left
        level6.counters["Lithium"] = 1
        level6.counters["Nitrogen"] = 1
        level6.counters["Oxygen"] = 2
        
        level6.goal = 4
        level6.smallLabel = "Lithium Nitrite"
        level6.level = 6
        level6.ElementImage1 = 1
        level6.ElementImage2 = 1
        level6.ElementImage3 = 1
        
        level6.ElementImage1Name = "Art Assets/Lithium.png"
        level6.ElementImage2Name = "Art Assets/Nitrogen.png"
        level6.ElementImage3Name =  "Art Assets/Oxygen.png"
        
        level6.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level6.magnitude = ccp(0,30)
        level6.spawnThese = [3,1,2,3]
        level6.randomMin = 1
        level6.randomMax = 3
        
        
        //add an order label of what the user is making in this level
        
        levels.append(level6)
        
        
       
        //AlCl3-aluminum chloride
        var level7 = Data()
       
        //need to this ensure that hydrogen atoms are dropped
        level7.aluminumCounter = 3
        level7.chlorideCounter = 2
//        level7.oxygenCounter = 4
        
        // How many of an element do you have left
        level7.counters["Aluminum"] = 1
        level7.counters["Chloride"] = 3

        
        level7.goal = 4
        level7.smallLabel = "Aluminum Chloride"
        level7.level = 7
        level7.ElementImage1 = 1
        level7.ElementImage2 = 1
  
        
        level7.ElementImage1Name = "Art Assets/Aluminum.png"
        level7.ElementImage2Name = "Art Assets/Chloride.png"
       
        
        level7.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level7.magnitude = ccp(0,30)
        level7.spawnThese = [3,1,2,3]
        level7.randomMin = 1
        level7.randomMax = 3
        
        
        //add an order label of what the user is making in this level
        
        levels.append(level7)
        
        
        var level8 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level8.carbonCounter = 3
        level8.oxygenCounter = 5
        
        
        // How many of an element do you have left
        level8.counters["Carbon"] = 1
        level8.counters["Oxygen"] = 2
   
        level8.goal = 3
        level8.smallLabel = "Carbon Dioxide"
        level8.level = 8
        level8.ElementImage1 = 1
        level8.ElementImage2 = 1
        level8.ElementImage1Name = "Art Assets/Carbon.png"
        level8.ElementImage2Name = "Art Assets/Oxygen.png"
        
        level8.magnitude = ccp(0,30)
        level8.spawnThese = [3,1,2,3]
        level8.randomMin = 1
        level8.randomMax = 3
    
     
        level8.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
     
        //add an order label of what the user is making in this level
        
        level8.smallOrderLabel = "Carbon Dioxide"
        
        levels.append(level8)
        
        
        
        //copper sulfate - CuSO4
        var level9 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level9.copperCounter = 3
        level9.sulfurCounter = 3
        level9.oxygenCounter = 5
        
        
        // How many of an element do you have left
        level9.counters["Copper"] = 1
        level9.counters["Sulfur"] = 1
        level9.counters["Oxygen"] = 4
        
        level9.goal = 6
        level9.smallLabel = "Copper Sulfate"
        level9.level = 9
        level9.ElementImage1 = 1
        level9.ElementImage2 = 1
        level9.ElementImage3 = 1
        level9.ElementImage1Name = "Art Assets/Copper.png"
        level9.ElementImage2Name = "Art Assets/Sulfur.png"
        level9.ElementImage3Name = "Art Assets/Oxygen.png"
        
        level9.magnitude = ccp(0,30)
        level9.spawnThese = [3,1,2,3]
        level9.randomMin = 1
        level9.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level9.smallOrderLabel = "Copper Sulfate"
        
        levels.append(level9)
        
        
        //aluminum oxide - Al2O3
        var level10 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level10.aluminumCounter = 3
        level10.oxygenCounter = 3
        
        // How many of an element do you have left
        level10.counters["Aluminum"] = 2
        level10.counters["Oxygen"] = 3

        
        level10.goal = 5
        level10.smallLabel = "Aluminum Oxide"
        level10.level = 10
        level10.ElementImage1 = 1
        level10.ElementImage2 = 1
      
        level10.ElementImage1Name = "Art Assets/Aluminum.png"
        level10.ElementImage2Name = "Art Assets/Oxygen.png"
   
        
        level10.magnitude = ccp(0,30)
        level10.spawnThese = [3,1,2,3]
        level10.randomMin = 1
        level10.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level10.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level10)
        

/////////////////////////////////////////////////////////////////////////////////////////
        //aluminum oxide - Al2O3
        var level11 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level11.aluminumCounter = 3
        level11.oxygenCounter = 3
        
        // How many of an element do you have left
        level11.counters["Aluminum"] = 2
        level11.counters["Oxygen"] = 3
        
        
        level11.goal = 5
        level11.smallLabel = "Aluminum Oxide"
        level11.level = 11
        level11.ElementImage1 = 1
        level11.ElementImage2 = 1
        
        level11.ElementImage1Name = "Art Assets/Aluminum.png"
        level11.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level11.magnitude = ccp(0,30)
        level11.spawnThese = [3,1,2,3]
        level11.randomMin = 1
        level11.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level11.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level11)
        
        
        
        //aluminum oxide - Al2O3
        var level12 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level12.aluminumCounter = 3
        level12.oxygenCounter = 3
        
        // How many of an element do you have left
        level12.counters["Aluminum"] = 2
        level12.counters["Oxygen"] = 3
        
        
        level12.goal = 5
        level12.smallLabel = "Aluminum Oxide"
        level12.level = 12
        level12.ElementImage1 = 1
        level12.ElementImage2 = 1
        
        level12.ElementImage1Name = "Art Assets/Aluminum.png"
        level12.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level12.magnitude = ccp(0,30)
        level12.spawnThese = [3,1,2,3]
        level12.randomMin = 1
        level12.randomMax = 3
    
        //add an order label of what the user is making in this level
        
        level12.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level12)
        
        
        
        //aluminum oxide - Al2O3
        var level13 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level13.aluminumCounter = 3
        level13.oxygenCounter = 3
        
        // How many of an element do you have left
        level13.counters["Aluminum"] = 2
        level13.counters["Oxygen"] = 3
        
        
        level13.goal = 5
        level13.smallLabel = "Aluminum Oxide"
        level13.level = 13
        level13.ElementImage1 = 1
        level13.ElementImage2 = 1
        
        level13.ElementImage1Name = "Art Assets/Aluminum.png"
        level13.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level13.magnitude = ccp(0,30)
        level13.spawnThese = [3,1,2,3]
        level13.randomMin = 1
        level13.randomMax = 3
    
        //add an order label of what the user is making in this level
        
        level13.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level13)
        
        
        //aluminum oxide - Al2O3
        var level14 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level14.aluminumCounter = 3
        level14.oxygenCounter = 3
        
        // How many of an element do you have left
        level14.counters["Aluminum"] = 2
        level14.counters["Oxygen"] = 3
        
        
        level14.goal = 5
        level14.smallLabel = "Aluminum Oxide"
        level14.level = 14
        level14.ElementImage1 = 1
        level14.ElementImage2 = 1
        
        level14.ElementImage1Name = "Art Assets/Aluminum.png"
        level14.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level14.magnitude = ccp(0,30)
        level14.spawnThese = [3,1,2,3]
        level14.randomMin = 1
        level14.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level14.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level14)
        
        
        
        //aluminum oxide - Al2O3
        var level15 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level15.aluminumCounter = 3
        level15.oxygenCounter = 3
        
        // How many of an element do you have left
        level15.counters["Aluminum"] = 2
        level15.counters["Oxygen"] = 3
        
        
        level15.goal = 5
        level15.smallLabel = "Aluminum Oxide"
        level15.level = 15
        level15.ElementImage1 = 1
        level15.ElementImage2 = 1
        
        level15.ElementImage1Name = "Art Assets/Aluminum.png"
        level15.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level15.magnitude = ccp(0,30)
        level15.spawnThese = [3,1,2,3]
        level15.randomMin = 1
        level15.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level15.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level15)
        
        
        
        
        //aluminum oxide - Al2O3
        var level16 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level16.aluminumCounter = 3
        level16.oxygenCounter = 3
        
        // How many of an element do you have left
        level16.counters["Aluminum"] = 2
        level16.counters["Oxygen"] = 3
        
        
        level16.goal = 5
        level16.smallLabel = "Aluminum Oxide"
        level16.level = 16
        level16.ElementImage1 = 1
        level16.ElementImage2 = 1
        
        level16.ElementImage1Name = "Art Assets/Aluminum.png"
        level16.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level16.magnitude = ccp(0,30)
        level16.spawnThese = [3,1,2,3]
        level16.randomMin = 1
        level16.randomMax = 3
    
        //add an order label of what the user is making in this level
        
        level16.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level16)
        
        
        
        //aluminum oxide - Al2O3
        var level17 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level17.aluminumCounter = 3
        level17.oxygenCounter = 3
        
        // How many of an element do you have left
        level17.counters["Aluminum"] = 2
        level17.counters["Oxygen"] = 3
        
        
        level17.goal = 5
        level17.smallLabel = "Aluminum Oxide"
        level17.level = 17
        level17.ElementImage1 = 1
        level17.ElementImage2 = 1
        
        level17.ElementImage1Name = "Art Assets/Aluminum.png"
        level17.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level17.magnitude = ccp(0,30)
        level17.spawnThese = [3,1,2,3]
        level17.randomMin = 1
        level17.randomMax = 3
    
        //add an order label of what the user is making in this level
        
        level17.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level17)
        
        
        
        
        //aluminum oxide - Al2O3
        var level18 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level18.aluminumCounter = 3
        level18.oxygenCounter = 3
        
        // How many of an element do you have left
        level18.counters["Aluminum"] = 2
        level18.counters["Oxygen"] = 3
        
        
        level18.goal = 5
        level18.smallLabel = "Aluminum Oxide"
        level18.level = 18
        level18.ElementImage1 = 1
        level18.ElementImage2 = 1
        
        level18.ElementImage1Name = "Art Assets/Aluminum.png"
        level18.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level18.magnitude = ccp(0,30)
        level18.spawnThese = [3,1,2,3]
        level18.randomMin = 1
        level18.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level18.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level18)
        

        
        
        //aluminum oxide - Al2O3
        var level19 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level19.aluminumCounter = 3
        level19.oxygenCounter = 3
        
        // How many of an element do you have left
        level19.counters["Aluminum"] = 2
        level19.counters["Oxygen"] = 3
        
        
        level19.goal = 5
        level19.smallLabel = "Aluminum Oxide"
        level19.level = 19
        level19.ElementImage1 = 1
        level19.ElementImage2 = 1
        
        level19.ElementImage1Name = "Art Assets/Aluminum.png"
        level19.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level19.magnitude = ccp(0,30)
        level19.spawnThese = [3,1,2,3]
        level19.randomMin = 1
        level19.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level19.smallOrderLabel = "Aluminum Oxide"
    
        levels.append(level19)
        
        
        
        //aluminum oxide - Al2O3
        var level20 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level20.aluminumCounter = 3
        level20.oxygenCounter = 3
        
        // How many of an element do you have left
        level20.counters["Aluminum"] = 2
        level20.counters["Oxygen"] = 3
        
        
        level20.goal = 5
        level20.smallLabel = "Aluminum Oxide"
        level20.level = 20
        level20.ElementImage1 = 1
        level20.ElementImage2 = 1
        
        level20.ElementImage1Name = "Art Assets/Aluminum.png"
        level20.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level20.magnitude = ccp(0,30)
        level20.spawnThese = [3,1,2,3]
        level20.randomMin = 1
        level20.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level20.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level20)
        
        
        //aluminum oxide - Al2O3
        var level21 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level21.aluminumCounter = 3
        level21.oxygenCounter = 3
        
        // How many of an element do you have left
        level21.counters["Aluminum"] = 2
        level21.counters["Oxygen"] = 3
        
        
        level21.goal = 5
        level21.smallLabel = "Aluminum Oxide"
        level21.level = 21
        level21.ElementImage1 = 1
        level21.ElementImage2 = 1
        
        level21.ElementImage1Name = "Art Assets/Aluminum.png"
        level21.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level21.magnitude = ccp(0,30)
        level21.spawnThese = [3,1,2,3]
        level21.randomMin = 1
        level21.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level21.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level21)
        
        //aluminum oxide - Al2O3
        var level22 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level22.aluminumCounter = 3
        level22.oxygenCounter = 3
        
        // How many of an element do you have left
        level22.counters["Aluminum"] = 2
        level22.counters["Oxygen"] = 3
        
        
        level22.goal = 5
        level22.smallLabel = "Aluminum Oxide"
        level22.level = 22
        level22.ElementImage1 = 1
        level22.ElementImage2 = 1
        
        level22.ElementImage1Name = "Art Assets/Aluminum.png"
        level22.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level22.magnitude = ccp(0,30)
        level22.spawnThese = [3,1,2,3]
        level22.randomMin = 1
        level22.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level22.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level22)
        
        
        
        //aluminum oxide - Al2O3
        var level23 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level23.aluminumCounter = 3
        level23.oxygenCounter = 3
        
        // How many of an element do you have left
        level23.counters["Aluminum"] = 2
        level23.counters["Oxygen"] = 3
        
        
        level23.goal = 5
        level23.smallLabel = "Aluminum Oxide"
        level23.level = 23
        level23.ElementImage1 = 1
        level23.ElementImage2 = 1
        
        level23.ElementImage1Name = "Art Assets/Aluminum.png"
        level23.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level23.magnitude = ccp(0,30)
        level23.spawnThese = [3,1,2,3]
        level23.randomMin = 1
        level23.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level23.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level23)

        
        
        //aluminum oxide - Al2O3
        var level24 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level24.aluminumCounter = 3
        level24.oxygenCounter = 3
        
        // How many of an element do you have left
        level24.counters["Aluminum"] = 2
        level24.counters["Oxygen"] = 3
        
        
        level24.goal = 5
        level24.smallLabel = "Aluminum Oxide"
        level24.level = 24
        level24.ElementImage1 = 1
        level24.ElementImage2 = 1
        
        level24.ElementImage1Name = "Art Assets/Aluminum.png"
        level24.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level24.magnitude = ccp(0,30)
        level24.spawnThese = [3,1,2,3]
        level24.randomMin = 1
        level24.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level24.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level24)
        
        
        
        //aluminum oxide - Al2O3
        var level25 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level25.aluminumCounter = 3
        level25.oxygenCounter = 3
        
        // How many of an element do you have left
        level25.counters["Aluminum"] = 2
        level25.counters["Oxygen"] = 3
        
        
        level25.goal = 5
        level25.smallLabel = "Aluminum Oxide"
        level25.level = 25
        level25.ElementImage1 = 1
        level25.ElementImage2 = 1
        
        level25.ElementImage1Name = "Art Assets/Aluminum.png"
        level25.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level25.magnitude = ccp(0,30)
        level25.spawnThese = [3,1,2,3]
        level25.randomMin = 1
        level25.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level25.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level25)
        
        //aluminum oxide - Al2O3
        var level26 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level26.aluminumCounter = 3
        level26.oxygenCounter = 3
        
        // How many of an element do you have left
        level26.counters["Aluminum"] = 2
        level26.counters["Oxygen"] = 3
        
        
        level26.goal = 5
        level26.smallLabel = "Aluminum Oxide"
        level26.level = 26
        level26.ElementImage1 = 1
        level26.ElementImage2 = 1
        
        level26.ElementImage1Name = "Art Assets/Aluminum.png"
        level26.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level26.magnitude = ccp(0,30)
        level26.spawnThese = [3,1,2,3]
        level26.randomMin = 1
        level26.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level26.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level26)
        
        
        //aluminum oxide - Al2O3
        var level27 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level27.aluminumCounter = 3
        level27.oxygenCounter = 3
        
        // How many of an element do you have left
        level27.counters["Aluminum"] = 2
        level27.counters["Oxygen"] = 3
        
        
        level27.goal = 5
        level27.smallLabel = "Aluminum Oxide"
        level27.level = 27
        level27.ElementImage1 = 1
        level27.ElementImage2 = 1
        
        level27.ElementImage1Name = "Art Assets/Aluminum.png"
        level27.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level27.magnitude = ccp(0,30)
        level27.spawnThese = [3,1,2,3]
        level27.randomMin = 1
        level27.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level27.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level27)
        
        
        
        
        //aluminum oxide - Al2O3
        var level28 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level28.aluminumCounter = 3
        level28.oxygenCounter = 3
        
        // How many of an element do you have left
        level28.counters["Aluminum"] = 2
        level28.counters["Oxygen"] = 3
        
        
        level28.goal = 5
        level28.smallLabel = "Aluminum Oxide"
        level28.level = 28
        level28.ElementImage1 = 1
        level28.ElementImage2 = 1
        
        level28.ElementImage1Name = "Art Assets/Aluminum.png"
        level28.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level28.magnitude = ccp(0,30)
        level28.spawnThese = [3,1,2,3]
        level28.randomMin = 1
        level28.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level28.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level28)
        
        
        //aluminum oxide - Al2O3
        var level29 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level29.aluminumCounter = 3
        level29.oxygenCounter = 3
        
        // How many of an element do you have left
        level29.counters["Aluminum"] = 2
        level29.counters["Oxygen"] = 3
        
        
        level29.goal = 5
        level29.smallLabel = "Aluminum Oxide"
        level29.level = 29
        level29.ElementImage1 = 1
        level29.ElementImage2 = 1
        
        level29.ElementImage1Name = "Art Assets/Aluminum.png"
        level29.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level29.magnitude = ccp(0,30)
        level29.spawnThese = [3,1,2,3]
        level29.randomMin = 1
        level29.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level29.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level29)
        
        
        //aluminum oxide - Al2O3
        var level30 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level30.aluminumCounter = 3
        level30.oxygenCounter = 3
        
        // How many of an element do you have left
        level30.counters["Aluminum"] = 2
        level30.counters["Oxygen"] = 3
        
        
        level30.goal = 5
        level30.smallLabel = "Aluminum Oxide"
        level30.level = 30
        level30.ElementImage1 = 1
        level30.ElementImage2 = 1
        
        level30.ElementImage1Name = "Art Assets/Aluminum.png"
        level30.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level30.magnitude = ccp(0,30)
        level30.spawnThese = [3,1,2,3]
        level30.randomMin = 1
        level30.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level30.smallOrderLabel = "Aluminum Oxide"
        
        levels.append(level30)
        
        
        
        
        

    }

}