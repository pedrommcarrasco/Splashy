//
//  Splashy.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

struct Splashy {

    // MARK: - CONSTANTS
    enum Constants {
        static let timePerFrame = 0.05
    }

    // MARK: - PROPERTIES
    let node: SKSpriteNode
    private let jumpActionTextures: [SKTexture]

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

        node.run(SKAction.animate(with: jumpActionTextures, timePerFrame: Constants.timePerFrame))
    }
}
