//
//  File.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/31/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class smallOrderLabel: CCNode {
    
    var smallOrderLabel: CCLabelTTF!
    var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {
        
        smallOrderLabel.string = levelData.levels[LevelData.curLevel].smallOrderLabel
    }
    
    
}