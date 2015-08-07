//
//  SettingsScene.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation



class SettingsScene: CCNode, CCPhysicsCollisionDelegate  {
    
    weak var contentNode: CCNode!
    
  
    func startMainMenu() {
        //        let MainScene = CCBReader.loadAsScene("HelpScene")
        CCDirector.sharedDirector().popScene()
        
    }
    func tiltControlOn() {
       //turn tilt on
        ScienceScene.tilt = true
    }
    func tiltControlOff() {
       //turn tilt off
        ScienceScene.tilt = false
    }


}
