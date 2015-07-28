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
    func startMainMenu3() {
        let CareerScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(CareerScene)
        
    }
    
}