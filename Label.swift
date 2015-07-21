//
//  ChemicalName.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class Label: CCNode {
    
    var smallLabel: CCLabelTTF!
      var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {
//        smallLabel.string = "title" --this works just shows title
//        smallLabel.string = "LevelData.level.smallLabel"
//          smallLabel.string = LevelData.curLevel.smallLabel
        
        //works for 1st level-shows you made water
      
    }
    override func update(delta: CCTime) {
smallLabel.string = levelData.levels[LevelData.curLevel].smallLabel
    }


}