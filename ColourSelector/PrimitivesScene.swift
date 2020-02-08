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
        
        addOctahedron()
        
    }
    
    func addOctahedron() {

        // Create an octahedron
        // See: https://medium.com/@zxlee618/custom-geometry-in-scenekit-f91464297fd1
        let vertices: [SCNVector3] = [
            SCNVector3(0, 1, 0),
            SCNVector3(-0.5, 0, 0.5),
            SCNVector3(0.5, 0, 0.5),
            SCNVector3(0.5, 0, -0.5),
            SCNVector3(-0.5, 0, -0.5),
            SCNVector3(0, -1, 0),
        ]
        
        let source = SCNGeometrySource(vertices: vertices)
        
        let indices: [UInt16] = [
            0, 1, 2,
            2, 3, 0,
            3, 4, 0,
            4, 1, 0,
            1, 5, 2,
            2, 5, 3,
            3, 5, 4,
            4, 5, 1
        ]

        let element = SCNGeometryElement(indices: indices, primitiveType: .triangles)
        
        let geometry = SCNGeometry(sources: [source], elements: [element])
                
        let node = SCNNode(geometry: geometry)

        self.rootNode.addChildNode(node)
    }
    
    func addDisc() {
        
        // Create a disc
        let discGeometry = SCNPlane(width: 1, height: 1)
        discGeometry.cornerRadius = discGeometry.width / 2
        let discNode = SCNNode(geometry: discGeometry)
        self.rootNode.addChildNode(discNode)

    }
    
    func addSphere() {
        
        // Create a white sphere
        let sphereGeometry = SCNSphere(radius: 1.0)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        self.rootNode.addChildNode(sphereNode)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
