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

    
    
    var screenSize:CGRect = CGRectZero
    var screenWidth:CGFloat = 0.0

        
    
    func didLoadFromCCB() {
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.size.width

        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        //add the image of the new career to the scene
        var spriteB = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteB.position = ccp(screenWidth/2,350)
        self.addChild(spriteB)
        
    }

    
    
    func startContinueButton() {
        
        //what if scene is not level transition scene? For certain levels, it is the careerUpScene
        
        let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
        CCDirector.sharedDirector().pushScene(LevelTransitionScene)
        
    }

    
    


}