//
//  SpriteFactory.swift
//  Splashy
//
//  Created by Pedro Carrasco on 25/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

enum SpriteFactory {

    // MARK: - FUNCTIONS
    static func sprite(of type: SpriteType, in frame: CGRect) -> SKSpriteNode {
        let sprite = type.node

        sprite.setScale(type.scale)
        sprite.position = type.position(in: frame, with: sprite)
        sprite.zPosition = type.zPosition
        sprite.name = type.rawValue

        if case .background = type {
            sprite.anchorPoint = CGPoint(x: 0, y: 0)
        } else {
            sprite.physicsBody = type.physicsBody(with: sprite.size)
            sprite.physicsBody?.categoryBitMask = type.physicsId
            sprite.physicsBody?.collisionBitMask = type.colisionBitmask
            sprite.physicsBody?.contactTestBitMask = type.colisionBitmask
            sprite.physicsBody?.affectedByGravity = type.isAffectedByGravity
            sprite.physicsBody?.isDynamic = type.isDynamic
        }

        return sprite
    }
}
