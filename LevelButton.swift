//
//  ChemicalName.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelButton: CCButton {
    //shows different level buttons in the level select scene
    var level: Int = 0
    var currentLevelData: Data?
    func didLoadFromCCB() {
        self.title = "Level: \(level + 1)"
        
      
        
        if currentLevelData?.passed == true {
            
            var spriteC = CCSprite(imageNamed:"Art Assets/star.png")
            
            spriteC.position = ccpAdd(self.position,ccp(20,20))
            
            self.addChild(spriteC)
            
            
            
        }
        
        
    }
    
    
    
    
}