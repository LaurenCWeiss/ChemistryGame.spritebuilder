//
//  LevelTransitionScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelTransitionScene: CCNode {

    func startContinueButton() {
        var levelData: LevelData = LevelData()
        if (LevelData.curLevel + 1) >= levelData.levels.count {
            LevelData.curLevel = 0
        } else {
            LevelData.curLevel++
        }
        let scene = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
}