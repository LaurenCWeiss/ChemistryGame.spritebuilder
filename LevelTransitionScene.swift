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
        
        ////////important
        checkIfCareerUpSceneShouldLoad()
        

        
    }
    
    
    func checkIfCareerUpSceneShouldLoad() {
            var levelData: LevelData = LevelData()
        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        if LevelData.curLevel == 1 || LevelData.curLevel == 10 {
            
            let LevelTransitionScene = CCBReader.loadAsScene("CareerUpScene")
            CCDirector.sharedDirector().pushScene(LevelTransitionScene)
            
        }

    func startContinueButton() {
        
        var levelData: LevelData = LevelData()
        if (LevelData.curLevel + 1) >= levelData.levels.count {
            LevelData.curLevel = 0
        } else {
            LevelData.curLevel++
        }
        let scene = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(scene)

    }

    }
    
    
   
}