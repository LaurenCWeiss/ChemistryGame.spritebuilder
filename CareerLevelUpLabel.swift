//
//  CareerLevelUpLabel.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/30/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class CareerLevelUpLabel: CCNode {
    
    var careerUpSmallLabel: CCLabelTTF!
    var levelData: LevelData = LevelData()
    
    
    func didLoadFromCCB() {
        careerUpSmallLabel.string = levelData.levels[LevelData.curLevel].careerUpSmallLabel
    }
}

