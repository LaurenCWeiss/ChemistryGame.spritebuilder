import Foundation


class MainScene: CCNode {
    
    
    func startScience() {
        let MainScene = CCBReader.loadAsScene("LabReport2")
        CCDirector.sharedDirector().presentScene(MainScene)
        return
    }
    
    func careerButtonTapped() {
        let MainScene = CCBReader.loadAsScene("CareerScene")
        CCDirector.sharedDirector().pushScene(MainScene)
    }
    
    func helpButtonTapped() {
        let MainScene = CCBReader.loadAsScene("HelpScene")
        CCDirector.sharedDirector().pushScene(MainScene)
    }
    
    func settingsButtonTapped() {
        let MainScene = CCBReader.loadAsScene("SettingsScene")
        CCDirector.sharedDirector().pushScene(MainScene)
    }
    
    func shareButtonTapped() {
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