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
    //    weak var levelNode: CCNode!
    weak var startPointNode: CCNode!
    weak var startPointNode2: CCNode!
    weak var startPointNode3: CCNode!
    var points: NSInteger = 0
    weak var ground1: Ground!
   //player receives 3 lives, not 2, 2-1-0=3
    var lives: Int = 2
    
    
    
    //stores the information (number of molecules for each level) for all levels
    //this is our global storage for all levels
    var levelData: LevelData = LevelData()
    
    //this is our local storage for specific parameters of current level
    var moleculeNodes: [CCNode] = [CCNode]()
    
    var moleculesArray = [LevelObject]()
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        gamePhysicsNode.debugDraw = true
        loadLevel()
        //    loadMoleculesPhysicsNode.collisionDelegate = self
        //    loadMoleculesPhysicsNode.debugDraw = true
        
        
        
        //      ground1.physicsBody.sensor = true
    }
    override func onEnter() {
        super.onEnter()
        
        self.schedule(Selector("dropMolecule"), interval: 2)
    }
    
    func loadNextLevelMolecules(molecules: [LevelObject]) {
        for molecule in molecules {
            for index in 0..<molecule.number {
                var moleculeNode = CCBReader.load("Molecules/\(molecule.name)")
                moleculeNode.position = startPointNode.position
                moleculeNodes.append(moleculeNode)
            }
        }
    }
    
    func dropMolecule(){
        if !moleculeNodes.isEmpty {
            var molecule = moleculeNodes.removeLast()
            gamePhysicsNode.addChild(molecule)
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
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, goal: Goal!, molec: CCNode!) -> Bool {
        //this collision is the circle collision at the top of the beaker/flask...this collision adds one to the score in the system so that the program knows to move up a level
        points += 1
//        println(points)
        
        return true
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, molec: CCNode!, ground: CCNode!) -> Bool {
        //"level" is referring to the ground or table; the game will end if this collision is detected(collision between the ground and a molecule)
        
        //        let popup = CCBReader.load("RestartPopup", owner:self) as! RestartPopup
        //        popup.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
        //        popup.position = CGPoint(x: 0.5, y: 0.5)
        //        parent.addChild(popup)
     
        if lives == 0 {
            gameOver()
            
        }
      
        if(true){
            lives -= 1
            points++
        }
        
    
        println(lives)
        return true
     
    }


    
    func gameOver() {
        
        //if the molecule hits the ground, end the game
             lives += 3
        let scene = CCBReader.loadAsScene("ScienceScene")
        CCDirector.sharedDirector().presentScene(scene)
        
    }
    
    
    
    //CCPHYSICSCOLLISIONSEPARATE
        func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, beakerBottom: CCNode!, ground: CCNode!) -> Bool {
           beaker.isTouchingGround = true
           return false
        }
    
        func ccPhysicsCollisionSeparate(pair: CCPhysicsCollisionPair!,  beakerBottom: CCNode!,  ground: CCNode!) {
            beaker.isTouchingGround = false
            println("sep")
    
        }

    /*
    func ccPhysicsCollisionPreSolve(pair: CCPhysicsCollisionPair!, molecDontLeave: CCNode!, molec: CCNode!) -> Bool {
        
        //if the molecule passes the second collision detection in the beaker, the boolean is set to false, meaning that the molecule can no longer pass through that detection(it's not invisible to the molecule anymore)
        println("enter")
        molec.physicsBody.collisionMask = ["dummy"]
        return false
    }
    
    func ccPhysicsCollisionSeparate(pair: CCPhysicsCollisionPair!, molecDontLeave: CCNode!, molec: CCNode!) -> Bool {
        
        //if the molecule passes the second collision detection in the beaker, the boolean is set to false, meaning that the molecule can no longer pass through that detection(it's not invisible to the molecule anymore)
        println("exit")
        molec.physicsBody.collisionMask = nil
        return true
    }*/
    
    
    
    func startLevelTransitionScene() {
        let scene = CCBReader.loadAsScene("LevelTransition")
        CCDirector.sharedDirector().presentScene(scene)
        
        //        gamePhysicsNode.addChild(beaker) //had to add "beaker" to ScienceScene under the beaker object in Sprite Builder
        
        // gamePhysicsNode.addChild(ground1)
    }
    
    override func update(delta: CCTime) {
        //if the number of points equals the number of molecules, then move on to the next level
        
        //        if LevelData.curLevel == 5 {
        //            LevelData.curLevel == 1
        //        }
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
        //IMPORTANT*******************************
//    func startit(){
//        let LevelSelect = CCBReader.loadAsScene("ScienceScene.LevelData.MyTransition")
//        CCDirector.sharedDirector().presentScene(LevelSelect)
//        
//
//    }
    
}