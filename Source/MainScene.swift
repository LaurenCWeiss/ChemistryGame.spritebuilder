import Foundation


class MainScene: CCNode {
    
    
    
    func didLoadFromCCB() {
        
    }
    
    func startScience() {
        
        let firstLevel = CCBReader.loadAsScene("ScienceScene")
        let transition = CCTransition(fadeWithDuration: 0.8)
        CCDirector.sharedDirector().presentScene(firstLevel, withTransition: transition)
    }
    func shareButtonTapped() {
        var scene = CCDirector.sharedDirector().runningScene
        var n: AnyObject = scene.children[0]
        var image = screenShotWithStartNode(n as! CCNode)
        
        let sharedText = "Share text"
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