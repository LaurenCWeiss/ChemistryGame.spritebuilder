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
    var moleculeNode: CCNode!
    var currentLevelData: Data?
    
    
    
    //stores the information (number of molecules for each level) for all levels
    //this is the global storage for all levels
    var levelData: LevelData = LevelData()
    
    //this is the local storage for specific parameters of current level
    var moleculeNodes: [CCNode] = [CCNode]()
    
    var moleculesArray = [LevelObject]()
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        //  gamePhysicsNode.debugDraw = true
        currentLevelData = levelData.levels[LevelData.curLevel]
    }
    override func onEnter() {
        super.onEnter()
        
        self.schedule(Selector("dropMolecule"), interval: 2)
    }
    

    func dropMolecule(){
        //should this be in the update function?
        //for spawning random atoms
        //how to know the difference of spawning atoms to avoid and atoms that must be spawned?
        
        
        //use spawnThisNumber to run through how many times I want something to randomly spawn
        //problem is that what if atoms that need to be spawned aren't spawned
        //need mechanism that will ensure that the atoms from level data are spawned, that enough of them are actually spawned
        var fileName:String = ""
        
        var spawnMolecule:Int = currentLevelData!.spawnThese.randomItem()
        
        switch spawnMolecule {
        case 1:
            fileName = "Molecules/Hydrogen"
        case 2:
            fileName = "Molecules/Oxygen"
        default:
            println("No Molecule :(")
        }
        
        var moleculeNode = CCBReader.load(fileName)
       
        //after atom obstalce has been randomly chosen, drop the atom at a random position
        moleculeNode.position = ccp(CGFloat.random(min: 50.0, max: 200.0),600)
        
        moleculeNodes.append(moleculeNode)
        
        
        if !moleculeNodes.isEmpty {
            var molecule = moleculeNodes.removeLast()
            gamePhysicsNode.addChild(molecule)
            
            let magnitude = levelData.levels[LevelData.curLevel].magnitude
            let randomImpulse = ccpAdd(ccp(CGFloat.random(min: -magnitude.x, max: magnitude.x),0),ccp(3.0,0))
            
            molecule.physicsBody.applyImpulse(randomImpulse)
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
        CCDirector.sharedDirector().pushScene(ScienceScene)
    }
    
    
    func restartButton() {
        let ScienceScene = CCBReader.loadAsScene("ScienceScene")
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
        
        let transition = CCTransition(fadeWithDuration: 0.8)
        
        CCDirector.sharedDirector().presentScene(scene)
        
    }
    
    override func update(delta: CCTime) {
        
        //if the number of points equals the number of molecules released, then move on to the next level
        
        if points == levelData.levels[LevelData.curLevel].goal {
            
        cleanup()
        //call scene transition here
        startLevelTransitionScene()
        
        }
    }
    
}