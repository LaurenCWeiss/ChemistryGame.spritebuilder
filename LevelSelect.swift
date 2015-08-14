//
//  LevelSelect.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelSelect: CCNode {
    
    var levelData: LevelData = LevelData()
    var currentLevelData: Data?
    
    func startMainMenu2() {
        let LevelSelect = CCBReader.loadAsScene("PauseScene")
        CCDirector.sharedDirector().presentScene(LevelSelect)
    }
    
    func startLevel(button:LevelButton) {
        let levelNum = button.level
        
        LevelData.curLevel = levelNum
        Gamestate.sharedInstance.currentLevelNumber = levelNum + 1
        
        let LevelSelect = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(LevelSelect)
    }
    
}


