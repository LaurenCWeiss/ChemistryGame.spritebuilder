//
//  ScienceScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

//container to store the name of a moelcule and corresponding number of atoms
struct LevelObject {
    var name: String
    var number: Int
    
}

class ScienceScene: CCNode, CCPhysicsCollisionDelegate {
    
    weak var contentNode: CCNode!
    weak var beaker: Beaker!
    weak var atom: Atom!
    weak var border: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var loadAtomsPhysicsNode: CCPhysicsNode!
    weak var startPointNode: CCNode!
    var points: NSInteger = 0
    var atomNode: CCNode!
    var currentLevelData: Data?
    var spawn:[Int] = []
    var passed = false
    weak var ground: Ground!
    
    // Labels
    
    var label1 : CCLabelTTF?
    var label2 : CCLabelTTF?
    var label3 : CCLabelTTF?
    var label4 : CCLabelTTF?
    
    //stores the information (number of atoms for each level) for all levels
    //this is the global storage for all levels
    var levelData: LevelData = LevelData()
    
    
    func didLoadFromCCB() {
        
        
        
        gamePhysicsNode.collisionDelegate = self
        //gamePhysicsNode.debugDraw = true
        //gamePhysicsNode.space.dampining = 0.80
        currentLevelData = levelData.levels[LevelData.curLevel]
        
        
        println(currentLevelData?.level)
        if(currentLevelData?.hydrogenCounter>0) {
            
            for i in 1...currentLevelData!.hydrogenCounter {
                spawn.append(1)
            }
        }
        if(currentLevelData?.oxygenCounter>0) {
            for i in 2...currentLevelData!.oxygenCounter {
                spawn.append(2)
            }
        }
        if(currentLevelData?.carbonCounter>0) {
            for i in 1...currentLevelData!.carbonCounter {
                spawn.append(3)
            }
        }
            if(currentLevelData?.nitrogenCounter>0) {
                for i in 1...currentLevelData!.nitrogenCounter {
                    spawn.append(4)
                }
            }
        
        if(currentLevelData?.lithiumCounter>0) {
            for i in 1...currentLevelData!.lithiumCounter {
                spawn.append(5)
            }
        }
        
        
        if(currentLevelData?.aluminumCounter>0) {
            for i in 1...currentLevelData!.aluminumCounter {
                spawn.append(6)
            }
        }
        
        if(currentLevelData?.chlorineCounter>0) {
            for i in 1...currentLevelData!.chlorineCounter {
                spawn.append(7)
            }
        }
        if(currentLevelData?.copperCounter>0) {
            for i in 1...currentLevelData!.copperCounter {
                spawn.append(8)
            }
        }
        if(currentLevelData?.sulfurCounter>0) {
            for i in 1...currentLevelData!.sulfurCounter {
                spawn.append(9)
            }
        }
        
        if(currentLevelData?.calciumCounter>0) {
            
            for i in 1...currentLevelData!.calciumCounter {
                spawn.append(10)
            }
        }
        if(currentLevelData?.phosphorusCounter>0) {
            
            for i in 1...currentLevelData!.phosphorusCounter {
                spawn.append(11)
            }
        }
        if(currentLevelData?.ironCounter>0) {
            
            for i in 1...currentLevelData!.ironCounter {
                spawn.append(12)
            }
        }
        if(currentLevelData?.potassiumCounter>0) {
            
            for i in 1...currentLevelData!.potassiumCounter {
                spawn.append(13)
            }
        }
        if(currentLevelData?.sodiumCounter>0) {
            
            for i in 1...currentLevelData!.sodiumCounter {
                spawn.append(14)
            }
        }
        if(currentLevelData?.tellurideCounter>0) {
            
            for i in 1...currentLevelData!.tellurideCounter {
                spawn.append(15)
            }
        }
        if(currentLevelData?.galliumCounter>0) {
            
            for i in 1...currentLevelData!.galliumCounter {
                spawn.append(16)
            }
        }
        if(currentLevelData?.bromineCounter>0) {
            
            for i in 1...currentLevelData!.bromineCounter {
                spawn.append(17)
            }
        }
        if(currentLevelData?.mercuryCounter>0) {
            
            for i in 1...currentLevelData!.mercuryCounter {
                spawn.append(18)
            }
        }
        
        
        //      Random Stuff
        for i in 1...3 {
            spawn.append(Int.random(min: currentLevelData!.randomMin, max: currentLevelData!.randomMax))
        }
        
        spawn.randomItem()
    
}

override func onEnter() {
    
    
    super.onEnter()
    
    self.schedule(Selector("dropAtom"), interval: 2)
    setImage()
}


func dropAtom(){
    
    //problem is that what if atoms that need to be spawned aren't spawned
    
    //need mechanism that will ensure that the atoms from level data are spawned, that enough of them are actually spawned
    var fileName:String = ""
    
    //        println(spawn.count)

    if spawn.count == 0 {
        gameOver()
        return
    }
    var spawnIndex:Int = spawn.randomItem()
    var spawnAtom = spawn[spawnIndex]
    spawn.removeAtIndex(spawnIndex)
    
    //check if array is empty using spawn.count == 0 or spawn.isEmpty
    
    switch spawnAtom {
    case 1:
        fileName = "Hydrogen"
    case 2:
        fileName = "Oxygen"
    case 3:
        fileName = "Carbon"
    case 4:
        fileName = "Nitrogen"
    case 5:
        fileName = "Lithium"
    case 6:
        fileName = "Aluminum"
    case 7:
        fileName = "Chlorine"
    case 8:
        fileName = "Copper"
    case 9:
        fileName = "Sulfur"
    case 10:
        fileName = "Calcium"
    case 11:
        fileName = "Phosphorus"
    case 12:
        fileName = "Iron"
    case 13:
        fileName = "Potassium"
    case 14:
        fileName = "Sodium"
    case 15:
        fileName = "Telluride"
    case 16:
        fileName = "Gallium"
    case 17:
        fileName = "Bromine"
    case 18:
        fileName = "Mercury"
        
    default:
        println("No Atom :(")
        //return so that if integer is equal to zero(which is what it is set at in level data) atoms will just stop falling
        return
        
    }
    
    var atomNode = CCBReader.load("Atoms/\(fileName)") as! Atom
    atomNode.type = fileName // Dynamicaly set atom type
    
    //after atom obstalce has been randomly chosen, drop the atom at a random position
    atomNode.position = ccp(CGFloat.random(min: 50.0, max: 200.0),600)
    
    gamePhysicsNode.addChild(atomNode)
    
    let magnitude = levelData.levels[LevelData.curLevel].magnitude
    let randomImpulse = ccpAdd(ccp(CGFloat.random(min: -magnitude.x, max: magnitude.x),0),ccp(3.0,0))
    
    atomNode.physicsBody.applyImpulse(randomImpulse)
    
}

func cleanup() {
    
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

func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, atomCollision: Atom!, ground: Ground!) -> Bool {
    
    atomCollision.removeFromParent()
    return true
    
    
}

func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, atomCollision: Atom!, border: Border!) -> Bool {
    let magnitude = levelData.levels[LevelData.curLevel].magnitude
    let randomImpulse = ccpAdd(ccp(CGFloat.random(min: -magnitude.x, max: magnitude.x),0),ccp(3.0,0))
    
    atomCollision.physicsBody.applyImpulse(randomImpulse)
    
    return true
}





