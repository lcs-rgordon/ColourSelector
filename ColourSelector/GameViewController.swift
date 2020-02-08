//
//  GameViewController.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2020-02-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a new primitives scene
        let sceneView = self.view as! SCNView
        sceneView.scene = PrimitivesScene()
        sceneView.backgroundColor = NSColor.black
        
        // Turn on the lights
        //sceneView.autoenablesDefaultLighting = true
        
        // Allow camera control
        sceneView.allowsCameraControl = true
        
    }
    
//    @objc
//    func handleClick(_ gestureRecognizer: NSGestureRecognizer) {
//        // retrieve the SCNView
//        let scnView = self.view as! SCNView
//
//        // check what nodes are clicked
//        let p = gestureRecognizer.location(in: scnView)
//        let hitResults = scnView.hitTest(p, options: [:])
//        // check that we clicked on at least one object
//        if hitResults.count > 0 {
//
//        }
//    }
}
