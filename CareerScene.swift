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
    var careerUpSmallLabel = Gamestate.sharedInstance.levelUpData.text
    
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

        
       var spriteB = CCSprite(imageNamed:"\(Gamestate.sharedInstance.levelUpData.imageName)")
        spriteB.position = ccp(screenWidth/2,200)
        self.addChild(spriteB)
        
        var label = CCLabelTTF(string: "\(Gamestate.sharedInstance.levelUpData.text)", fontName: "Arial", fontSize: 20)
        label.name = "\(Gamestate.sharedInstance.levelUpData.text)Label"
        label.position = ccp(200,25)
        self.addChild(label)
        
    }
    
    
}
