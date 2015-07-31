//
//  CareerScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class CareerScene: CCNode, CCPhysicsCollisionDelegate {
    //scene that shows information about the user's career
    //loads the main menu from the career scene using the back button

    weak var contentNode: CCNode!
    var levelData: LevelData = LevelData()
    var currentLevelData: Data?
    
    func didLoadFromCCB() {
        showCareerImageAndLabel()
    }
    
    func startMainMenu() {
        
        CCDirector.sharedDirector().popScene()
        
    }
    func showCareerImageAndLabel() {
        
        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        //show career image
     
        
        //add the image of the new career to the scene
        var spriteC = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteC.position = ccp(50.0,73.0)
        self.addChild(spriteC)

        
        
        //show career title
        var labelCareer = CCLabelTTF(string: "\(currentLevelData.careerUpSmallLabelForLevel)", fontName: "Arial", fontSize: 100)
        labelCareer.name = "\(currentLevelData.careerUpSmallLabelForLevel)Label"
        labelCareer.position = ccp(50,25)
        self.addChild(labelCareer)

        
        
    }
}