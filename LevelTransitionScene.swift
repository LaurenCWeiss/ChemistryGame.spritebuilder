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
        
        loadCareerUpScene()
               
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
        //if current level  = 0(level 1) then pop scene
        CCDirector.sharedDirector().popScene()
        
        
        var levelData: LevelData = LevelData()
        if (LevelData.curLevel + 1) >= levelData.levels.count {
            LevelData.curLevel = 0
        } else {
            LevelData.curLevel++
        }}
    
        func loadCareerUpScene(){
            let scene = CCBReader.loadAsScene("CareerUpScene")
            
            let transition = CCTransition(fadeWithDuration: 0.8)
            
            CCDirector.sharedDirector().presentScene(scene)
            
        }

     

    }
   
