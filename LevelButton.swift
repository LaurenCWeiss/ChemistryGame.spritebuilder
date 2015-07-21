//
//  ChemicalName.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelButton: CCButton {
    
    var level: Int = 0
    
    func didLoadFromCCB() {
        print(level)
        self.title = "Level: \(level + 1)"
    }
    
    
}