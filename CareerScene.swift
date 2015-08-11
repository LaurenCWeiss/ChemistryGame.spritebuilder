//
//  CareerScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class CareerScene: CCNode {
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
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
 
//        //show career title
//        var labelCareer = CCLabelTTF(string: "\(currentLevelData.careerUpSmallLabelForLevel)", fontName: "Arial", fontSize: 10)
//        labelCareer.name = "\(currentLevelData.careerUpSmallLabelForLevel)Label"
//        labelCareer.position = ccp(50,25)
//        self.addChild(labelCareer)

        
        
        
        var spriteC = CCSprite(imageNamed:"\(currentLevelData.MyNewCareerScientistImage)")
        spriteC.position = ccp(screenWidth/2,250)
        self.addChild(spriteC)
        
        
        

        
        
        
        
        
    }
}