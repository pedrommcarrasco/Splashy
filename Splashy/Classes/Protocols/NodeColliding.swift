//
//  NodeColliding.swift
//  Splashy
//
//  Created by Pedro Carrasco on 13/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

protocol NodeColliding {
      func collision(with node: SKPhysicsBody, isBetween typeA: SpriteType, and typeB: SpriteType) -> Bool
}

extension NodeColliding where Self: SKPhysicsBody {
    func collision(with node: SKPhysicsBody, isBetween typeA: SpriteType, and typeB: SpriteType) -> Bool {
        if self.categoryBitMask == typeA.physicsId && node.categoryBitMask == typeB.physicsId ||
            self.categoryBitMask == typeB.physicsId && node.categoryBitMask == typeA.physicsId {
            
            return true
        }
        
        return false
    }
}

