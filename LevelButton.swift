

import Foundation

class LevelButton: CCButton {
    
    var level: Int = 0
    var currentLevelData: Data?
    
    
    func didLoadFromCCB() {
        self.title = "Level: \(level + 1)"
        
        var spriteC = CCSprite(imageNamed:"Art Assets/star.png")
        spriteC.position = ccpAdd(self.position,ccp(20,0))
        self.addChild(spriteC)
    }
    
}