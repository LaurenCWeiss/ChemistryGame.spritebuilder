//
//  ScienceScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

//container to store the name of a moelcule and corresponding number of molecules
struct LevelObject {
    var name: String
    var number: Int
    
}

class ScienceScene: CCNode, CCPhysicsCollisionDelegate {
    
    weak var contentNode: CCNode!
    weak var beaker: Beaker!
    weak var molecule: Molecule!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var loadMoleculesPhysicsNode: CCPhysicsNode!
    weak var startPointNode: CCNode!
    var points: NSInteger = 0
    weak var ground1: Ground!

    
    
    
    //stores the information (number of molecules for each level) for all levels
    //this is the global storage for all levels
    var levelData: LevelData = LevelData()
    
    //this is the local storage for specific parameters of current level
    var moleculeNodes: [CCNode] = [CCNode]()
    
    var moleculesArray = [LevelObject]()
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        gamePhysicsNode.debugDraw = true
        loadLevel()
    }
    override func onEnter() {
        super.onEnter()
        
        self.schedule(Selector("dropMolecule"), interval: 2)
    }
    
    func loadNextLevelMolecules(molecules: [LevelObject]) {
        for molecule in molecules {
            for index in 0..<molecule.number {
                var moleculeNode = CCBReader.load("Molecules/\(molecule.name)")
                
                moleculeNode.position = ccp(CGFloat.random(min: 50.0, max: 200.0),600)
                moleculeNodes.append(moleculeNode)
            }
        }
    }
    
    func dropMolecule(){
        if !moleculeNodes.isEmpty {
            var molecule = moleculeNodes.removeLast()
            gamePhysicsNode.addChild(molecule)
            molecule.physicsBody.applyImpulse(ccp(0, 20))
        }
    }
    
    func cleanup() {
        moleculeNodes.removeAll(keepCapacity: false)
        moleculesArray.removeAll(keepCapacity: false)
    }
    
    override func onEnterTransitionDidFinish() {
        super.onEnterTransitionDidFinish()
        
        self.userInteractionEnabled = true
    }
    
    func startPause() {
        let ScienceScene = CCBReader.loadAsScene("PauseScene")
        CCDirector.sharedDirector().presentScene(ScienceScene)
    }
    
    
    //MARK:- Physics
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, goal: Goal!, molec: Molecule!) -> Bool {
        //this collision is the circle collision at the top of the beaker/flask...this collision adds one to the score in the system so that the program knows to move up a level
        if molec.inBeaker == false {
            points++
            molec.inBeaker = true
            //if we were to return true we would say just let physics continue on, but we want to return false so that the physics detection is still made
            return false
        }
        
        
        
        return true
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, molec: CCNode!, ground: CCNode!) -> Bool {
        //"level" is referring to the ground or table; the game will end if this collision is detected(collision between the ground and a molecule)
        gameOver()
        
        return true
        
    }

    
    func gameOver() {
        
        //if the molecule hits the ground, end the game
        
        //LOAD RESTART POPUP HERE
        
        let popup = CCBReader.load("RestartPopup", owner:self) as! RestartPopup
        popup.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
        popup.position = CGPoint(x: 0.5, y: 0.5)
        parent.addChild(popup)
        
        
    }

    func startLevelTransitionScene() {
        let scene = CCBReader.loadAsScene("LevelTransitionScene")
        CCDirector.sharedDirector().presentScene(scene)
        
        //        gamePhysicsNode.addChild(beaker) //had to add "beaker" to ScienceScene under the beaker object in Sprite Builder
        
        // gamePhysicsNode.addChild(ground1)
    }
    
    override func update(delta: CCTime) {
        //if the number of points equals the number of molecules, then move on to the next level
        
        
        if points == levelData.levels[LevelData.curLevel].goal {
            
            cleanup()
            //call scene transition here
            startLevelTransitionScene()
        }
        
        
    }
    
    func loadLevel() {
        
        let newLevelData: Data = levelData.levels[LevelData.curLevel]
        
        if(newLevelData.oxygen > 0) {
            var levelObject = LevelObject(name: "Oxygen", number: newLevelData.oxygen)
            moleculesArray.append(levelObject)
        }
        
        
        if(newLevelData.hydrogen > 0) {
            var levelObject = LevelObject(name: "Hydrogen", number: newLevelData.hydrogen)
            moleculesArray.append(levelObject)
        }
        
        // add to array
        loadNextLevelMolecules(moleculesArray)

        
    }
    
    
}