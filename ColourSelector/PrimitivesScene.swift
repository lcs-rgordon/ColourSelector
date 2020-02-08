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
        
        addColourDisc()
        
    }
    
    func addColourDisc() {

        // NOTE: For rough plan of how this works, see image included in project.
        
        // Iterate around the circle
//        let segments: Double = 8  // DEBUG: To see how this works (compare to image referenced above)
        let segments: Double = 360  // 360 segments gets you a full circle
        let increment = 360.0 / segments
        for angle in stride(from: 0.0, to: 360.0, by: increment) {

            // Going counter-clockwise around the vertices
            
            // Origin - vertex 0
            let origin = SCNVector3(0, 0, 0)
            
            // Along horizontal axis (if angle is 0 degrees) - vertex 1
            let alongAxis = SCNVector3(cos(angle.degreesToRadians), sin(angle.degreesToRadians), 0)
            
            // Above horizontal axis (if angle is 0 degrees) - vertex 2
            let aboveAxis = SCNVector3(cos((angle + increment).degreesToRadians), sin((angle + increment).degreesToRadians), 0)
            
            // Define vertices for this segment
            let vertices: [SCNVector3] = [origin, alongAxis, aboveAxis]

            // Create the geometry source from the specified vertices
            let source = SCNGeometrySource(vertices: vertices)
            
            // Define the surface
            let indices: [UInt16] = [
                0, 1, 2
            ]
            let element = SCNGeometryElement(indices: indices, primitiveType: .triangles)

            // Define the geometry
            let geometry = SCNGeometry(sources: [source], elements: [element])
            
            // Set the color of this object
            geometry.firstMaterial?.diffuse.contents = NSColor(hue: CGFloat(angle) / 360, saturation: 80/100, brightness: 100/100, alpha: 100/100)
                    
            // Create the node
            let node = SCNNode(geometry: geometry)
            
            // Add to scene
            self.rootNode.addChildNode(node)

        }
        
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
