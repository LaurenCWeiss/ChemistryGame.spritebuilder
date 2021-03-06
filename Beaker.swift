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
    var topPosition: CGPoint = CGPointZero

    func didLoadFromCCB(){
        
        userInteractionEnabled = true
        topPosition = ccp(137,237)

    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
    }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        let curTouch = touch.locationInView(CCDirector.sharedDirector().view as! CCGLView)
        let lastTouch = touch.previousLocationInView(CCDirector.sharedDirector().view as! CCGLView)
        
        var diffPosition = ccpSub(lastTouch,curTouch)
        diffPosition.x *= -1
       
        self.physicsBody.velocity = ccpMult(diffPosition,70)
        top.physicsBody.velocity = ccpMult(diffPosition,70)
        
    }
    
    override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        self.physicsBody.velocity = ccp(0,0)
        top.physicsBody.velocity = ccp(0,0)
    }
    
    override func update(delta: CCTime) {
        if position.y<=155 {
            position.y=150
        }
        
        top.position = topPosition
        self.physicsBody.velocity = ccp(0,0)
        top.physicsBody.velocity = ccp(0,0)
        
    }

}

    
