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

    func startMainMenu2() {
        
        let LevelSelect = CCBReader.loadAsScene("PauseScene")
        CCDirector.sharedDirector().presentScene(LevelSelect)
        
    }
    
    func startLevel(button:LevelButton) {
        //println checks that correct level loads when its button is pressed in level select
        println("StartLevel: \(button.level)")
        
        LevelData.curLevel = button.level
        //loads gameplay scene for the level that is pressed
        let LevelSelect = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(LevelSelect)

     
    }
    
}


