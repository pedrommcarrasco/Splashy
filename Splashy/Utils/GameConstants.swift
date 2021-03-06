//
//  GameConstants.swift
//  Splashy
//
//  Created by Pedro Carrasco on 25/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

enum SplashyConstants {
   static let physicsBodyRatio: CGFloat = 0.9
   static let dxVelocity: CGFloat = 0
   static let dyVelocity: CGFloat = 14.5
}

enum EnemyConstants {
   static let upperY: CGFloat = 105
   static let lowerY: CGFloat = -105
   static let topVariation: CGFloat = 150
   static let bottomVariation: CGFloat = -120
   static let widthExtra: CGFloat = 250
   static let spawnRate = 1.5
   static let movementRate: CGFloat = 0.0075
}

enum BackgroundConstants {
   static let velocity: CGFloat = 0.25
}
