//
//  Splashy.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

class Splashy {

    // MARK: - PROPERTIES
    let node: SKSpriteNode
    let jumpActionTextures: [SKTexture]

    // MARK: - INIT
    init(in frame: CGRect) {
        self.node = SpriteFactory.sprite(of: .splashy, in: frame)
        self.jumpActionTextures = Loader.load(texture: .splashyJump)
    }

    // MARK: - FUNCTIONS
    func jumpAction() {
        node.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        node.physicsBody?.applyImpulse(
            CGVector(dx: SplashyConstants.dxVelocity, dy: SplashyConstants.dyVelocity)
        )

        node.run(SKAction.animate(with: jumpActionTextures, timePerFrame: 0.05))
    }
}
