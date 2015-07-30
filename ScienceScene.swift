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
    weak var ground1: Ground!
    var atomNode: CCNode!
    var currentLevelData: Data?
     var spawn:[Int] = []
    
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

        if(currentLevelData?.hydrogenCounter>0) {
            for i in 1...currentLevelData!.hydrogenCounter {
                spawn.append(1)
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
        //should this be in the update function?
        //for spawning random atoms
        //how to know the difference of spawning atoms to avoid and atoms that must be spawned?
        
        
        //use spawnThisNumber to run through how many times I want something to randomly spawn
        //problem is that what if atoms that need to be spawned aren't spawned
        //need mechanism that will ensure that the atoms from level data are spawned, that enough of them are actually spawned
        var fileName:String = ""
        
       println(spawn.count)
       
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
    
    
    //MARK:- Physics
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, goal: Goal!, atomCollision: Atom!) -> Bool {
        //this collision is the circle collision at the top of the beaker/flask...this collision adds one to the score in the system so that the program knows to move up a level
        
        // If in beaker, bounce
        if atomCollision.inBeaker == true {
            return true
            
        }
        
        var collectAtom = false
        
        switch atomCollision.type {
        case "Oxygen":
           
        let indexOfButton = currentLevelData?.labelLinks["Oxygen"]
            if currentLevelData?.oxygenCounter > 0 {
                currentLevelData?.oxygenCounter--
                 
                collectAtom = true
                
                if indexOfButton == 1 {
                    label1?.string = "\(currentLevelData?.oxygenCounter)"
                }
                if indexOfButton == 2 {
                    label2?.string = "\(currentLevelData?.oxygenCounter)"
                }
     
            }
        case "Hydrogen":
            if currentLevelData?.hydrogenCounter > 0 {
                
                let indexOfButton = currentLevelData?.labelLinks["Hydrogen"]
                if currentLevelData?.hydrogenCounter > 0 {
                    currentLevelData?.hydrogenCounter--
                    
                    collectAtom = true
                    
                    if indexOfButton == 1 {
                        label1?.string = "\(currentLevelData?.hydrogenCounter)"
                    }
                    if indexOfButton == 2 {
                        label2?.string = "\(currentLevelData?.hydrogenCounter)"
                    }
                    
                currentLevelData?.hydrogenCounter--
                collectAtom = true
                }}
        case "Carbon":
            let indexOfButton = currentLevelData?.labelLinks["Carbon"]
           
            if currentLevelData?.carbonCounter > 0 {
                currentLevelData?.carbonCounter--
                collectAtom = true
                
            if indexOfButton == 1 {
                label1?.string = "\(currentLevelData?.carbonCounter)"
            }
            if indexOfButton == 2 {
                label2?.string = "\(currentLevelData?.carbonCounter)"
            }
                    }
        default:
            collectAtom = false
            break;
        }
        
        if collectAtom == true {
            
//            println("labelA: \(currentLevelData!.labelA)")

         
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
        
        self.unscheduleAllSelectors()
        self.gamePhysicsNode.paused = true
        
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
//        
//        setImage()
        
        //if the number of points equals the number of atoms released, then move on to the next level
        
        if points == levelData.levels[LevelData.curLevel].goal {
            
            cleanup()
            //call scene transition here
            startLevelTransitionScene()
        }
    }
    
    func setImage() {
      
        let currentLevelData = levelData.levels[LevelData.curLevel]
        var numImages = currentLevelData.ElementImage1 + currentLevelData.ElementImage2 + currentLevelData.ElementImage3 + currentLevelData.ElementImage4
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        var xpos1: CGFloat = 0.0
        var xpos2: CGFloat = 0.0
        var xpos3: CGFloat = 0.0
        var xpos4: CGFloat = 0.0
        
        if numImages == 1 {
            xpos1 = screenWidth/2
        }
        if numImages == 2 {
            
            xpos1 = screenWidth/4
            xpos2 = screenWidth/4 * 3
            
        }
        if numImages == 3 {
            //positioning is incorrect for this one
            xpos1 = screenWidth/4
            xpos2 = screenWidth/2
            xpos3 = screenWidth/3
            
            
        }
        if numImages == 4 {
            xpos1 = screenWidth/5
            xpos2 = screenWidth/5 * 2
            xpos3 = screenWidth/5 * 3
            xpos4 = screenWidth/5 * 4
        }
       
        
        //image 1
        var sprite1 = CCSprite(imageNamed:currentLevelData.ElementImage1Name)
        sprite1.position = ccp(xpos1,73.0)
        self.addChild(sprite1)
        
       
        //image 2
        var sprite2 = CCSprite(imageNamed:currentLevelData.ElementImage2Name)
        sprite2.position = ccp(xpos2,73.0)
        self.addChild(sprite2)
    
       
        
        //image 3
//        var sprite3 = CCSprite(imageNamed:currentLevelData.ElementImage3Name)
//        sprite3.position = ccp(xpos3,73.0)
//        self.addChild(sprite3)
//        
//        
//        //image 4
//        var sprite4 = CCSprite(imageNamed:currentLevelData.ElementImage4Name)
//        sprite4.position = ccp(xpos4,73.0)
//        self.addChild(sprite4)
        

        label1 = CCLabelTTF(string: "\(currentLevelData.counter1)", fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
        label1?.position = ccp(xpos1,25)
        self.addChild(label1!)
        label1?.color = CCColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        label2 = CCLabelTTF(string:  "\(currentLevelData.counter2)", fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
        label2?.position = ccp(xpos2,25)
        self.addChild(label2!)
        
        label3 = CCLabelTTF(string: "\(currentLevelData.counter3)", fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
        label3?.position = ccp(xpos3,25)
        self.addChild(label3!)
        
        label4 = CCLabelTTF(string:  "\(currentLevelData.counter4)", fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
        label4?.position = ccp(xpos4,25)
        self.addChild(label4!)
        
           }


}