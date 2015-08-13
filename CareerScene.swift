//
//  CareerScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class CareerScene: CCNode {
    
    //CareerScene is accessed through MainScene
    
    var levelData: LevelData = LevelData()
    var currentLevelData: Data?
    var MyNewCareerScientistImage: String!
    
    
    func didLoadFromCCB() {
        showCareerImageAndLabel()
    }
    
    func startMainMenu() {
        CCDirector.sharedDirector().popScene()
    }
    
    func showCareerImageAndLabel() {
        let currentLevelData = levelData.levels[LevelData.curLevel]
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        var MyNewCareerScientistImage = Gamestate.sharedInstance.levelUpData.imageName
        
        var spriteB = CCSprite(imageNamed:"\(MyNewCareerScientistImage)")
        spriteB.position = ccp(screenWidth/2,350)
        self.addChild(spriteB)
    }
    
}