//MARK:- Physics
func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, goal: Goal!, atomCollision: Atom!) -> Bool {
    //this collision is the circle collision at the top of the beaker/flask...this collision adds one to the score in the system so that the program knows to move up a level
    
    // If in beaker, bounce
    if atomCollision.inBeaker == true {
        return true
        
    }
    
    var collectAtom = false
    
    // Check Counters
    //println(atomCollision.type)
    //println(currentLevelData?.counters[atomCollision.type])
    
    if currentLevelData?.counters[atomCollision.type] > 0 {
        if let collection: Int = currentLevelData?.counters[atomCollision.type] {
            collectAtom = true
            currentLevelData?.counters[atomCollision.type] = collection - 1
            var label:CCLabelTTF! = self.getChildByName("\(atomCollision.type)Label", recursively: true) as! CCLabelTTF
            //allows correct # of atoms left of each element to be printed
            label.string = "\(currentLevelData!.counters[atomCollision.type]!)"
            //  label.string = "\(currentLevelData?.counters[atomCollision.type]!)"
            if currentLevelData!.counters[atomCollision.type]! == 0 {
                label.string = "✔️"
            }
        }
    }
    
    //println(currentLevelData?.counters[atomCollision.type])
    
    if collectAtom == true {
        
        points++
        atomCollision.inBeaker = true
        return false
        
    } else {
        gameOver()
    }
    
    return true
}

func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, beaker: Beaker!, border: CCNode!) -> Bool {
    
    return false
}




func gameOver() {
    
    unscheduleAllSelectors()
    self.gamePhysicsNode.paused = true
    
    //LOAD RESTART POPUP HERE
    
    let popup = CCBReader.load("RestartPopup", owner:self) as! RestartPopup
    popup.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
    popup.position = CGPoint(x: 0.5, y: 0.5)
    parent.addChild(popup)
    
    
    
    
}

