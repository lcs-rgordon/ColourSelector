//
//  PrimitivesScene.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2020-02-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import SceneKit
import Cocoa

class PrimitivesScene: SCNScene {

    override init() {
        super.init()
        
        // Create a white sphere
//        let sphereGeometry = SCNSphere(radius: 1.0)
//        let sphereNode = SCNNode(geometry: sphereGeometry)
//        self.rootNode.addChildNode(sphereNode)
        
        // Create a disc
        let discGeometry = SCNPlane(width: 1, height: 1)
        discGeometry.cornerRadius = discGeometry.width / 2
        let discNode = SCNNode(geometry: discGeometry)
        self.rootNode.addChildNode(discNode)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
