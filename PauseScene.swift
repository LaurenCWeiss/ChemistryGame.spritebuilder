//
//  PauseScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation



class PauseScene: CCNode, CCPhysicsCollisionDelegate {
    
    weak var contentNode: CCNode!
 
    func startMainMenu() {
        let PauseScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(PauseScene)
        
    }
    
    func startLevelSelect() {
        let PauseScene = CCBReader.loadAsScene("LevelSelect")
        CCDirector.sharedDirector().presentScene(PauseScene)
        
    }
    
    func startContinue() {
    let PauseScene = CCBReader.loadAsScene("ScienceScene")
    CCDirector.sharedDirector().presentScene(PauseScene)
        
        
    }
    
    

    
    
}
