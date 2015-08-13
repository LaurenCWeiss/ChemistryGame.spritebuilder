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
        LevelData.curLevel = button.level
        let LevelSelect = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(LevelSelect)
    }
    
}


