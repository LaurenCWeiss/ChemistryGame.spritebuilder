//
////  ViewController.swift
////  ChemistryGame
////
////  Created by Lauren Weiss on 7/24/15.
////  Copyright (c) 2015 Apportable. All rights reserved.
////
//
//import Foundation
//class ViewController: UIViewController {
//
//    let manager = CMMotionManager()
//    let queue = NSOperationQueue.mainQueue()
//
//    override func viewDidLoad() {
//        setupDeviceMotion()
//    }
//        func setupDeviceMotion() {
//            //make sure device has motion capabilities
//            if manager.deviceMotionAvailable {
//                //set the number of times the device should update motion data (in seconds)
//                manager.deviceMotionUpdateInterval = 0.01
//                //setup callback for everytime the motion data is updated
//                manager.startDeviceMotionUpdatesToQueue(queue, withHandler: { (motion: CMDeviceMotion!, error: NSError!) -> Void in
//                    ///checking device attitude will allow us to check devices current orientation in 3D space
//                    var attitude = motion.attitude
//                }}