//
//  RestartPopup.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

//import Foundation
//

import Foundation

class RestartPopup: CCNode {
    func restart() {
        let scene = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(scene)
        
    }
}