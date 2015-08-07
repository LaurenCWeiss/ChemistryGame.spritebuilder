//
//  ChemicalName.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class Label: CCNode {
    //smallLabel is the label that is changed depending on the level in the LevelSelect scene
    var smallLabel: CCLabelTTF!
    var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {

    smallLabel.string = levelData.levels[LevelData.curLevel+1].smallLabel

    }


}