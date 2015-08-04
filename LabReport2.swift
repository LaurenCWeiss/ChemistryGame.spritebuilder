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
    


    
    func didLoadFromCCB() {
        
                userInteractionEnabled = true
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.size.width
        
        currentLevelData = levelData.levels[LevelData.curLevel]
        
       
    }
    
    override func onEnter() {
        setReportImages()

    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
//            CCDirector.sharedDirector().popScene()
        
        
//        let scene = CCBReader.loadAsScene("")
        let LabReport2 = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().replaceScene(LabReport2)
    }

    
    
    
//                let scene = CCBReader.loadAsScene("")
//        
//                let scene = CCBReader.loadAsScene("ScienceScene")
//                CCDirector.sharedDirector().presentScene(scene)
    
//     Calculate Required Atoms
//    still use hydrogenCounter and oxygenCounter here...
    
    func setReportImages() {
       
        if currentLevelData?.counters["Hydrogen"]>0 { requiredAtoms.append("Hydrogen") }
        if currentLevelData?.counters["Oxygen"]>0 { requiredAtoms.append("Oxygen") }
        if currentLevelData?.counters["Carbon"]>0 { requiredAtoms.append("Carbon") }
        if currentLevelData?.counters["Nitrogen"]>0 { requiredAtoms.append("Nitrogen") }
      
        var ypos:[CGFloat] = [0,0,0,0]
        
        let numImages = requiredAtoms.count
    
        
        if numImages == 1 {
            ypos[0] = 338
        }
        if numImages == 2 {
            
            ypos[0] = 338
            ypos[1] = 247
            
        }
        if numImages == 3 {
            //positioning is incorrect for this one
            ypos[0] = 337
            ypos[1] = 289
            ypos[2] = screenWidth/3
        }
        
        if numImages == 4 {
            //positioning is incorrect for this one

            ypos[0] = screenWidth/5
            ypos[1] = screenWidth/5 * 2
            ypos[2] = screenWidth/5 * 3
            ypos[3] = screenWidth/5 * 4
        }
        
        // Setup Images for Atoms
        for (index,atomType) in enumerate(requiredAtoms) {
            
            // Add Images
            var sprite = CCSprite(imageNamed:"Art Assets/\(atomType).png")
            sprite.position = ccp(screenWidth/2 - 30,ypos[index])
            self.addChild(sprite)
            
            // Add Labels
            var label = CCLabelTTF(string: "\(currentLevelData!.counters[atomType]!)", fontName: "Chalkduster", fontSize: 50)
            label.name = "\(atomType)Label"
            label.position = ccp(screenWidth/2 + 50,ypos[index])
            label.color = CCColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            self.addChild(label)
            
        }

    
        }}
    
   

    
    
    
