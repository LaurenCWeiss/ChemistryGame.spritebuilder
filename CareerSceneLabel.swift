//
//  CareerSceneLabel.swift
//  STEM4Kids
//
//  Created by Lauren Weiss on 8/6/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class CareerSceneLabel: CCNode {
    
    var CareerSceneSmallLabel: CCLabelTTF!
    var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {
        
    //if total number of levels passed is 10, CareerSceneSmallLabel is set as "Intern"
        //and so on...
        
        
        CareerSceneSmallLabel.string = levelData.levels[LevelData.curLevel].CareerSceneSmallLabel
    
    }
    
    
}