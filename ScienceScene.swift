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
    
    
    
    //stores the information (number of atoms for each level) for all levels
    //this is the global storage for all levels
    var levelData: LevelData = LevelData()
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        //gamePhysicsNode.debugDraw = true
        //gamePhysicsNode.space.dampining = 0.80
        currentLevelData = levelData.levels[LevelData.curLevel]

        
//        if spawn.count == 0 {
//            gameOver()
//        }

        if(currentLevelData?.hydrogen>0) {
            for i in 1...currentLevelData!.hydrogen {
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
            if currentLevelData?.oxygen > 0 {
                currentLevelData?.oxygen--
                collectAtom = true
            }
        case "Hydrogen":
            if currentLevelData?.hydrogen > 0 {
                currentLevelData?.hydrogen--
                collectAtom = true
            }
        case "Carbon":
            if currentLevelData?.carbon > 0 {
                currentLevelData?.carbon--
                collectAtom = true
            }
        default:
            collectAtom = false
            break;
        }
        
        if collectAtom == true {
            points++
            atomCollision.inBeaker = true
            startRemovingText()
            
            return false
        } else {
            gameOver()
        }
        
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, beaker: Beaker!, border: CCNode!) -> Bool {
        
        return false
    }
    
    
    //    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, atomCollision: CCNode!, ground: CCNode!) -> Bool {
    //        //"level" is referring to the ground or table; the game will end if this collision is detected(collision between the ground and a atom)
    //
    //        //    gameOver()
    //
    //        return true
    //
    //    }
    
    func gameOver() {
        
        self.unscheduleAllSelectors()
        self.gamePhysicsNode.paused = true
        
        //Stop gameplay
        //Disable goal node
        //set points really high so that person would have to get so many points in order to make the goal node register the level as being passed
        points = 100000000
        
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
        
        
        if numImages == 1{
            var sprite1 = CCSprite(imageNamed:currentLevelData.ElementImage1Name)
            sprite1.position = ccp(screenWidth/2,73.0)
            self.addChild(sprite1)
            
            var label1 = CCLabelTTF(string: currentLevelData.label1Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label1.position = ccp(screenWidth/4,25)
            self.addChild(label1)
            label1.color = CCColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            
        }
        
        if numImages == 2 {
            var sprite1 = CCSprite(imageNamed:currentLevelData.ElementImage1Name)
            sprite1.position = ccp(screenWidth/4,73.0)
            self.addChild(sprite1)
            
            var sprite2 = CCSprite(imageNamed:currentLevelData.ElementImage2Name)
            sprite2.position = ccp(screenWidth/4 * 3,73.0)
            self.addChild(sprite2)
            
            var label1 = CCLabelTTF(string: currentLevelData.label1Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label1.position = ccp(screenWidth/4,25)
            self.addChild(label1)
            label1.color = CCColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            var label2 = CCLabelTTF(string: currentLevelData.label2Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label2.position = ccp(screenWidth/4 * 3,25)
            self.addChild(label2)
            label2.color = CCColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
        }
        //this one is messed up
        if numImages == 3 {
            var sprite1 = CCSprite(imageNamed:currentLevelData.ElementImage1Name)
            sprite1.position = ccp(screenWidth/4,73.0)
            self.addChild(sprite1)
            
            var sprite2 = CCSprite(imageNamed:currentLevelData.ElementImage2Name)
            sprite2.position = ccp(screenWidth/4 * 3,73.0)
            self.addChild(sprite2)
            
            var sprite3 = CCSprite(imageNamed:currentLevelData.ElementImage3Name)
            sprite3.position = ccp(screenWidth/4,73.0)
            self.addChild(sprite3)
            
            var label1 = CCLabelTTF(string: currentLevelData.label1Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label1.position = ccp(screenWidth/4,25)
            self.addChild(label1)
            label1.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            var label2 = CCLabelTTF(string: currentLevelData.label2Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label2.position = ccp(screenWidth/4 * 3,25)
            self.addChild(label2)
            label2.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            var label3 = CCLabelTTF(string: currentLevelData.label3Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label3.position = ccp(screenWidth/4 * 3,25)
            self.addChild(label3)
            label3.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        
        if numImages == 4 {
            var sprite1 = CCSprite(imageNamed:currentLevelData.ElementImage1Name)
            sprite1.position = ccp(screenWidth/5,73.0)
            self.addChild(sprite1)
            
            var sprite2 = CCSprite(imageNamed:currentLevelData.ElementImage2Name)
            sprite2.position = ccp(screenWidth/5 * 2,73.0)
            self.addChild(sprite2)
            
            var sprite3 = CCSprite(imageNamed:currentLevelData.ElementImage3Name)
            sprite3.position = ccp(screenWidth/5 * 3,73.0)
            self.addChild(sprite3)
            
            var sprite4 = CCSprite(imageNamed:currentLevelData.ElementImage4Name)
            sprite4.position = ccp(screenWidth/5 * 4,73.0)
            self.addChild(sprite4)
            
            //this part is messed up
            
            var label1 = CCLabelTTF(string: currentLevelData.label1Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label1.position = ccp(screenWidth/4,25)
            self.addChild(label1)
            label1.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            var label2 = CCLabelTTF(string: currentLevelData.label2Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label2.position = ccp(screenWidth/4 * 3,25)
            self.addChild(label2)
            label2.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            var label3 = CCLabelTTF(string: currentLevelData.label3Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label3.position = ccp(screenWidth/4 * 3,25)
            self.addChild(label3)
            label3.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            var label4 = CCLabelTTF(string: currentLevelData.label4Title, fontName: currentLevelData.label1FontName, fontSize: currentLevelData.label1FontSize)
            label4.position = ccp(screenWidth/4,25)
            self.addChild(label4)
            label4.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            
        }
        
        
    }
    
    
    func startRemovingText() {
        //        let currentLevelData = levelData.levels[LevelData.curLevel]
        //        if(currentLevelData.label1){
        //            currentLevelData.label1Title --
        //        }
        //        if(currentLevelData.label2){
        //            currentLevelData.label2Title --
        //        }
        //        if(currentLevelData.label3){
        //            currentLevelData.label3Title --
        //        }
        //        if(currentLevelData.label4){
        //            currentLevelData.label4Title --
        //        }
        ////        if currentLevelData.label1Title ==
        //
        //    }
    }
    
    //        var sprite = CCSprite(imageNamed:"Art Assets/Scientist5.png")
    //        sprite.position = ccp(100,100)
    //        self.addChild(sprite)
    
    //        var label = CCLabelTTF(string: "TEST", fontName: "Arial", fontSize: 20.0)
    //        label.position = ccp(100,150)
    //        self.addChild(label)
    //        label.color = CCColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    
    //    func setGroundLayout() {
    //        let currentLevelData = levelData.levels[LevelData.curLevel]
    //        var numImages = currentLevelData.MoleculeImage1 + currentLevelData.MoleculeImage2 + currentLevelData.MoleculeImage3 + currentLevelData.MoleculeImage4
    //        if numImages == 2 {
    //            screen.width / 4
    //             MoleculeImage1.position = ccp(CGFloat(80.0,73.0)) //MoleculeImage1.position = ccp(CGFloat(screen.width/4, 73.0))
    //             MoleculeImage2.position = ccp(CGFloat(240.0,73.0)) //MoleculeImage2.position = ccp(CGFloat(screen.width/4 + screen.width/2, 73.0))
    //        }
    //        if numImages == 3 {
    //            MoleculeImage1.position = ccp(CGFloat(80.0,73.0))
    //            MoleculeImage2.position = ccp(CGFloat(240.0,73.0))
    //            MoleculeImage3.position = ccp(CGFloat(160.0,73.0))
    //        }
    //        if numImages == 4 {
    //            MoleculeImage1.position = ccp(CGFloat(40.0,73.0))
    //            MoleculeImage2.position = ccp(CGFloat(124.4,73.0))
    //            MoleculeImage3.position = ccp(CGFloat(205.4,73.0))
    //            MoleculeImage4.position = ccp(CGFloat(280.5,73.0))
    //
    //        }
    //        
    //        
    //    }
}