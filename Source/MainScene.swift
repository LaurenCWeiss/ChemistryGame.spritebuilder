import Foundation


class MainScene: CCNode {
    
    
    
    func didLoadFromCCB() {
        
    }
    
    func startScience() {
        
        let firstLevel = CCBReader.loadAsScene("ScienceScene")
        let transition = CCTransition(fadeWithDuration: 0.8)
        CCDirector.sharedDirector().presentScene(firstLevel, withTransition: transition)
    }
   
  

    
    
}