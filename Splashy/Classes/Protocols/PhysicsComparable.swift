//
//  PhysicsComparable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 03/03/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

protocol PhysicsComparable {
   func isKind(of type: SpriteType) -> Bool
}

extension PhysicsComparable where Self: SKPhysicsBody {
    func isKind(of type: SpriteType) -> Bool {
        return self.categoryBitMask == type.physicsId
    }
}
