//
//  AssetLoader.swift
//  ARMatch
//
//  Created by James French on 9/29/17.
//  Copyright © 2017 TwinScorpion. All rights reserved.
//


import Foundation
import SceneKit


//this loads up all of the sounds and images that are needed before the camera even finds a scene

struct Assets {
    static let basePath = "art.scnassets/"
    //private static let soundsPath = basePath + "sounds/"
    private static let soundsPath = basePath
    
    
    static func sound(named name: String) -> SCNAudioSource {
        guard let source = SCNAudioSource(named: soundsPath + name) else {
            fatalError("Failed to load audio source \(name).")
        }
        return source
    }
    static func materialsColor(color: UIColor) ->  SCNMaterial {
        let source = SCNMaterial()
        source.diffuse.contents = color
        return source
        
        
    }
    
    /* static func materialsImage(image: UIImage) -> SCNMaterial {
     
     } */
    
}








