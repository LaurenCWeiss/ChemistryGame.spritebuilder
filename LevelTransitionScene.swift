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
        
        var spriteC = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteC.position = ccp(screenWidth/2,250)
        self.addChild(spriteC)
    }
    
    
    func startContinueButton() {
        var levelData: LevelData = LevelData()
        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        if Gamestate.sharedInstance.highestCompletedLevel == Gamestate.sharedInstance.internLevel {
            
            loadCareerUpScene()
            
        } else {
            
            let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
            CCDirector.sharedDirector().replaceScene(LevelTransitionScene)
        }
    }
    
    
    func loadCareerUpScene() {
        let scene = CCBReader.loadAsScene("CareerUpScene")
        let transition = CCTransition(fadeWithDuration: 0.8)
        CCDirector.sharedDirector().presentScene(scene)
    }
    
}

