//
//  ViewController.swift
//  ARMatch
//
//  Created by James French on 9/29/17.
//  Copyright © 2017 TwinScorpion. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

var gameBoardPlanes: [NewPlane]! // global to hold the gameBoardPlane
var gameIsRunning = 0   //Int to track state of running game
                        //0 not running
                        //1 running
                        //2 paused or between levels


class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
       // let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene()
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
     
        
        Utility.toggleARPlanesDetection(gameWorld: self, planesDetection: true) // ARsession and detect planes
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
       
        guard let myPlaneAnchor = anchor as? ARPlaneAnchor else { // check for Plane anchor
            
            return   //not found just return
        }
        print("new node added")
        NewPlane.makePlane(anchor: myPlaneAnchor, node: node)
    
     
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let myPlaneAnchor = anchor as? ARPlaneAnchor else { // check for Plane anchor
            
            return   //not found just return
        }
        
        print("node updated")
        NewPlane.makePlane(anchor: myPlaneAnchor, node: node)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let _ = anchor as? ARPlaneAnchor else {return}
       // node.enumerateChildNodes { (childNode, _) in
         //   childNode.removeFromParentNode()
            
        //}
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!  //get the first one.
        let location = touch.location(in: self.sceneView) //grabe it in the view.
        let tapPoint = self.view.convert(location, to: self.sceneView) //grab the tappoint.
        
        
        if gameIsRunning == 0 {
            
            gameBoardPlanes[0].setGameBoardPlane(tapPoint: tapPoint, sceneView: self.sceneView )
            
            
       // let hitTestResults =  self.sceneView.hitTest(tapPoint, types: .existingPlaneUsingExtent)
           
        }
        
        
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        //print("and next one")
    }
    
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
