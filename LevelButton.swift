

import Foundation

class LevelButton: CCButton {
    
    var level: Int = 0
    var currentLevelData: Data?
//  let defaults = NSUserDefaults.standardUserDefaults()
    
    
    func didLoadFromCCB() {
       
        
        self.title = "Level: \(level + 1)"
    }
    
    override func onEnter() {
        super.onEnter()
     
        if Gamestate.sharedInstance.passed[level] == true {
   
//        defaults.setBool(true, forKey: "passed")

            
        var spriteC = CCSprite(imageNamed:"Art Assets/star.png")
        spriteC.positionInPoints = ccpAdd(self.positionInPoints,ccp(40,20))
        self.parent.addChild(spriteC)
        }
    }
}