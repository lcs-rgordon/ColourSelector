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
        let sphereGeometry = SCNSphere(radius: 1.0)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        self.rootNode.addChildNode(sphereNode)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
