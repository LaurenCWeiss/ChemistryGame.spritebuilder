//
//  LevelTransitionScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelTransitionScene: CCNode {
    
    
    func didLoadFromCCB() {
   
        var levelData: LevelData = LevelData()
        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        
        
       
        
        //shows current career scientist image
        var spriteC = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteC.position = ccp(screenWidth/2,250)
        self.addChild(spriteC)
        
      
        
        
    }
    
    
    
    func startContinueButton() {
             var levelData: LevelData = LevelData()
         let currentLevelData = levelData.levels[LevelData.curLevel]
//        
//       LevelData.curLevel += 1
          if currentLevelData.level - 1 == 0 {
            loadCareerUpScene()
        }
          else {
//            
//

            let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
            CCDirector.sharedDirector().replaceScene(LevelTransitionScene)
        }
//        
//        if (LevelData.curLevel + 1) > 29 {
//            LevelData.curLevel = 0
//        } else {
//            LevelData.curLevel++
//        }
//        
        
//        CCDirector.sharedDirector().popScene()
        
        
        
//        if (LevelData.curLevel) >= levelData.levels.count {
//            LevelData.curLevel = 0
//        } else {
//            LevelData.curLevel++
//        }
        
        
        

//
//                if (LevelData.curLevel + 1) >= levelData.levels.count {
//                    LevelData.curLevel = 0
//                } else {
//                    LevelData.curLevel++
//                }

    }
    
        func loadCareerUpScene(){
            
            
            let scene = CCBReader.loadAsScene("CareerUpScene")
            
            let transition = CCTransition(fadeWithDuration: 0.8)
            
            CCDirector.sharedDirector().presentScene(scene)
            
        }

    func loadLabReport2() {
        
//        let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
//        CCDirector.sharedDirector().pushScene(LevelTransitionScene)

        
//        let scene = CCBReader.loadAsScene("LabReport2")
//        
//        let transition = CCTransition(fadeWithDuration: 0.8)
//        
//        CCDirector.sharedDirector().presentScene(scene)
//        
        
    }

    }
   
