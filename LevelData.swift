//
//  Levels.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

struct Data {
    
    //counters for different elements
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
    var counters = [String: Int]()
    
    //labes necessary for each level
    var smallLabel: String = " "
    var smallLabelA: String = " "
    var smallLevelLabel: String = " "
    var careerUpSmallLabel: String = " "
    var careerUpSmallLabelForLevel: String = ""
    
    
    //goal number and level number for each level
    var level: Int = 0
    var goal: Int = 0
    
    //speed of atoms + spawning
    var magnitude:CGPoint = CGPointZero
    var spawnThese: [Int] = []
    var randomMin: Int = 0
    var randomMax: Int = 0
    var spawnThisManyRandomOnes: Int = 0
    
    
    //element images + order label
    var ElementImage1Name: String!
    var ElementImage2Name: String!
    var ElementImage3Name: String!
    var ElementImage4Name: String!
    var ElementImage1: Int = 0
    var ElementImage2: Int = 0
    var ElementImage3: Int = 0
    var ElementImage4: Int = 0
    var smallOrderLabel: String = " "
    var MyNewCareerScientistImage: String!

}


struct LevelData {
    
    
    static let defaults = NSUserDefaults.standardUserDefaults()
    static var showCareer = false
    var levels:[Data] = [Data]()
    
    
    static var curLevel: Int {
        
        get {
        return defaults.integerForKey("curLevel")
        }
        
        set {
            defaults.setInteger(newValue, forKey: "curLevel")
            println("Set Level:\(newValue)")
        }
    }
    
    
    static var currentRank: Int {
        
        get {
        return defaults.integerForKey("currentRank")
        }
        
        set {
            defaults.setInteger(newValue, forKey: "currentRank")
        }
    }
    
