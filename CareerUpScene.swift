//
//  CareerUpScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/30/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class CareerUpScene: CCNode {
    
    var levelData: LevelData = LevelData()
    var currentLevelData: Data?
    
    func didLoadFromCCB() {
        loadLevelTransitionScene()
        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        //add the image of the new career to the scene
        var spriteB = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteB.position = ccp(50.0,73.0)
        self.addChild(spriteB)
        
    }
    func loadLevelTransitionScene(){
        let scene = CCBReader.loadAsScene("LevelTransitionScene")
        
        let transition = CCTransition(fadeWithDuration: 0.8)
        
        CCDirector.sharedDirector().presentScene(scene)

    }
    
    
    func startContinueButton() {
        
        CCDirector.sharedDirector().popScene()

        
    }

}