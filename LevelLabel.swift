//
//  LevelLabel.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/6/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class LevelLabel: CCNode {
    
    //shows the user what level they are on in ScienceScene
    
    var smallLevelLabel: CCLabelTTF!
    var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {
        smallLevelLabel.string = levelData.levels[LevelData.curLevel].smallLevelLabel
    }
    
}