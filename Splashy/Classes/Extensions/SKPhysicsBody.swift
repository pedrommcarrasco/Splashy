//
//  SKPhysicsBody.swift
//  Splashy
//
//  Created by Pedro Carrasco on 28/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

extension SKPhysicsBody {

    func isKind(of type: SpriteType) -> Bool {
        return self.categoryBitMask == type.physicsId
    }

}