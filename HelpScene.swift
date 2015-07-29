//
//  HelpScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class HelpScene: CCNode, CCPhysicsCollisionDelegate {
    //scene where the user can receive information on how to play the game
    //loads the main scene using the back button
    
    weak var contentNode: CCNode!
    
    func startMainMenu() {
//        let MainScene = CCBReader.loadAsScene("HelpScene")
        CCDirector.sharedDirector().popScene()
        
    }}
