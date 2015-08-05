//
//  LabelForLevelTransitionScene.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/5/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
import Foundation


class LabelForLevelTransitionScene: CCNode {
    //smallLabel is the label that is changed depending on the level in the LevelSelect scene
    var smallLabelA: CCLabelTTF!
    var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {
        
        smallLabelA.string = levelData.levels[LevelData.curLevel].smallLabelA
        
    }
    
    
}