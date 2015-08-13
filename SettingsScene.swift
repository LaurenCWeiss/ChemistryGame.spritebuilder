//
//  SettingsScene.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation



class SettingsScene: CCNode  {
    
    weak var controlOn: CCButton!
    weak var controlOff: CCButton!
    
    func didLoadFromCCB() {
    controlOn.selected = true
    }
    
    
    func startMainMenu() {
        CCDirector.sharedDirector().popScene()
    }
    
    func tiltControlOn() {
        //setLabelColor for state
        controlOn.selected = true
        controlOff.selected = false
        LevelData.tilt = true
    }
    
    func tiltControlOff() {
        controlOff.selected = true
        controlOn.selected = false
        LevelData.tilt = false
    }
    
}
