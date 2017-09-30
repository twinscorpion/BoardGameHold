//
//  Constants.swift
//  ARMatch
//
//  Created by James French on 9/29/17.
//  Copyright © 2017 TwinScorpion. All rights reserved.
//


import Foundation
import SceneKit



struct GamePieceColors {
    var name: String
    var UIColor: UIColor
    
    
    
}

let green = GamePieceColors(name: "green",UIColor: UIColor.green)
let red  = GamePieceColors(name: "red", UIColor: UIColor.red)
let blue = GamePieceColors(name: "blue", UIColor: UIColor.blue)
let yellow = GamePieceColors(name: "yellow", UIColor: UIColor.yellow)
let gray = GamePieceColors(name: "gray", UIColor: UIColor.gray)
let cyan = GamePieceColors(name: "cyan", UIColor: UIColor.cyan)




let GamePiecesColorsArray = [green,red,blue,yellow,gray,cyan]

let PlaneColorConstant = UIColor.blue.withAlphaComponent(0.2)

let InsertionYOffsetConstant = Float(0.2)
let PlaneHeight = CGFloat(0.004)

let CollisionCategoryBottom  = 1 << 0
let CollisionCategoryCube    = 1 << 1

let ScoreOfMatchThree = 10
let InBonus = 5
let DropNumber = 5
let TimerMultiplier = 5
let LevelUp = 200
let LevelUpSets = 10

// for the clear color of materials
let transparentMaterial = Assets.materialsColor(color: UIColor.clear)

//UILabelFount Size
let LabelFountSize = CGFloat(20)
let LabelFountName = "DevanagariSangamMN-Bold"
let LabelColor = UIColor.white
let HitMarkerSizeCGFloat = CGFloat(20.0)








