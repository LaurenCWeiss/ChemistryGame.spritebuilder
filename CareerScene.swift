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
        spriteB.position = ccp(screenWidth/2,screenHeight/2)
        self.addChild(spriteB)
        
        var label = CCLabelTTF(string: "\(Gamestate.sharedInstance.levelUpData.text)", fontName: "AmericanTypewriter", fontSize: 30)
        label.name = "\(Gamestate.sharedInstance.levelUpData.text)Label"
        label.color = CCColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label.position = ccp(screenWidth/2,screenHeight/2 - 140)
        self.addChild(label)
        
    }
    
    
}
