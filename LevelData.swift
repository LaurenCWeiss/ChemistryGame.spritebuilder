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
    var chlorineCounter: Int = 0
    var copperCounter: Int = 0
    var sulfurCounter: Int = 0
    var calciumCounter: Int = 0
    var phosphorusCounter: Int = 0
    var ironCounter: Int = 0
    var potassiumCounter: Int = 0
    var sodiumCounter: Int = 0
    var tellurideCounter: Int = 0
    var galliumCounter: Int = 0
    var bromineCounter: Int = 0
    var mercuryCounter: Int = 0
    
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
        println("Get Level:")
        println(defaults.integerForKey("curLevel"))

        return defaults.integerForKey("curLevel")
        
        
        
        }
        //could say set(newLevel) but then we would have to put newLevel in the setter which would be bad code when we can just use newValue that is built into the systme
        set {
            defaults.setInteger(newValue, forKey: "curLevel")
            println("Set Level:\(newValue)")
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
        
        level3.goal = 3
        level3.smallLabel = "Ammonia"
        level3.level = 2
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
        level7.chlorineCounter = 2
        //        level7.oxygenCounter = 4
        
        // How many of an element do you have left
        level7.counters["Aluminum"] = 1
        level7.counters["Chlorine"] = 3
        
        
        level7.goal = 4
        level7.smallLabel = "Aluminum Chloride"
        level7.level = 7
        level7.ElementImage1 = 1
        level7.ElementImage2 = 1
        
        
        level7.ElementImage1Name = "Art Assets/Aluminum.png"
        level7.ElementImage2Name = "Art Assets/Chlorine.png"
        
        
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
        
        
        //ammonium - NH4
        var level11 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level11.nitrogenCounter = 3
        level11.hydrogenCounter = 3
        
        // How many of an element do you have left
        level11.counters["Nitrogen"] = 1
        level11.counters["Hydrogen"] = 4
        
        
        level11.goal = 5
        level11.smallLabel = "Ammonium"
        level11.level = 11
        level11.ElementImage1 = 1
        level11.ElementImage2 = 1
        
        level11.ElementImage1Name = "Art Assets/Nitrogen.png"
        level11.ElementImage2Name = "Art Assets/Hydrogen.png"
        
        
        level11.magnitude = ccp(0,30)
        level11.spawnThese = [3,1,2,3]
        level11.randomMin = 1
        level11.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level11.smallOrderLabel = "Ammonium"
        
        levels.append(level11)
        
        
        
        //nitrite - NO2
        var level12 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level12.nitrogenCounter = 3
        level12.oxygenCounter = 3
        
        // How many of an element do you have left
        level12.counters["Nitrogen"] = 1
        level12.counters["Oxygen"] = 2
        
        
        level12.goal = 3
        level12.smallLabel = "Nitrite"
        level12.level = 12
        level12.ElementImage1 = 1
        level12.ElementImage2 = 1
        
        level12.ElementImage1Name = "Art Assets/Nitrogen.png"
        level12.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level12.magnitude = ccp(0,30)
        level12.spawnThese = [3,1,2,3]
        level12.randomMin = 1
        level12.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level12.smallOrderLabel = "Nitrite"
        
        levels.append(level12)
        
        
        
        //hydronium - H3O
        var level13 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level13.hydrogenCounter = 3
        level13.oxygenCounter = 3
        
        // How many of an element do you have left
        level13.counters["Hydrogen"] = 3
        level13.counters["Oxygen"] = 1
        
        
        level13.goal = 4
        level13.smallLabel = "Hydronium"
        level13.level = 13
        level13.ElementImage1 = 1
        level13.ElementImage2 = 1
        
        level13.ElementImage1Name = "Art Assets/Hydrogen.png"
        level13.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level13.magnitude = ccp(0,30)
        level13.spawnThese = [3,1,2,3]
        level13.randomMin = 1
        level13.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level13.smallOrderLabel = "Hydronium"
        
        levels.append(level13)
        
        
        //Hydrogen Sulfate - HSO4
        var level14 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level14.hydrogenCounter = 3
        level14.sulfurCounter = 3
        level14.oxygenCounter = 3
        
        // How many of an element do you have left
        level14.counters["Hydrogen"] = 1
        level14.counters["Sulfur"] = 1
        level14.counters["Oxygen"] = 4
        
        
        level14.goal = 6
        level14.smallLabel = "Hydrogen Sulfate"
        level14.level = 14
        level14.ElementImage1 = 1
        level14.ElementImage2 = 1
        level14.ElementImage3 = 1
        
        level14.ElementImage1Name = "Art Assets/Hydrogen.png"
        level14.ElementImage2Name = "Art Assets/Sulfur.png"
        level14.ElementImage3Name = "Art Assets/Oxygen.png"
        
        level14.magnitude = ccp(0,30)
        level14.spawnThese = [3,1,2,3]
        level14.randomMin = 1
        level14.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level14.smallOrderLabel = "Hydrogen Sulfate"
        
        levels.append(level14)
        
        
        
        //hydroxide - OH
        var level15 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level15.oxygenCounter = 3
        level15.hydrogenCounter = 3
        
        // How many of an element do you have left
        level15.counters["Oxygen"] = 1
        level15.counters["Hydrogen"] = 1
        
        
        level15.goal = 2
        level15.smallLabel = "Hydroxide"
        level15.level = 15
        level15.ElementImage1 = 1
        level15.ElementImage2 = 1
        
        level15.ElementImage1Name = "Art Assets/Oxygen.png"
        level15.ElementImage2Name = "Art Assets/Hydrogen.png"
        
        
        level15.magnitude = ccp(0,30)
        level15.spawnThese = [3,1,2,3]
        level15.randomMin = 1
        level15.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level15.smallOrderLabel = "Hydroxide"
        
        levels.append(level15)
        
        
        
        
        //Calcium carbonate - CaCO3
        var level16 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level16.calciumCounter = 3
        level16.carbonCounter = 3
        level16.oxygenCounter = 3
        
        // How many of an element do you have left
        level16.counters["Calcium"] = 1
        level16.counters["Carbon"] = 1
        level16.counters["Oxygen"] = 3
        
        
        level16.goal = 5
        level16.smallLabel = "Calcium Carbonate"
        level16.level = 16
        level16.ElementImage1 = 1
        level16.ElementImage2 = 1
        level16.ElementImage3 = 1
        
        level16.ElementImage1Name = "Art Assets/Calcium.png"
        level16.ElementImage2Name = "Art Assets/Carbon.png"
        level16.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level16.magnitude = ccp(0,30)
        level16.spawnThese = [3,1,2,3]
        level16.randomMin = 1
        level16.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level16.smallOrderLabel = "Calcium Carbonate"
        
        levels.append(level16)
        
        
        
        //Nitrate - NO3
        var level17 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level17.nitrogenCounter = 3
        level17.oxygenCounter = 3
        
        // How many of an element do you have left
        level17.counters["Nitrogen"] = 1
        level17.counters["Oxygen"] = 3
        
        
        level17.goal = 4
        level17.smallLabel = "Nitrate"
        level17.level = 17
        level17.ElementImage1 = 1
        level17.ElementImage2 = 1
        
        level17.ElementImage1Name = "Art Assets/Nitrogen.png"
        level17.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level17.magnitude = ccp(0,30)
        level17.spawnThese = [3,1,2,3]
        level17.randomMin = 1
        level17.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level17.smallOrderLabel = "Nitrate"
        
        levels.append(level17)
        
        
        
        
        //Chloroform - CHCl3
        var level18 = Data()
        //need to this ensure that hydrogen atoms are dropped
        level18.carbonCounter = 3
        level18.hydrogenCounter = 3
        level18.chlorineCounter = 3
        
        // How many of an element do you have left
        level18.counters["Carbon"] = 1
        level18.counters["Hydrogen"] = 1
        level18.counters["Chlorine"] = 3
        
        
        level18.goal = 5
        level18.smallLabel = "Chloroform"
        level18.level = 18
        level18.ElementImage1 = 1
        level18.ElementImage2 = 1
        level18.ElementImage3 = 1
        
        
        level18.ElementImage1Name = "Art Assets/Carbon.png"
        level18.ElementImage2Name = "Art Assets/Hydrogen.png"
        level18.ElementImage2Name = "Art Assets/Chlorine.png"
        
        
        level18.magnitude = ccp(0,30)
        level18.spawnThese = [3,1,2,3]
        level18.randomMin = 1
        level18.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level18.smallOrderLabel = "Chloroform"
        
        levels.append(level18)
        
        
        
        
        //ethane- C2H6
        var level19 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level19.carbonCounter = 3
        level19.hydrogenCounter = 3
        
        // How many of an element do you have left
        level19.counters["Carbon"] = 2
        level19.counters["Hydrogen"] = 6
        
        
        level19.goal = 8
        level19.smallLabel = "Ethane"
        level19.level = 19
        level19.ElementImage1 = 1
        level19.ElementImage2 = 1
        
        level19.ElementImage1Name = "Art Assets/Carbon.png"
        level19.ElementImage2Name = "Art Assets/Hydrogen.png"
        
        
        level19.magnitude = ccp(0,30)
        level19.spawnThese = [3,1,2,3]
        level19.randomMin = 1
        level19.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level19.smallOrderLabel = "Ethane"
        
        levels.append(level19)
        
        
        
        //Iron(tri) phosphide- Fe3P
        var level20 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level20.ironCounter = 3
        level20.phosphorusCounter = 3
        
        // How many of an element do you have left
        level20.counters["Iron"] = 3
        level20.counters["Phosphorus"] = 1
        
        
        level20.goal = 4
        level20.smallLabel = "Iron(tri) Phosphide"
        level20.level = 20
        level20.ElementImage1 = 1
        level20.ElementImage2 = 1
        
        level20.ElementImage1Name = "Art Assets/Iron.png"
        level20.ElementImage2Name = "Art Assets/Phosphorus.png"
        
        
        level20.magnitude = ccp(0,30)
        level20.spawnThese = [3,1,2,3]
        level20.randomMin = 1
        level20.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level20.smallOrderLabel = "Iron(tri) Phosphide"
        
        levels.append(level20)
        
        
        //Potassium nitrite - KNO2
        var level21 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level21.potassiumCounter = 3
        level21.nitrogenCounter = 3
        level21.oxygenCounter = 3
        // How many of an element do you have left
        level21.counters["Potassium"] = 1
        level21.counters["Nitrogen"] = 1
        level21.counters["Oxygen"] = 2
        
        
        level21.goal = 4
        level21.smallLabel = "Potassium Nitrite"
        level21.level = 21
        level21.ElementImage1 = 1
        level21.ElementImage2 = 1
        level21.ElementImage3 = 1
        
        level21.ElementImage1Name = "Art Assets/Potassium.png"
        level21.ElementImage2Name = "Art Assets/Nitrogen.png"
        level21.ElementImage3Name = "Art Assets/Oxygen.png"
        
        
        
        
        level21.magnitude = ccp(0,30)
        level21.spawnThese = [3,1,2,3]
        level21.randomMin = 1
        level21.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level21.smallOrderLabel = "Potassium Nitrite"
        
        levels.append(level21)
        
        
        //Sodium chloride - NaCl
        var level22 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level22.sodiumCounter = 3
        level22.chlorineCounter = 3
        
        // How many of an element do you have left
        level22.counters["Sodium"] = 1
        level22.counters["Chlorine"] = 1
        
        
        level22.goal = 2
        level22.smallLabel = "Sodium Chloride"
        level22.level = 22
        level22.ElementImage1 = 1
        level22.ElementImage2 = 1
        
        level22.ElementImage1Name = "Art Assets/Sodium.png"
        level22.ElementImage2Name = "Art Assets/Chlorine.png"
        
        
        level22.magnitude = ccp(0,30)
        level22.spawnThese = [3,1,2,3]
        level22.randomMin = 1
        level22.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level22.smallOrderLabel = "Sodium Chloride"
        
        levels.append(level22)
        
        
        
        //Disodium telluride - Na2Te
        var level23 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level23.sodiumCounter = 3
        level23.tellurideCounter = 3
        
        // How many of an element do you have left
        level23.counters["Sodium"] = 2
        level23.counters["Telluride"] = 1
        
        
        level23.goal = 3
        level23.smallLabel = "Disodium Telluride"
        level23.level = 23
        level23.ElementImage1 = 1
        level23.ElementImage2 = 1
        
        level23.ElementImage1Name = "Art Assets/Sodium.png"
        level23.ElementImage2Name = "Art Assets/Telluride.png"
        
        
        level23.magnitude = ccp(0,30)
        level23.spawnThese = [3,1,2,3]
        level23.randomMin = 1
        level23.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level23.smallOrderLabel = "Disodium Telluride"
        
        levels.append(level23)
        
        
        
        //Galium(lll) bromide - GaBr3
        var level24 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level24.galliumCounter = 3
        level24.bromineCounter = 3
        
        // How many of an element do you have left
        level24.counters["Gallium"] = 1
        level24.counters["Bromine"] = 3
        
        
        level24.goal = 4
        level24.smallLabel = "Galium(lll) Bromide"
        level24.level = 24
        level24.ElementImage1 = 1
        level24.ElementImage2 = 1
        
        level24.ElementImage1Name = "Art Assets/Gallium.png"
        level24.ElementImage2Name = "Art Assets/Bromine.png"
        
        
        level24.magnitude = ccp(0,30)
        level24.spawnThese = [3,1,2,3]
        level24.randomMin = 1
        level24.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level24.smallOrderLabel = "Galium(lll) Bromide"
        
        levels.append(level24)
        
        
        
        //Mercury(l) bromide - HgBr2
        var level25 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level25.mercuryCounter = 3
        level25.bromineCounter = 3
        
        // How many of an element do you have left
        level25.counters["Mercury"] = 1
        level25.counters["Bromine"] = 2
        
        
        level25.goal = 3
        level25.smallLabel = "Mercury(l) Bromide"
        level25.level = 25
        level25.ElementImage1 = 1
        level25.ElementImage2 = 1
        
        level25.ElementImage1Name = "Art Assets/Mercury.png"
        level25.ElementImage2Name = "Art Assets/Bromine.png"
        
        
        level25.magnitude = ccp(0,30)
        level25.spawnThese = [3,1,2,3]
        level25.randomMin = 1
        level25.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level25.smallOrderLabel = "Mercury(l) Bromide"
        
        levels.append(level25)
        
        //Potassium oxide - K2O
        var level26 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level26.potassiumCounter = 3
        level26.oxygenCounter = 3
        
        // How many of an element do you have left
        level26.counters["Potassium"] = 2
        level26.counters["Oxygen"] = 1
        
        
        level26.goal = 3
        level26.smallLabel = "Potassium Oxide"
        level26.level = 26
        level26.ElementImage1 = 1
        level26.ElementImage2 = 1
        
        level26.ElementImage1Name = "Art Assets/Potassium.png"
        level26.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level26.magnitude = ccp(0,30)
        level26.spawnThese = [3,1,2,3]
        level26.randomMin = 1
        level26.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level26.smallOrderLabel = "Potassium Oxide"
        
        levels.append(level26)
        
        
        //Mercuric chloride - HgS
        var level27 = Data()
        //carbon dioxide-CO2
        //need to this ensure that hydrogen atoms are dropped
        level27.mercuryCounter = 3
        level27.chlorineCounter = 3
        
        // How many of an element do you have left
        level27.counters["Mercury"] = 1
        level27.counters["Chlorine"] = 1
        
        
        level27.goal = 2
        level27.smallLabel = "Mercuric Chloride"
        level27.level = 27
        level27.ElementImage1 = 1
        level27.ElementImage2 = 1
        
        level27.ElementImage1Name = "Art Assets/Mercury.png"
        level27.ElementImage2Name = "Art Assets/Chlorine.png"
        
        
        level27.magnitude = ccp(0,30)
        level27.spawnThese = [3,1,2,3]
        level27.randomMin = 1
        level27.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level27.smallOrderLabel = "Mercuric Chloride"
        
        levels.append(level27)
        
        
        
        
        //Nitrogen dioxide - NO2
        var level28 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level28.nitrogenCounter = 3
        level28.oxygenCounter = 3
        
        // How many of an element do you have left
        level28.counters["Nitrogen"] = 1
        level28.counters["Oxygen"] = 2
        
        
        level28.goal = 3
        level28.smallLabel = "Nitrogen Dioxide"
        level28.level = 28
        level28.ElementImage1 = 1
        level28.ElementImage2 = 1
        
        level28.ElementImage1Name = "Art Assets/Nitrogen.png"
        level28.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level28.magnitude = ccp(0,30)
        level28.spawnThese = [3,1,2,3]
        level28.randomMin = 1
        level28.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level28.smallOrderLabel = "Nitrogen Dioxide"
        
        levels.append(level28)
        
        
        //Potassium hydroxide - KOH
        var level29 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level29.potassiumCounter = 3
        level29.oxygenCounter = 3
        level29.hydrogenCounter = 3
        
        // How many of an element do you have left
        level29.counters["Potassium"] = 1
        level29.counters["Oxygen"] = 1
        level29.counters["Hydrogen"] = 1
        
        
        level29.goal = 3
        level29.smallLabel = "Potassium Hydroxide"
        level29.level = 29
        level29.ElementImage1 = 1
        level29.ElementImage2 = 1
        level29.ElementImage3 = 1
        
        level29.ElementImage1Name = "Art Assets/Potassium.png"
        level29.ElementImage2Name = "Art Assets/Oxygen.png"
        level29.ElementImage3Name = "Art Assets/Hydrogen.png"
        
        
        level29.magnitude = ccp(0,30)
        level29.spawnThese = [3,1,2,3]
        level29.randomMin = 1
        level29.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level29.smallOrderLabel = "Potassium Hydroxide"
        
        levels.append(level29)
        
        
        //Sulfur dioxide - SO2
        var level30 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level30.sulfurCounter = 3
        level30.oxygenCounter = 3
        
        // How many of an element do you have left
        level30.counters["Sulfur"] = 1
        level30.counters["Oxygen"] = 2
        
        
        level30.goal = 3
        level30.smallLabel = "Sulfur Dioxide"
        level30.level = 30
        level30.ElementImage1 = 1
        level30.ElementImage2 = 1
        
        level30.ElementImage1Name = "Art Assets/Sulfur.png"
        level30.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level30.magnitude = ccp(0,30)
        level30.spawnThese = [3,1,2,3]
        level30.randomMin = 1
        level30.randomMax = 3
        
        //add an order label of what the user is making in this level
        
        level30.smallOrderLabel = "Sulfur Dioxide"
        level30.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        levels.append(level30)
        
        
        
    }
    
}