    static var tilt: Bool {
        
        get {
        return defaults.boolForKey("tilt")
        }
        set {
            defaults.setBool(newValue, forKey: "tilt")
            
        }
    }
    
    
    init() {
        
        
        var level1 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level1.hydrogenCounter = 3
        level1.oxygenCounter = 3
        
        
        //how many of an element do you have left
        level1.counters["Oxygen"] = 1
        level1.counters["Hydrogen"] = 2
        
        
        level1.goal = 3
        level1.smallLabel = "Water"
        level1.smallLabelA = "Water - H2O"
        level1.level = 1
        level1.ElementImage1 = 1
        level1.ElementImage2 = 1
        level1.ElementImage1Name = "Art Assets/Hydrogen.png"
        level1.ElementImage2Name = "Art Assets/Oxygen.png"
        
        level1.magnitude = ccp(50,100)
//        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
        level1.randomMin = 1
        level1.randomMax = 5
        level1.spawnThisManyRandomOnes = 5
        
        
        //add intern career level
        level1.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        level1.careerUpSmallLabelForLevel = "Intern"
        level1.smallOrderLabel = "Water-H2O"
        level1.smallLevelLabel = "Level 1"
        level1.careerUpSmallLabel = "You're an intern!"

        
        
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
        level2.smallLabelA = "Carbon Monoxide-CO"
        level2.level = 2
        level2.ElementImage1 = 1
        level2.ElementImage2 = 1
        level2.ElementImage1Name = "Art Assets/Carbon.png"
        level2.ElementImage2Name = "Art Assets/Oxygen.png"
        //        level2.careerUpSmallLabel = "sci"
        level2.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
         level2.spawnThisManyRandomOnes = 5
        
        level2.magnitude = ccp(0,30)
        level2.spawnThese = [3,1,2,3]
        level2.randomMin = 1
        level2.randomMax = 6
        
        
        //add an order label of what the user is making in this level
        level2.careerUpSmallLabel = "You're an intern!"
        
        
        level2.smallOrderLabel = "Carbon Monoxide-CO"
        
        level2.smallLevelLabel = "Level 2"
        
        levels.append(level2)
        
        
        
        var level3 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level3.nitrogenCounter = 2
        level3.hydrogenCounter = 5
        
        
        // How many of an element do you have left
        level3.counters["Nitrogen"] = 1
        level3.counters["Hydrogen"] = 3
        
        level3.goal = 4
        level3.smallLabel = "Ammonia-NH3"
        level3.smallLabelA = "Ammonia-NH3"
        
        level3.level = 3
        level3.ElementImage1 = 1
        level3.ElementImage2 = 1
        level3.ElementImage1Name = "Art Assets/Nitrogen.png"
        level3.ElementImage2Name = "Art Assets/Hydrogen.png"
        level3.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level3.magnitude = ccp(50,80)

        level3.randomMin = 1
        level3.randomMax = 8
        level3.spawnThisManyRandomOnes = 5
        
        
        //add an order label of what the user is making in this level
        
        level3.smallLevelLabel = "Level 3"
        
        
        levels.append(level3)
        
        
        
        var level4 = Data()
        
        //need to this ensure that hydrogen atoms are dropped
        level4.carbonCounter = 2
        level4.hydrogenCounter = 2
        
        
        // How many of an element do you have left
        level4.counters["Carbon"] = 2
        level4.counters["Hydrogen"] = 2
        
        level4.goal = 4
        level4.smallLabel = "Acetylene-C2H2"
        level4.smallLabelA = "Acetylene-C2H2"
        level4.level = 4
        level4.ElementImage1 = 1
        level4.ElementImage2 = 1
        level4.ElementImage1Name = "Art Assets/Carbon.png"
        level4.ElementImage2Name = "Art Assets/Hydrogen.png"
        level4.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level4.magnitude = ccp(50,100)
     
        level4.randomMin = 1
        level4.randomMax = 6
         level4.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level4.smallLevelLabel = "Level 4"
        
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
        level5.smallLabelA = "Acetic Acid-C2H4O2"
        level5.level = 5
        level5.ElementImage1 = 1
        level5.ElementImage2 = 1
        level5.ElementImage3 = 1
        
        level5.ElementImage1Name = "Art Assets/Carbon.png"
        level5.ElementImage2Name = "Art Assets/Hydrogen.png"
        level5.ElementImage3Name =  "Art Assets/Oxygen.png"
        
        level5.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level5.magnitude = ccp(5,80)
   
        level5.randomMin = 1
        level5.randomMax = 7
         level5.spawnThisManyRandomOnes = 5
        
        level5.smallLevelLabel = "Level 5"
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
        
        level6.goal = 3
        level6.smallLabel = "Lithium Nitrite"
        level6.smallLabelA = "Lithium Nitrite-LiNO2"
       
        level6.level = 6
        level6.ElementImage1 = 1
        level6.ElementImage2 = 1
        level6.ElementImage3 = 1
        
        level6.ElementImage1Name = "Art Assets/Lithium.png"
        level6.ElementImage2Name = "Art Assets/Nitrogen.png"
        level6.ElementImage3Name =  "Art Assets/Oxygen.png"
         level6.spawnThisManyRandomOnes = 5
        level6.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level6.magnitude = ccp(10,300)

        level6.randomMin = 1
        level6.randomMax = 15
        level6.smallLevelLabel = "Level 6"
        
        //add an order label of what the user is making in this level
        level6.careerUpSmallLabel = "You're a researcher!"
        
        
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
        level7.smallLabelA = "Aluminum Chloride-AlCl3"
        level7.level = 7
        level7.ElementImage1 = 1
        level7.ElementImage2 = 1
        
        
        level7.ElementImage1Name = "Art Assets/Aluminum.png"
        level7.ElementImage2Name = "Art Assets/Chlorine.png"
         level7.spawnThisManyRandomOnes = 5
        
        level7.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level7.magnitude = ccp(5,30)
   
        level7.randomMin = 1
        level7.randomMax = 16
        level7.smallLevelLabel = "Level 7"
        
        //add an order label of what the user is making in this level
        //        level7.careerUpSmallLabel = "You're a researcher!"
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
        level8.smallLabelA = "Carbon Dioxide-CO2"
        level8.level = 8
        level8.ElementImage1 = 1
        level8.ElementImage2 = 1
        level8.ElementImage1Name = "Art Assets/Carbon.png"
        level8.ElementImage2Name = "Art Assets/Oxygen.png"
        
        level8.magnitude = ccp(0,30)
 
        level8.randomMin = 1
        level8.randomMax = 17
         level8.spawnThisManyRandomOnes = 5
        
        level8.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        //add an order label of what the user is making in this level
        
        level8.smallOrderLabel = "Carbon Dioxide"
        level8.smallLevelLabel = "Level 8"
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
        level9.smallLabelA = "Copper Sulfate-CuSO4"
        level9.level = 9
        level9.ElementImage1 = 1
        level9.ElementImage2 = 1
        level9.ElementImage3 = 1
        level9.ElementImage1Name = "Art Assets/Copper.png"
        level9.ElementImage2Name = "Art Assets/Sulfur.png"
        level9.ElementImage3Name = "Art Assets/Oxygen.png"
        
        level9.magnitude = ccp(0,30)
     
        level9.randomMin = 1
        level9.randomMax = 18
        
        level9.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        //add an order label of what the user is making in this level
        
        level9.smallOrderLabel = "Copper Sulfate"
        level9.smallLevelLabel = "Level 9"
         level9.spawnThisManyRandomOnes = 5
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
        level10.smallLabelA = "Aluminum Oxide-Al2O3"
        level10.level = 10
        level10.ElementImage1 = 1
        level10.ElementImage2 = 1
        
        level10.ElementImage1Name = "Art Assets/Aluminum.png"
        level10.ElementImage2Name = "Art Assets/Oxygen.png"
        
        
        level10.magnitude = ccp(0,30)
        level10.spawnThese = [3,1,2,3]
        level10.randomMin = 1
        level10.randomMax = 18
        level10.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        //add an order label of what the user is making in this level
         level10.spawnThisManyRandomOnes = 5
        level10.smallOrderLabel = "Aluminum Oxide"
        level10.smallLevelLabel = "Level 10"
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
        level11.smallLabelA = "Ammonium-NH4"
        level11.level = 11
        level11.ElementImage1 = 1
        level11.ElementImage2 = 1
        
        level11.ElementImage1Name = "Art Assets/Nitrogen.png"
        level11.ElementImage2Name = "Art Assets/Hydrogen.png"
        
        
        level11.magnitude = ccp(0,30)
        level11.spawnThese = [3,1,2,3]
        level11.randomMin = 1
        level11.randomMax = 18
        level11.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        //add an order label of what the user is making in this level
         level11.spawnThisManyRandomOnes = 5
        level11.smallOrderLabel = "Ammonium"
        level11.smallLevelLabel = "Level 11"
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
        level12.randomMax = 18
        level12.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        //add an order label of what the user is making in this level
         level12.spawnThisManyRandomOnes = 5
        level12.smallOrderLabel = "Nitrite"
        level12.smallLabelA = "Nitrite-NO2"
          level12.smallLevelLabel = "Level 12"
        
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
        level13.randomMax = 18
        level13.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        //add an order label of what the user is making in this level
        level13.spawnThisManyRandomOnes = 5
        level13.smallOrderLabel = "Hydronium"
         level13.smallLabelA = "Hydronium-H3O"
          level13.smallLevelLabel = "Level 13"
        
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
        level14.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        level14.magnitude = ccp(0,30)
        level14.spawnThese = [3,1,2,3]
        level14.randomMin = 1
        level14.randomMax = 18
         level14.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level14.smallOrderLabel = "Hydrogen Sulfate"
        level14.smallLabelA = "Hydrogen Sulfate-HSO4"
          level14.smallLevelLabel = "Level 14"
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
        level15.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level15.magnitude = ccp(0,30)
        level15.spawnThese = [3,1,2,3]
        level15.randomMin = 1
        level15.randomMax = 18
         level15.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level15.smallOrderLabel = "Hydroxide"
        level15.smallLabelA = "Hydroxide-OH"
          level15.smallLevelLabel = "Level 15"
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
        level16.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level16.magnitude = ccp(0,30)
        level16.spawnThese = [3,1,2,3]
        level16.randomMin = 1
        level16.randomMax = 18
         level16.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level16.smallOrderLabel = "Calcium Carbonate"
        level16.smallLabelA = "Calcium Carbonate-CaCO3"
          level16.smallLevelLabel = "Level 16"
        
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
        level17.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level17.magnitude = ccp(0,30)
        level17.spawnThese = [3,1,2,3]
        level17.randomMin = 1
        level17.randomMax = 18
         level17.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level17.smallOrderLabel = "Nitrate"
        level17.smallLabelA = "Nitrate-NO3"
          level17.smallLevelLabel = "Level 17"
        
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
        level18.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
          level18.smallLevelLabel = "Level 18"
        
        level18.magnitude = ccp(0,30)
        level18.spawnThese = [3,1,2,3]
        level18.randomMin = 1
        level18.randomMax = 18
         level18.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level18.smallOrderLabel = "Chloroform"
         level18.smallLabelA = "Chloroform-CHCl3"
        
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
        level19.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level19.magnitude = ccp(0,30)
        level19.spawnThese = [3,1,2,3]
        level19.randomMin = 1
        level19.randomMax = 18
         level19.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level19.smallOrderLabel = "Ethane"
                 level19.smallLabelA = "Ethane-C2H6"
          level19.smallLevelLabel = "Level 19"
        
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
        level20.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level20.magnitude = ccp(0,30)
        level20.spawnThese = [3,1,2,3]
        level20.randomMin = 1
        level20.randomMax = 18
         level20.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level20.smallOrderLabel = "Iron(tri) Phosphide"
                  level20.smallLabelA = "Iron(tri) Phosphide-Fe3P"
          level20.smallLevelLabel = "Level 20"
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
        level21.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
          level21.smallLabelA = "Potassium Nitrite-KNO2"
        
        
        
        level21.magnitude = ccp(0,30)
        level21.spawnThese = [3,1,2,3]
        level21.randomMin = 1
        level21.randomMax = 18
         level21.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
          level21.smallLevelLabel = "Level 21"
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
        level22.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
          level22.smallLabelA = "Sodium Chloride-NaCl"
        
        
        level22.magnitude = ccp(0,30)
        level22.spawnThese = [3,1,2,3]
        level22.randomMin = 1
        level22.randomMax = 18
         level22.spawnThisManyRandomOnes = 5
          level22.smallLevelLabel = "Level 22"
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
        level23.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level23.magnitude = ccp(0,30)
        level23.spawnThese = [3,1,2,3]
        level23.randomMin = 1
        level23.randomMax = 18
         level23.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
             level23.smallLabelA = "Disodium Telluride"
        
        level23.smallOrderLabel = "Disodium Telluride-Na2Te"
          level23.smallLevelLabel = "Level 23"
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
        level24.smallLabel = "Galium(3) Bromide"
        level24.level = 24
        level24.ElementImage1 = 1
        level24.ElementImage2 = 1
        
        level24.ElementImage1Name = "Art Assets/Gallium.png"
        level24.ElementImage2Name = "Art Assets/Bromine.png"
        level24.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level24.magnitude = ccp(0,30)
        level24.spawnThese = [3,1,2,3]
        level24.randomMin = 1
        level24.randomMax = 18
         level24.spawnThisManyRandomOnes = 5
            level24.smallLabelA = "Galium(3) Bromide-GaBr3"
        //add an order label of what the user is making in this level
        
        level24.smallOrderLabel = "Galium(3) Bromide"
          level24.smallLevelLabel = "Level 24"
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
        level25.smallLabel = "Mercury(1) Bromide"
        level25.level = 25
        level25.ElementImage1 = 1
        level25.ElementImage2 = 1
        
        level25.ElementImage1Name = "Art Assets/Mercury.png"
        level25.ElementImage2Name = "Art Assets/Bromine.png"
        level25.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level25.magnitude = ccp(0,30)
        level25.spawnThese = [3,1,2,3]
        level25.randomMin = 1
        level25.randomMax = 18
         level25.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level25.smallOrderLabel = "Mercury(1) Bromide"
            level25.smallLabelA = "Mercury(1) Bromide-HgBr2"
          level25.smallLevelLabel = "Level 25"
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
        level26.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level26.magnitude = ccp(0,30)
        level26.spawnThese = [3,1,2,3]
        level26.randomMin = 1
        level26.randomMax = 18
         level26.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level26.smallOrderLabel = "Potassium Oxide"
           level26.smallLabelA = "Potassium Oxide-K2O"
          level26.smallLevelLabel = "Level 26"
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
        level27.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level27.magnitude = ccp(0,30)
        level27.spawnThese = [3,1,2,3]
        level27.randomMin = 1
        level27.randomMax = 18
         level27.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level27.smallOrderLabel = "Mercuric Chloride"
           level27.smallLabelA = "Mercuric Chloride-HgS"
          level27.smallLevelLabel = "Level 27"
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
        level28.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level28.magnitude = ccp(0,30)
        level28.spawnThese = [3,1,2,3]
        level28.randomMin = 1
        level28.randomMax = 18
         level28.spawnThisManyRandomOnes = 5
        //add an order label of what the user is making in this level
        
        level28.smallOrderLabel = "Nitrogen Dioxide"
           level28.smallLabelA = "Nitrogen Dioxide-NO2"
          level28.smallLevelLabel = "Level 28"
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
        level29.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
           level29.smallLabelA = "Potassium Hydroxide-KOH"
          level29.smallLevelLabel = "Level 29"
        level29.magnitude = ccp(0,30)
        level29.spawnThese = [3,1,2,3]
        level29.randomMin = 1
        level29.randomMax = 18
         level29.spawnThisManyRandomOnes = 5
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
        level30.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
        
        
        level30.magnitude = ccp(1000,1200)
        level30.spawnThese = [3,1,2,3]
        level30.randomMin = 1
        level30.randomMax = 18
         level30.spawnThisManyRandomOnes = 10
        //add an order label of what the user is making in this level
        
        level30.smallOrderLabel = "Sulfur Dioxide"
           level30.smallLabelA = "Sulfur Dioxide-SO2"
        level30.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
          level30.smallLevelLabel = "Level 30"
        
        levels.append(level30)
        
        
        
        
//        
//        var level31 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level31.hydrogenCounter = 3
//        level31.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level31.counters["Oxygen"] = 1
//        level31.counters["Hydrogen"] = 2
//        
//        
//        level31.goal = 3
//        level31.smallLabel = "Water"
//        level31.smallLabelA = "Water - H2O"
//        level31.level = 31
//        level31.ElementImage1 = 1
//        level31.ElementImage2 = 1
//        level31.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level31.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level31.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level31.randomMin = 1
//        level31.randomMax = 5
//        level31.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level31.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level31.careerUpSmallLabelForLevel = "Intern"
//        level31.smallOrderLabel = "Water-H2O"
//        level31.smallLevelLabel = "Level 1"
//        level31.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level31)
//        
//        var level32 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level32.hydrogenCounter = 3
//        level32.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level32.counters["Oxygen"] = 1
//        level32.counters["Hydrogen"] = 2
//        
//        
//        level32.goal = 3
//        level32.smallLabel = "Water"
//        level32.smallLabelA = "Water - H2O"
//        level32.level = 32
//        level32.ElementImage1 = 1
//        level32.ElementImage2 = 1
//        level32.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level32.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level32.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level32.randomMin = 1
//        level32.randomMax = 5
//        level32.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level32.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level32.careerUpSmallLabelForLevel = "Intern"
//        level32.smallOrderLabel = "Water-H2O"
//        level32.smallLevelLabel = "Level 1"
//        level32.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level32)
//        
//        
//        var level33 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level33.hydrogenCounter = 3
//        level33.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level33.counters["Oxygen"] = 1
//        level33.counters["Hydrogen"] = 2
//        
//        
//        level33.goal = 3
//        level33.smallLabel = "Water"
//        level33.smallLabelA = "Water - H2O"
//        level33.level = 33
//        level33.ElementImage1 = 1
//        level33.ElementImage2 = 1
//        level33.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level33.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level33.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level33.randomMin = 1
//        level33.randomMax = 5
//        level33.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level33.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level33.careerUpSmallLabelForLevel = "Intern"
//        level33.smallOrderLabel = "Water-H2O"
//        level33.smallLevelLabel = "Level 1"
//        level33.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level33)
//        
//        
//        var level34 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level34.hydrogenCounter = 3
//        level34.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level34.counters["Oxygen"] = 1
//        level34.counters["Hydrogen"] = 2
//        
//        
//        level34.goal = 3
//        level34.smallLabel = "Water"
//        level34.smallLabelA = "Water - H2O"
//        level34.level = 34
//        level34.ElementImage1 = 1
//        level34.ElementImage2 = 1
//        level34.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level34.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level34.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level34.randomMin = 1
//        level34.randomMax = 5
//        level34.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level34.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level34.careerUpSmallLabelForLevel = "Intern"
//        level34.smallOrderLabel = "Water-H2O"
//        level34.smallLevelLabel = "Level 1"
//        level34.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level34)
//        
//        
//        var level35 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level35.hydrogenCounter = 3
//        level35.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level35.counters["Oxygen"] = 1
//        level35.counters["Hydrogen"] = 2
//        
//        
//        level35.goal = 3
//        level35.smallLabel = "Water"
//        level35.smallLabelA = "Water - H2O"
//        level35.level = 35
//        level35.ElementImage1 = 1
//        level35.ElementImage2 = 1
//        level35.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level35.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level35.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level35.randomMin = 1
//        level35.randomMax = 5
//        level35.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level35.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level35.careerUpSmallLabelForLevel = "Intern"
//        level35.smallOrderLabel = "Water-H2O"
//        level35.smallLevelLabel = "Level 1"
//        level35.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level35)
//        
//        
//        
//        var level36 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level36.hydrogenCounter = 3
//        level36.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level36.counters["Oxygen"] = 1
//        level36.counters["Hydrogen"] = 2
//        
//        
//        level36.goal = 3
//        level36.smallLabel = "Water"
//        level36.smallLabelA = "Water - H2O"
//        level36.level = 36
//        level36.ElementImage1 = 1
//        level36.ElementImage2 = 1
//        level36.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level36.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level36.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level36.randomMin = 1
//        level36.randomMax = 5
//        level36.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level36.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level36.careerUpSmallLabelForLevel = "Intern"
//        level36.smallOrderLabel = "Water-H2O"
//        level36.smallLevelLabel = "Level 1"
//        level36.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level36)
//        
//        
//        
//        var level37 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level37.hydrogenCounter = 3
//        level37.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level37.counters["Oxygen"] = 1
//        level37.counters["Hydrogen"] = 2
//        
//        
//        level37.goal = 3
//        level37.smallLabel = "Water"
//        level37.smallLabelA = "Water - H2O"
//        level37.level = 37
//        level37.ElementImage1 = 1
//        level37.ElementImage2 = 1
//        level37.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level37.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level37.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level37.randomMin = 1
//        level37.randomMax = 5
//        level37.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level37.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level37.careerUpSmallLabelForLevel = "Intern"
//        level37.smallOrderLabel = "Water-H2O"
//        level37.smallLevelLabel = "Level 1"
//        level37.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level37)
//        
//        
//        
//        var level38 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level38.hydrogenCounter = 3
//        level38.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level38.counters["Oxygen"] = 1
//        level38.counters["Hydrogen"] = 2
//        
//        
//        level38.goal = 3
//        level38.smallLabel = "Water"
//        level38.smallLabelA = "Water - H2O"
//        level38.level = 38
//        level38.ElementImage1 = 1
//        level38.ElementImage2 = 1
//        level38.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level38.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level38.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level38.randomMin = 1
//        level38.randomMax = 5
//        level38.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level38.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level38.careerUpSmallLabelForLevel = "Intern"
//        level38.smallOrderLabel = "Water-H2O"
//        level38.smallLevelLabel = "Level 1"
//        level38.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level38)
//        
//        
//        
//        var level39 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level39.hydrogenCounter = 3
//        level39.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level39.counters["Oxygen"] = 1
//        level39.counters["Hydrogen"] = 2
//        
//        
//        level39.goal = 3
//        level39.smallLabel = "Water"
//        level39.smallLabelA = "Water - H2O"
//        level39.level = 39
//        level39.ElementImage1 = 1
//        level39.ElementImage2 = 1
//        level39.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level39.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level39.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level39.randomMin = 1
//        level39.randomMax = 5
//        level39.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level39.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level39.careerUpSmallLabelForLevel = "Intern"
//        level39.smallOrderLabel = "Water-H2O"
//        level39.smallLevelLabel = "Level 1"
//        level39.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level39)
//        
//        
//        
//        var level40 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level40.hydrogenCounter = 3
//        level40.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level40.counters["Oxygen"] = 1
//        level40.counters["Hydrogen"] = 2
//        
//        
//        level40.goal = 3
//        level40.smallLabel = "Water"
//        level40.smallLabelA = "Water - H2O"
//        level40.level = 40
//        level40.ElementImage1 = 1
//        level40.ElementImage2 = 1
//        level40.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level40.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level40.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level40.randomMin = 1
//        level40.randomMax = 5
//        level40.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level40.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level40.careerUpSmallLabelForLevel = "Intern"
//        level40.smallOrderLabel = "Water-H2O"
//        level40.smallLevelLabel = "Level 1"
//        level40.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level40)
//        
//        
//        
//        
//        var level41 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level41.hydrogenCounter = 3
//        level41.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level41.counters["Oxygen"] = 1
//        level41.counters["Hydrogen"] = 2
//        
//        
//        level41.goal = 3
//        level41.smallLabel = "Water"
//        level41.smallLabelA = "Water - H2O"
//        level41.level = 41
//        level41.ElementImage1 = 1
//        level41.ElementImage2 = 1
//        level41.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level41.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level41.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level41.randomMin = 1
//        level41.randomMax = 5
//        level41.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level41.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level41.careerUpSmallLabelForLevel = "Intern"
//        level41.smallOrderLabel = "Water-H2O"
//        level41.smallLevelLabel = "Level 1"
//        level41.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level41)
//        
//        
//        
//        var level42 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level42.hydrogenCounter = 3
//        level42.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level42.counters["Oxygen"] = 1
//        level42.counters["Hydrogen"] = 2
//        
//        
//        level42.goal = 3
//        level42.smallLabel = "Water"
//        level42.smallLabelA = "Water - H2O"
//        level42.level = 42
//        level42.ElementImage1 = 1
//        level42.ElementImage2 = 1
//        level42.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level42.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level42.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level42.randomMin = 1
//        level42.randomMax = 5
//        level42.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level42.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level42.careerUpSmallLabelForLevel = "Intern"
//        level42.smallOrderLabel = "Water-H2O"
//        level42.smallLevelLabel = "Level 1"
//        level42.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level42)
//        
//        
//        
//        
//        var level43 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level43.hydrogenCounter = 3
//        level43.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level43.counters["Oxygen"] = 1
//        level43.counters["Hydrogen"] = 2
//        
//        
//        level43.goal = 3
//        level43.smallLabel = "Water"
//        level43.smallLabelA = "Water - H2O"
//        level43.level = 43
//        level43.ElementImage1 = 1
//        level43.ElementImage2 = 1
//        level43.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level43.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level43.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level43.randomMin = 1
//        level43.randomMax = 5
//        level43.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level43.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level43.careerUpSmallLabelForLevel = "Intern"
//        level43.smallOrderLabel = "Water-H2O"
//        level43.smallLevelLabel = "Level 1"
//        level43.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level43)
//        
//        
//        
//        
//        var level44 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level44.hydrogenCounter = 3
//        level44.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level44.counters["Oxygen"] = 1
//        level44.counters["Hydrogen"] = 2
//        
//        
//        level44.goal = 3
//        level44.smallLabel = "Water"
//        level44.smallLabelA = "Water - H2O"
//        level44.level = 44
//        level44.ElementImage1 = 1
//        level44.ElementImage2 = 1
//        level44.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level44.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level44.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level44.randomMin = 1
//        level44.randomMax = 5
//        level44.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level44.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level44.careerUpSmallLabelForLevel = "Intern"
//        level44.smallOrderLabel = "Water-H2O"
//        level44.smallLevelLabel = "Level 1"
//        level44.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level44)
//        
//        
//        
//        var level45 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level45.hydrogenCounter = 3
//        level45.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level45.counters["Oxygen"] = 1
//        level45.counters["Hydrogen"] = 2
//        
//        
//        level45.goal = 3
//        level45.smallLabel = "Water"
//        level45.smallLabelA = "Water - H2O"
//        level45.level = 45
//        level45.ElementImage1 = 1
//        level45.ElementImage2 = 1
//        level45.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level45.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level45.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level45.randomMin = 1
//        level45.randomMax = 5
//        level45.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level45.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level45.careerUpSmallLabelForLevel = "Intern"
//        level45.smallOrderLabel = "Water-H2O"
//        level45.smallLevelLabel = "Level 1"
//        level45.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level45)
//        
//        
//        
//        
//        var level46 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level46.hydrogenCounter = 3
//        level46.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level46.counters["Oxygen"] = 1
//        level46.counters["Hydrogen"] = 2
//        
//        
//        level46.goal = 3
//        level46.smallLabel = "Water"
//        level46.smallLabelA = "Water - H2O"
//        level46.level = 46
//        level46.ElementImage1 = 1
//        level46.ElementImage2 = 1
//        level46.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level46.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level46.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level46.randomMin = 1
//        level46.randomMax = 5
//        level46.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level46.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level46.careerUpSmallLabelForLevel = "Intern"
//        level46.smallOrderLabel = "Water-H2O"
//        level46.smallLevelLabel = "Level 1"
//        level46.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level46)
//        
//        
//        
//        var level47 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level47.hydrogenCounter = 3
//        level47.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level47.counters["Oxygen"] = 1
//        level47.counters["Hydrogen"] = 2
//        
//        
//        level47.goal = 3
//        level47.smallLabel = "Water"
//        level47.smallLabelA = "Water - H2O"
//        level47.level = 47
//        level47.ElementImage1 = 1
//        level47.ElementImage2 = 1
//        level47.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level47.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level47.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level47.randomMin = 1
//        level47.randomMax = 5
//        level47.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level47.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level47.careerUpSmallLabelForLevel = "Intern"
//        level47.smallOrderLabel = "Water-H2O"
//        level47.smallLevelLabel = "Level 1"
//        level47.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level47)
//        
//        
//        
//        
//        var level48 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level48.hydrogenCounter = 3
//        level48.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level48.counters["Oxygen"] = 1
//        level48.counters["Hydrogen"] = 2
//        
//        
//        level48.goal = 3
//        level48.smallLabel = "Water"
//        level48.smallLabelA = "Water - H2O"
//        level48.level = 48
//        level48.ElementImage1 = 1
//        level48.ElementImage2 = 1
//        level48.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level48.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level48.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level48.randomMin = 1
//        level48.randomMax = 5
//        level48.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level48.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level48.careerUpSmallLabelForLevel = "Intern"
//        level48.smallOrderLabel = "Water-H2O"
//        level48.smallLevelLabel = "Level 1"
//        level48.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level48)
//        
//        
//        
//        var level49 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level49.hydrogenCounter = 3
//        level49.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level49.counters["Oxygen"] = 1
//        level49.counters["Hydrogen"] = 2
//        
//        
//        level49.goal = 3
//        level49.smallLabel = "Water"
//        level49.smallLabelA = "Water - H2O"
//        level49.level = 49
//        level49.ElementImage1 = 1
//        level49.ElementImage2 = 1
//        level49.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level49.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level49.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level49.randomMin = 1
//        level49.randomMax = 5
//        level49.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level49.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level49.careerUpSmallLabelForLevel = "Intern"
//        level49.smallOrderLabel = "Water-H2O"
//        level49.smallLevelLabel = "Level 1"
//        level49.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level49)
//        
//        
//        
//        
//        var level50 = Data()
//        
//        //need to this ensure that hydrogen atoms are dropped
//        level50.hydrogenCounter = 3
//        level50.oxygenCounter = 3
//        
//        
//        //how many of an element do you have left
//        level50.counters["Oxygen"] = 1
//        level50.counters["Hydrogen"] = 2
//        
//        
//        level50.goal = 3
//        level50.smallLabel = "Water"
//        level50.smallLabelA = "Water - H2O"
//        level50.level = 50
//        level50.ElementImage1 = 1
//        level50.ElementImage2 = 1
//        level50.ElementImage1Name = "Art Assets/Hydrogen.png"
//        level50.ElementImage2Name = "Art Assets/Oxygen.png"
//        
//        level50.magnitude = ccp(50,100)
//        //        level1.spawnThese = [3,1,2,4,5,6,7,8,9]
//        level50.randomMin = 1
//        level50.randomMax = 5
//        level50.spawnThisManyRandomOnes = 5
//        
//        
//        //add intern career level
//        level50.MyNewCareerScientistImage = "Art Assets/Scientist0.png"
//        level50.careerUpSmallLabelForLevel = "Intern"
//        level50.smallOrderLabel = "Water-H2O"
//        level50.smallLevelLabel = "Level 1"
//        level50.careerUpSmallLabel = "You're an intern!"
//        
//        
//        
//        levels.append(level50)
//        
        
        
    }
    
}