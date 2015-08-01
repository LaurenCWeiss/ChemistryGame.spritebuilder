//
//  LabReport2.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/31/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class LabReport2: CCNode {

    var levelData: LevelData = LevelData()
    var currentLevelData: Data?
 
    var requiredAtoms:[String] = []
    
    var screenSize:CGRect = CGRectZero
    var screenWidth:CGFloat = 0.0
    
    var xpos:[CGFloat] = [0,0,0,0]

    
    func didLoadFromCCB() {
        
//       setReportImages()
        userInteractionEnabled = true
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.size.width
        
        currentLevelData = levelData.levels[LevelData.curLevel]
        
       
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
//             CCDirector.sharedDirector().popScene()
        
        
//        let scene = CCBReader.loadAsScene("")
        let LabReport2 = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().replaceScene(LabReport2)
    }
 
    
        //        let scene = CCBReader.loadAsScene("")
        
        //        let scene = CCBReader.loadAsScene("ScienceScene")
        //        CCDirector.sharedDirector().presentScene(scene)
    
    // Calculate Required Atoms
    //still use hydrogenCounter and oxygenCounter here...
//    
//    func setReportImages() {
//        if currentLevelData!.counters["Hydrogen"]>0 { requiredAtoms.append("Hydrogen") }
//        if currentLevelData!.counters["Oxygen"]>0 { requiredAtoms.append("Oxygen") }
//        
//        let numImages = requiredAtoms.count
//        
//        if numImages == 1 {
//            xpos[0] = screenWidth/2
//        }
//        if numImages == 2 {
//            
//            xpos[0] = screenWidth/4
//            xpos[1] = screenWidth/4 * 3
//            
//        }
//        if numImages == 3 {
//            //positioning is incorrect for this one
//            xpos[0] = screenWidth/4
//            xpos[1] = screenWidth/2
//            xpos[2] = screenWidth/3
//        }
//        
//        if numImages == 4 {
//            xpos[0] = screenWidth/5
//            xpos[1] = screenWidth/5 * 2
//            xpos[2] = screenWidth/5 * 3
//            xpos[3] = screenWidth/5 * 4
//        }
//        
//        // Setup Images for Atoms
//        for (index,atomType) in enumerate(requiredAtoms) {
//            
//            // Add Images
//            var sprite = CCSprite(imageNamed:"Art Assets/\(atomType).png")
//            sprite.position = ccp(xpos[index],73.0)
//            self.addChild(sprite)
//            
//            // Add Labels
//            var label = CCLabelTTF(string: "\(currentLevelData!.counters[atomType]!)", fontName: "Arial", fontSize: 20)
//            label.name = "\(atomType)Label"
//            label.position = ccp(xpos[index],25)
//            self.addChild(label)
//            
//        }
//        
    
    }
    
   

    
    
    
