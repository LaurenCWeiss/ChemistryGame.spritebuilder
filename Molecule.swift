//
//  Molecule.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Molecule: CCNode, CCPhysicsCollisionDelegate {
    func didLoadFromCCB() {
        
        physicsBody.sensor = true;
        
    }
    
}