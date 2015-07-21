//
//  LevelSelect.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelSelect: CCNode {
    
    func startMainMenu2() {
        
        let LevelSelect = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(LevelSelect)
        
    }
    
    func startLevel(button:LevelButton) {
        println("StartLevel: \(button.level)")
//        let LevelSelect = CCBReader.loadAsScene("ScienceScene.LevelData.level")
//        CCDirector.sharedDirector().presentScene(LevelSelect)
        
    }
    
}