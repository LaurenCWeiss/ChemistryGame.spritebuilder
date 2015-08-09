import Foundation


class MainScene: CCNode {
    
    
    
    func didLoadFromCCB() {
        
      
            
            //what if scene is not level transition scene? For certain levels, it is the careerUpScene
            
        
        
        
    }
    
    func startScience() {
        //loads the gameplay scene
        let MainScene = CCBReader.loadAsScene("LabReport2")
        CCDirector.sharedDirector().presentScene(MainScene)
        
//        let firstLevel = CCBReader.loadAsScene("ScienceScene")
//        let transition = CCTransition(fadeWithDuration: 0.8)
//        CCDirector.sharedDirector().presentScene(firstLevel, withTransition: transition)
//        
        return
      
    }
    func careerButtonTapped() {
        //loads scene that tells the player how to the play the game
        let MainScene = CCBReader.loadAsScene("CareerScene")
        CCDirector.sharedDirector().pushScene(MainScene)
    }
    func helpButtonTapped() {
        //loads scene that tells the player how to the play the game
        let MainScene = CCBReader.loadAsScene("HelpScene")
        CCDirector.sharedDirector().pushScene(MainScene)
    }
    func settingsButtonTapped() {
        
        let MainScene = CCBReader.loadAsScene("SettingsScene")
        CCDirector.sharedDirector().pushScene(MainScene)
    
    
    }

    
    
    func shareButtonTapped() {
        //allows the user to send a screenshot of the main scene
        var scene = CCDirector.sharedDirector().runningScene
        var n: AnyObject = scene.children[0]
        var image = screenShotWithStartNode(n as! CCNode)
        
        let sharedText = "Come play this awesome game! STEM 4 KIDS!"
        let itemsToShare = [image, sharedText]
        
        var excludedActivities = [UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
            UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList, UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop]
        
        var controller = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        controller.excludedActivityTypes = excludedActivities
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    func screenShotWithStartNode(node: CCNode) -> UIImage {
        CCDirector.sharedDirector().nextDeltaTimeZero = true
        var viewSize = CCDirector.sharedDirector().viewSize()
        var rtx = CCRenderTexture(width: Int32(viewSize.width), height: Int32(viewSize.height))
        rtx.begin()
        node.visit()
        rtx.end()
        return rtx.getUIImage()
    }
  
}