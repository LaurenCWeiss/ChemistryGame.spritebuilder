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
//    
//    let currentLevelData = levelData.levels[LevelData.curLevel]
    
    func didLoadFromCCB() {
        
//        if currentLevelData?.passed == true {
//         userInteractionEnabled = true
//        } else {
//            userInteractionEnabled = false
//        }
        userInteractionEnabled = true
        
        if currentLevelData?.passed == true {
           
            var spriteC = CCSprite(imageNamed:"Art Assets/star.png")
            
//            spriteC.position = CGPoint(self.positionInPoints + 40,self.positionInPoints + 40)

            spriteC.position = CGPoint(x: self.positionInPoints.x, y: self.positionInPoints.y)
            
            self.addChild(spriteC)
            
            
            
        }
        
        
    }
    
    

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


