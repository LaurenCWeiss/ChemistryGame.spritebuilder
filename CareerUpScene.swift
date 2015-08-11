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
    //weak var careerUpSmallLabel: CCLabelTTF!
   var careerUpSmallLabel: String = " "
    
    var screenSize:CGRect = CGRectZero
    var screenWidth:CGFloat = 0.0
//    var MyNewCareerScientistImage: CCSprite!
    var MyNewCareerScientistImage: String!
    
    func didLoadFromCCB() {
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.size.width

        let currentLevelData = levelData.levels[LevelData.curLevel]
        
        if LevelData.currentRank == 0 {
//            MyNewCareerScientistImage = "Scientist1.png"
            MyNewCareerScientistImage = "Art Assets/Scientist1.png"
            careerUpSmallLabel = "You're an intern!"

        }
        else if LevelData.currentRank == 5 {
            MyNewCareerScientistImage = "Art Assets/Scientist2.png"
            careerUpSmallLabel = "You're a technician!"
        }
        else if LevelData.currentRank == 10 {
            MyNewCareerScientistImage = "Art Assets/Scientist3.png"
            careerUpSmallLabel = "You're an associate scientist!"
        }
        else if LevelData.currentRank == 15 {
            MyNewCareerScientistImage = "Art Assets/Scientist4.png"

        }
        
        
        //add the image of the new career to the scene

        
        var spriteB = CCSprite(imageNamed:"\(MyNewCareerScientistImage)")
        spriteB.position = ccp(screenWidth/2,350)
        self.addChild(spriteB)
        
       
        var label:CCLabelTTF! = self.getChildByName("\(careerUpSmallLabel)", recursively: true) as! CCLabelTTF
        
        label.string = "\(careerUpSmallLabel)"
        
       

        
        
    }

    
    
    func startContinueButton() {
        
        //what if scene is not level transition scene? For certain levels, it is the careerUpScene
//        LevelData.curLevel += 1
        let LevelTransitionScene = CCBReader.loadAsScene("LabReport2")
        CCDirector.sharedDirector().replaceScene(LevelTransitionScene)
        
    }

    
    


}