//
//  PlaneClass.swift
//  ARMatch
//
//  Created by James French on 9/29/17.
//  Copyright © 2017 TwinScorpion. All rights reserved.
//


import Foundation
import ARKit
import SceneKit

var planeCounter = 0

class NewPlane: SCNNode {
    
    var anchor: ARPlaneAnchor!
    var planeGeometry: SCNBox!
    
    
    
    
    init(anchor: ARPlaneAnchor) {  //init the plane for use
        super.init()
        self.anchor = anchor
        let width = CGFloat(anchor.extent.x)
      
        
        self.planeGeometry = SCNBox(width: width, height: CGFloat(anchor.extent.z), length: PlaneHeight  , chamferRadius: 0.0)
        
        
        // Instead of just visualizing the grid as a gray plane, we will render
        // Make it blue at the moment.
        
        let material = SCNMaterial()
        //var img = UIImage(named: "tron_grid")
        // UIImage *img = [UIImage imageNamed:@"tron_grid"];
        
        material.diffuse.contents =  PlaneColorConstant
        self.planeGeometry.firstMaterial = material
        //self.planeGeometry.firstMaterial?.fillMode = .lines
        
        
        let transparentMaterial =  SCNMaterial()
        transparentMaterial.diffuse.contents =  UIColor.clear // [UIColor colorWithWhite:1.0 alpha:0.0];
        
        
        let planeNode = SCNNode(geometry: self.planeGeometry)
        
        
        planeNode.position = SCNVector3Make(0, Float(-PlaneHeight / 2), 0)
        planeNode.transform = SCNMatrix4MakeRotation(Float(-.pi / 2.0), 1.0, 0.0, 0.0) // needed because apple has planes as vertical
        
        
        planeNode.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil)
        
        self.name = "Plane\(planeCounter)"
        planeNode.name = "Plane\(planeCounter)"
        planeCounter = planeCounter + 1
        self.addChildNode(planeNode)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    func hide() {
        
        self.planeGeometry.materials = [transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial]
        sizeOfPlane()
    }
    
    func setAnimation() {
        
        //  print("setAnimation function starts")
        
        
        
        let changeColor = SCNAction.customAction(duration: 0.5) { (node, elapsedTime) -> () in
            let percentage = elapsedTime / 5
            let color = UIColor(red: 1 - percentage, green: percentage, blue: 0, alpha: 0.3)
            let myNode = node as! NewPlane
            myNode.planeGeometry.firstMaterial?.diffuse.contents = color
            
        }
        let changeColor2 = SCNAction.customAction(duration: 0.5) { (node, elapsedTime) -> () in
            // let percentage = elapsedTime / 5
            let color = PlaneColorConstant
            let myNode = node as! NewPlane
            myNode.planeGeometry.firstMaterial?.diffuse.contents = color
            
            //self.geometry?.firstMaterial?.diffuse.contents = color
        }
        
        self.runAction(changeColor, completionHandler: { () -> Void in
            self.runAction(changeColor2, completionHandler: {
                self.runAction(changeColor, completionHandler: {
                    self.hide()
                    
                })
            })
        })
        
        
        
    }
    
    func sizeOfPlane () -> Int {
        
        let area =  self.planeGeometry.height * self.planeGeometry.width
        print ("this is the area of the plane \(area)")
        return 1
        
    }
    
    class func makePlane(anchor: ARPlaneAnchor, node: SCNNode) {
        //check to see if we already have planes if so removed them.
       
        if gameBoardPlanes != nil {
            
            for plane in gameBoardPlanes {
                plane.removeFromParentNode()
            }
            
        }
        //with a plane anchor lets make a plane
        let newPlane = NewPlane(anchor: anchor)
        
        node.addChildNode(newPlane)
        gameBoardPlanes = [newPlane]
        print("origenal plane mark \(anchor.identifier)")
        
    }
    
    
    func setGameBoardPlane(tapPoint: CGPoint, gameWorld: ViewController ) {
        let hitTestResults =  gameWorld.sceneView.hitTest(tapPoint, types: .existingPlaneUsingExtent)
        let hitObject = hitTestResults.first
        print("the one I touched mark \(hitObject?.anchor?.identifier)")
        
        if gameBoardPlanes[0].anchor.identifier == hitObject?.anchor?.identifier {
            print("we have a match")
            Utility.toggleARPlanesDetection(gameWorld: gameWorld, planesDetection: false)
        }
                
        
    }
    
}

