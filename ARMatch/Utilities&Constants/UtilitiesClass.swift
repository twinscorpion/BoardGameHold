//
//  UtilitiesClass.swift
//  ARMatch
//
//  Created by James French on 9/29/17.
//  Copyright © 2017 TwinScorpion. All rights reserved.
//

import Foundation
import ARKit


class Utility {
    
    
    class func toggleARPlanesDetection(gameWorld: ViewController, planesDetection: Bool) {
        //function to turn off the Plane detection and to switch it back on when needed.
        
        
        //      print ("This got called with Bool = \(planesDetection)")
        let configuration = ARWorldTrackingConfiguration()
        if planesDetection {
            gameWorld.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
            configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
            gameWorld.sceneView.session.run(configuration)
            
        } else {
            
            
            gameWorld.sceneView.session.run(configuration)
            
        }
        
    }
    
    
    class func touchPlane() {
        
        
    }
    
    
}
