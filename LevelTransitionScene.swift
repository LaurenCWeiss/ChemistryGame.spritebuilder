    //
    //  LevelTransitionScene.swift
    //  ChemistryGame
    //
    //  Created by Lauren Weiss on 7/16/15.
    //  Copyright (c) 2015 Apportable. All rights reserved.
    //
    
    import Foundation
    
    class LevelTransitionScene: CCNode {
        
        var currentLevelData: Data?
        func didLoadFromCCB() {
            var levelData: LevelData = LevelData()
            let currentLevelData = levelData.levels[LevelData.curLevel]
            
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let screenWidth = screenSize.width
            
            var spriteC = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
            spriteC.position = ccp(screenWidth/2,190)
            self.addChild(spriteC)
        }
        
        
        func startContinueButton() {
            var levelData: LevelData = LevelData()
            let currentLevelData = levelData.levels[LevelData.curLevel]
            
            //            println("highestcompletedlevel is:\(Gamestate.sharedInstance.highestCompletedLevel)")
            //            println("intern level is:\(Gamestate.sharedInstance.internLevel)")
            
            
            //        if Gamestate.sharedInstance.highestCompletedLevel == 1 {
            //            Gamestate.sharedInstance.highestCompletedLevel == 5
            //        }
            //        if Gamestate.sharedInstance.highestCompletedLevel == 5 {
            //            Gamestate.sharedInstance.highestCompletedLevel == 10
            //        }
            //        if Gamestate.sharedInstance.highestCompletedLevel == 10 {
            //            Gamestate.sharedInstance.highestCompletedLevel == 15
            //        }
            
            //        if Gamestate.sharedInstance.highestCompletedLevel == Gamestate.sharedInstance.internLevel || Gamestate.sharedInstance.highestCompletedLevel == Gamestate.sharedInstance.researcherLevel {
            //            loadCareerUpScene()
            //
            //        } else {
            //            Gamestate.sharedInstance.highestCompletedLevel += 1
            //            let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
            //            CCDirector.sharedDirector().replaceScene(LevelTransitionScene)
            //        }
            
            
//            println("highestcompletedlevel is:\(Gamestate.sharedInstance.highestCompletedLevel)")
            println("intern level is:\(Gamestate.sharedInstance.internLevel)")
            println("current level data level:\(currentLevelData.level)")
            
            if (LevelData.curLevel) > 29 {
                LevelData.curLevel = 1
            } else {
                LevelData.curLevel++
            }
            
            if Gamestate.sharedInstance.currentLevelNumber > Gamestate.sharedInstance.highestLevelNumberCompleted {
                Gamestate.sharedInstance.highestLevelNumberCompleted = Gamestate.sharedInstance.currentLevelNumber
            }
            
            if Gamestate.sharedInstance.internLevel == Gamestate.sharedInstance.currentLevelNumber ||
                Gamestate.sharedInstance.researcherLevel == Gamestate.sharedInstance.currentLevelNumber || Gamestate.sharedInstance.associateLevel == Gamestate.sharedInstance.currentLevelNumber || Gamestate.sharedInstance.technicianLevel == Gamestate.sharedInstance.currentLevelNumber || Gamestate.sharedInstance.seniorScientistLevel == Gamestate.sharedInstance.currentLevelNumber || Gamestate.sharedInstance.principleScientistLevel == Gamestate.sharedInstance.currentLevelNumber || Gamestate.sharedInstance.researchFellowLevel == Gamestate.sharedInstance.currentLevelNumber || Gamestate.sharedInstance.einsteinLevel == Gamestate.sharedInstance.currentLevelNumber {
                loadCareerUpScene()
                
            } else {
                Gamestate.sharedInstance.currentLevelNumber++
                let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
                CCDirector.sharedDirector().replaceScene(LevelTransitionScene)
            }
        }
        
        
        func loadCareerUpScene() {
            
            let scene = CCBReader.loadAsScene("CareerUpScene")
            let transition = CCTransition(fadeWithDuration: 0.8)
            CCDirector.sharedDirector().presentScene(scene)
            Gamestate.sharedInstance.currentLevelNumber++

        }
        
    }
    
