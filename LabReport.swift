//
//  LabReportOrderScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/31/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LabReport: CCNode {
    
    var levelData: LevelData = LevelData()
    var currentLevelData: Data?
    
    
    func didLoadFromCCB() {
        
    }
    func touchBegan() {
        //if screen is clicked, load science scene
        
            let LabReport = CCBReader.loadAsScene("ScienceScene")
            CCDirector.sharedDirector().presentScene(scene)
    
     //        let scene = CCBReader.loadAsScene("")
    
    //        let scene = CCBReader.loadAsScene("ScienceScene")
    //        CCDirector.sharedDirector().presentScene(scene)

    }

}