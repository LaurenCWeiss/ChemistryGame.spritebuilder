

import Foundation

class LevelButton: CCButton {
    
    var level: Int = 0
    var currentLevelData: Data?
    
    
    func didLoadFromCCB() {
        self.title = "Level: \(level + 1)"
    }
    
    override func onEnter() {
        super.onEnter()
     
        if Gamestate.sharedInstance.passed[level] == true {
        NSUserDefaults()
        var spriteC = CCSprite(imageNamed:"Art Assets/star.png")
        spriteC.positionInPoints = ccpAdd(self.positionInPoints,ccp(0,0))
        self.parent.addChild(spriteC)
        }
    }
}