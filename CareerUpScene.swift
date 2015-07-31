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

        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        //add the image of the new career to the scene
        var spriteB = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteB.position = ccp(172,320)
        self.addChild(spriteB)
        
    }

    
    
    func startContinueButton() {
        
        //what if scene is not level transition scene? For certain levels, it is the careerUpScene
        
        let LevelTransitionScene = CCBReader.loadAsScene("LabReportOrderScene")
        CCDirector.sharedDirector().pushScene(LevelTransitionScene)
        
    }

    
    


}