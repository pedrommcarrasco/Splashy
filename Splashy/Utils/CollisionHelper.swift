//
//  ContactHelper.swift
//  Splashy
//
//  Created by Pedro Carrasco on 28/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

struct CollisionHelper {

    static func collisionOf(_ a: SKPhysicsBody, and b: SKPhysicsBody,
                             isBetween typeA: SpriteType, and typeB: SpriteType) -> Bool {
        if a.categoryBitMask == typeA.physicsId && b.categoryBitMask == typeB.physicsId ||
            a.categoryBitMask == typeB.physicsId && b.categoryBitMask == typeA.physicsId {

            return true
        }

        return false
    }
}
