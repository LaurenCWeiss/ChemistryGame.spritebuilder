//
//  Molecule.swift
//  ChemistryGame
//
//  Created by Lauren Weiss on 7/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Atom: CCNode {
    //class Atom: CCNode, CCPhysicsCollisionDelegate {
    //atom defaults its boolean inBeaker to false so that it won't pass through goal node unless otherwise specified to do so
    var inBeaker: Bool = false
    var type: String = ""
    
    func didLoadFromCCB() {
    
    }
    
}