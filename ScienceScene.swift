//
//  ScienceScene.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import CoreMotion

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
    weak var ground: Ground!
    var label1 : CCLabelTTF?
    var label2 : CCLabelTTF?
    var label3 : CCLabelTTF?
    var label4 : CCLabelTTF?
    var levelData: LevelData = LevelData()
    let manager = CMMotionManager()
    let queue = NSOperationQueue.mainQueue()
    var top: CCNode!
    var topPosition: CGPoint = CGPointZero
    
    func didLoadFromCCB() {
        LevelData.currentRank = 0
        userInteractionEnabled = true
        
        topPosition = ccp(137,237)
        
        gamePhysicsNode.collisionDelegate = self
        currentLevelData = levelData.levels[LevelData.curLevel]
        
        setupDeviceMotion()
        
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
        
        //for i in 1...8 means that this will spawn 8 random atoms depedning on min and max
        //min and max set in LevelData indicate which types of atoms will be spawned...1...18
        //means that any of the 18 different atoms could be spawned 8 times so far
        
        for i in 1...8 {
            spawn.append(Int.random(min: currentLevelData!.randomMin, max: currentLevelData!.randomMax))
        }
        
        spawn.randomItem()
        
        
    }
    
    func setupDeviceMotion() {
        
        if LevelData.tilt == true {
            
            if manager.deviceMotionAvailable {
                
                //set the number of times the device should update motion data (in seconds)
                
                manager.deviceMotionUpdateInterval = 0.1
                
                //setup callback for everytime the motion data is updated
                
                manager.startDeviceMotionUpdatesToQueue(queue, withHandler: { (motion: CMDeviceMotion!, error: NSError!) -> Void in
                    
                    //checking device attitude will allow us to check devices current orientation in 3D space
                    
                    var attitude = motion.attitude
                    
                    var pitch = attitude.pitch
                    
                    var roll = attitude.roll
                    
                    let pitchMultiplier: Double = -1000
                    
                    let rollMultiplier: Double = 1000
                    
                    if let beaker = self.beaker {
                        
                        let beakerPositionY = beaker.positionInPoints.y
                        
                        let groundTop = self.ground.positionInPoints.y + self.ground.contentSize.height
                        
                        let cushion:CGFloat = 200
                        
                        beaker.physicsBody.velocity = ccp(CGFloat(roll * rollMultiplier), 0)
                        
                    }
                    
                })
                
            }
        } else if LevelData.tilt == false {
            
            func didLoadFromCCB() {
                userInteractionEnabled = true
                if LevelData.curLevel == 0 {
                    let popup = CCBReader.load("TutorialPopUp", owner:self) as! TutorialPopUp
                    popup.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
                    popup.position = CGPoint(x: 0.5, y: 0.5)
                    parent.addChild(popup)
                }
            }
            
            func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
            }
            
            func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
                let curTouch = touch.locationInView(CCDirector.sharedDirector().view as! CCGLView)
                let lastTouch = touch.previousLocationInView(CCDirector.sharedDirector().view as! CCGLView)
                
                var diffPosition = ccpSub(lastTouch,curTouch)
                diffPosition.x *= -1
                
                self.physicsBody.velocity = ccpMult(diffPosition,70)
                top.physicsBody.velocity = ccpMult(diffPosition,70)
            }
            
            func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
                self.physicsBody.velocity = ccp(0,0)
                top.physicsBody.velocity = ccp(0,0)
            }
            
            func update(delta: CCTime) {
                top.position = topPosition
                self.physicsBody.velocity = ccp(0,0)
                top.physicsBody.velocity = ccp(0,0)
            }
        }
    }
    
    
    override func onEnter() {
        super.onEnter()
        self.schedule(Selector("dropAtom"), interval: 2)
        setImage()
    }
    
    func dropAtom(){
        var fileName:String = ""
        
        if spawn.count == 0 {
            gameOver()
            return
        }
        
        var spawnIndex:Int = spawn.randomItem()
        
        var spawnAtom = spawn[spawnIndex]
        spawn.removeAtIndex(spawnIndex)
        
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
            return
        }
        
        var atomNode = CCBReader.load("Atoms/\(fileName)") as! Atom
        atomNode.type = fileName
        atomNode.position = ccp(CGFloat.random(min: 50.0, max: 200.0),600)
        
        gamePhysicsNode.addChild(atomNode)
        
        let magnitude = levelData.levels[LevelData.curLevel].magnitude
        let randomImpulse = ccpAdd(ccp(CGFloat.random(min: -magnitude.x, max: magnitude.x),0),ccp(3.0,0))
        
        atomNode.physicsBody.applyImpulse(randomImpulse)
        
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
        
        for i in 1...8 {
            spawn.append(Int.random(min: currentLevelData!.randomMin, max: currentLevelData!.randomMax))
        }
        
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
        
        OALSimpleAudio.sharedInstance().playEffect("two_small_vinegar_bottles_glass_small_hit_together.wav")
        
        if atomCollision.inBeaker == true {
            return true
        }
        
        var collectAtom = false
        
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
        
        let popup = CCBReader.load("RestartPopup", owner:self) as! RestartPopup
        popup.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
        popup.position = CGPoint(x: 0.5, y: 0.5)
        parent.addChild(popup)
    }
    
    func checkIfCareerUpSceneShouldLoad() {
        
        
        let ScienceScene = CCBReader.loadAsScene("LevelTransitionScene")
        CCDirector.sharedDirector().replaceScene(ScienceScene)
        
    
        if (LevelData.curLevel) > 29 {
            LevelData.curLevel = 0
        } else {
            LevelData.curLevel++
        }
    }
    
    
    override func update(delta: CCTime) {
        
        if points == levelData.levels[LevelData.curLevel].goal {
            
            Gamestate.sharedInstance.passed[LevelData.curLevel] == true
            
            checkIfCareerUpSceneShouldLoad()
        }
    }
    
    func setImage() {
        
        var requiredAtoms:[String] = []
        let currentLevelData = levelData.levels[LevelData.curLevel]
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var xpos:[CGFloat] = [0,0,0,0]
        
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
        
        for (index,atomType) in enumerate(requiredAtoms) {
            
            var sprite = CCSprite(imageNamed:"Art Assets/\(atomType).png")
            sprite.position = ccp(xpos[index],73.0)
            self.addChild(sprite)
            
            var label = CCLabelTTF(string: "\(currentLevelData.counters[atomType]!)", fontName: "Arial", fontSize: 20)
            label.name = "\(atomType)Label"
            label.position = ccp(xpos[index],25)
            self.addChild(label)
            
        }
        
    }
    
}