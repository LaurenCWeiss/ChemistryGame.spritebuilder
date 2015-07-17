//
//  Beaker.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Beaker: CCNode {
    
    var top: CCNode!
    var neck: CCNode!
    var isTouchingGround = false

    func didLoadFromCCB(){
        
        userInteractionEnabled = true
//      top.physicsBody.sensor = true
    }
    
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
    }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        let curTouch = touch.locationInView(CCDirector.sharedDirector().view as! CCGLView)
        let lastTouch = touch.previousLocationInView(CCDirector.sharedDirector().view as! CCGLView)
        
        var diffPosition = ccpSub(lastTouch,curTouch)
        diffPosition.x *= -1
        
        if isTouchingGround != true || (isTouchingGround == true && diffPosition.y > 0) {
            
            position = ccpAdd(position,diffPosition)
            
        }
    
       

    }
}

    