func startLevelTransitionScene() {
    
    checkIfCareerUpSceneShouldLoad()
    
    
    
}
func checkIfCareerUpSceneShouldLoad() {
    
    
    if LevelData.curLevel == 0 {
        
        let ScienceScene = CCBReader.loadAsScene("LevelTransitionScene")
        CCDirector.sharedDirector().replaceScene(ScienceScene)
        println("curLevelhs:\(LevelData.curLevel)")
    }
            else {
                let ScienceScene = CCBReader.loadAsScene("LevelTransitionScene")
                CCDirector.sharedDirector().replaceScene(ScienceScene)
    
            }
    
}


override func update(delta: CCTime) {
    
    //if the number of points equals the number of atoms released, then move on to the next level
    
    if points == levelData.levels[LevelData.curLevel].goal {
//               LevelData.curLevel += 1
        cleanup()
        //call scene transition here
        startLevelTransitionScene()
        passed = true
        
    }
}

func setImage() {
    
    // Calculate Required Atoms
    var requiredAtoms:[String] = []
    
    let currentLevelData = levelData.levels[LevelData.curLevel]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    let screenWidth = screenSize.width
    
    var xpos:[CGFloat] = [0,0,0,0]
    
    // Calculate Required Atoms
    //still use hydrogenCounter and oxygenCounter here...
    
    if currentLevelData.counters["Hydrogen"]>0 { requiredAtoms.append("Hydrogen") }
    if currentLevelData.counters["Oxygen"]>0 { requiredAtoms.append("Oxygen") }
    if currentLevelData.counters["Carbon"]>0 { requiredAtoms.append("Carbon") }
    if currentLevelData.counters["Nitrogen"]>0 { requiredAtoms.append("Nitrogen") }
    if currentLevelData.counters["Lithium"]>0 { requiredAtoms.append("Lithium") }
    if currentLevelData.counters["Aluminum"]>0 { requiredAtoms.append("Aluminum") }
    if currentLevelData.counters["Chlorine"]>0 { requiredAtoms.append("Chlorine") }
    if currentLevelData.counters["Copper"]>0 { requiredAtoms.append("Copper") }
    if currentLevelData.counters["Sulfur"]>0 { requiredAtoms.append("Sulfur") }
    if currentLevelData.counters["Calcium"]>0 { requiredAtoms.append("Calcium") }
    if currentLevelData.counters["Phosphorus"]>0 { requiredAtoms.append("Phosphorus") }
    if currentLevelData.counters["Iron"]>0 { requiredAtoms.append("Iron") }
    if currentLevelData.counters["Potassium"]>0 { requiredAtoms.append("Potassium") }
    if currentLevelData.counters["Sodium"]>0 { requiredAtoms.append("Sodium") }
    if currentLevelData.counters["Telluride"]>0 { requiredAtoms.append("Telluride") }
    if currentLevelData.counters["Gallium"]>0 { requiredAtoms.append("Gallium") }
    if currentLevelData.counters["Bromine"]>0 { requiredAtoms.append("Bromine") }
    if currentLevelData.counters["Mercury"]>0 { requiredAtoms.append("Mercury") }
    
    let numImages = requiredAtoms.count
    
    if numImages == 1 {
        xpos[0] = screenWidth/2
    }
    if numImages == 2 {
        
        xpos[0] = screenWidth/4
        xpos[1] = screenWidth/4 * 3
        
    }
    if numImages == 3 {
        //positioning is incorrect for this one
        xpos[0] = screenWidth/5.333
        xpos[1] = screenWidth/2
        xpos[2] = screenWidth/1.2307
    }
    
    if numImages == 4 {
        xpos[0] = screenWidth/6.4
        xpos[1] = screenWidth/2.607986
        xpos[2] = screenWidth/1.6186
        xpos[3] = screenWidth/1.1851
    }
    
    // Setup Images for Atoms
    for (index,atomType) in enumerate(requiredAtoms) {
        
        // Add Images
        var sprite = CCSprite(imageNamed:"Art Assets/\(atomType).png")
        sprite.position = ccp(xpos[index],73.0)
        self.addChild(sprite)
        
        // Add Labels
        var label = CCLabelTTF(string: "\(currentLevelData.counters[atomType]!)", fontName: "Arial", fontSize: 20)
        label.name = "\(atomType)Label"
        label.position = ccp(xpos[index],25)
        self.addChild(label)
        
    }
    
}


}