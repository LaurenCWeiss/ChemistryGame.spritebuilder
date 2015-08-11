//
//  SettingsScene.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation



class SettingsScene: CCNode  {
    
    weak var contentNode: CCNode!
    
    
    func startMainMenu() {
        //        let MainScene = CCBReader.loadAsScene("HelpScene")
        CCDirector.sharedDirector().popScene()
        
    }
    func tiltControlOn() {
        
        //turn tilt on
        LevelData.tilt = true
        //       setupDeviceMotion(ScienceScene)
        println("tilt on")
    }
    func tiltControlOff() {
        //turn tilt off
         //backgroundColor = CCColor(red: 20.0/255, green: 20.0/255, blue: 80.0/255)
        LevelData.tilt = false
        //         setupDeviceMotion(ScienceScene)
        println("tilt off")
    }
    
    
}
