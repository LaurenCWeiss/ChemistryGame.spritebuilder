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
    var screenSize:CGRect = CGRectZero
    var screenWidth:CGFloat = 0.0
    
    func didLoadFromCCB() {
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.size.width
//        var MyNewCareerScientistImageSmallLabel = Gamestate.sharedInstance.levelUpData.imageName
        var careerUpSmallLabel = Gamestate.sharedInstance.levelUpData.text
        var MyNewCareerScientistImage = Gamestate.sharedInstance.levelUpData.imageName
        
        var spriteB = CCSprite(imageNamed:"\(MyNewCareerScientistImage)")
        spriteB.position = ccp(screenWidth/2,230)
        self.addChild(spriteB)
    
    
    }
    
    
    func startContinueButton() {
//        if let levelNum = currentLevelData?.level {
//            if levelNum > Gamestate.sharedInstance.highestCompletedLevel {
//                Gamestate.sharedInstance.highestCompletedLevel = levelNum
//            }
//        }
        

        let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
        CCDirector.sharedDirector().replaceScene(LevelTransitionScene)
        
    }
    
}