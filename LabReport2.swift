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
    var screenHeight:CGFloat = 0.0
    
    
    
    
    func didLoadFromCCB() {
        
                if (LevelData.curLevel + 1) > 29 {
                    LevelData.curLevel = 0
                } else {
                    LevelData.curLevel++
                }
        

        
        
        userInteractionEnabled = true
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.size.width
        screenHeight = screenSize.size.height
        
        currentLevelData = levelData.levels[LevelData.curLevel]
       // Label.smallLabel.string = levelData.levels[LevelData.curLevel].smallLabel

        
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
        if currentLevelData?.counters["Lithium"]>0 { requiredAtoms.append("Lithium") }
        if currentLevelData?.counters["Aluminum"]>0 { requiredAtoms.append("Aluminum") }
        if currentLevelData?.counters["Chlorine"]>0 { requiredAtoms.append("Chlorine") }
        if currentLevelData?.counters["Copper"]>0 { requiredAtoms.append("Copper") }
        if currentLevelData?.counters["Sulfur"]>0 { requiredAtoms.append("Sulfur") }
        if currentLevelData?.counters["Calcium"]>0 { requiredAtoms.append("Calcium") }
        if currentLevelData?.counters["Phosphorus"]>0 { requiredAtoms.append("Phosphorus") }
        if currentLevelData?.counters["Iron"]>0 { requiredAtoms.append("Iron") }
        if currentLevelData?.counters["Potassium"]>0 { requiredAtoms.append("Potassium") }
        if currentLevelData?.counters["Sodium"]>0 { requiredAtoms.append("Sodium") }
        if currentLevelData?.counters["Telluride"]>0 { requiredAtoms.append("Telluride") }
        if currentLevelData?.counters["Gallium"]>0 { requiredAtoms.append("Gallium") }
        if currentLevelData?.counters["Bromine"]>0 { requiredAtoms.append("Bromine") }
        if currentLevelData?.counters["Mercury"]>0 { requiredAtoms.append("Mercury") }
        var ypos:[CGFloat] = [0,0,0,0]
        
        let numImages = requiredAtoms.count
        
        
        if numImages == 1 {
            ypos[0] = screenHeight/2.16216216
        }
        if numImages == 2 {
            
            ypos[0] = screenHeight/1.87026671
            ypos[1] = screenHeight/2.57479601
            
        }
        if numImages == 3 {
    
            ypos[0] = screenHeight/1.87026671
            ypos[1] = screenHeight/2.57479601
            ypos[2] = screenHeight/4.1459854
        }
        
        if numImages == 4 {
       
            ypos[0] = screenHeight/1.787916
            ypos[1] = screenHeight/2.22734
            ypos[2] = screenHeight/2.948652
            ypos[3] = screenHeight/4.3219
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






