//
//  GameConstants.swift
//  Splashy
//
//  Created by Pedro Carrasco on 25/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

struct SplashyConstants {
   static let physicsBodyRatio: CGFloat = 0.9
   static let dxVelocity = 0
   static let dyVelocity = 15
}

struct EnemyConstants {
   static let upperY: CGFloat = 105
   static let lowerY: CGFloat = -105
   static let topVariation: CGFloat = 150
   static let bottomVariation: CGFloat = -120
   static let widthExtra: CGFloat = 250
   static let spawnRate = 1.5
   static let movementRate: CGFloat = 0.0075
}
