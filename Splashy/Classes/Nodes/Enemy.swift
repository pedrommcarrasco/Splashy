//
//  Enemy.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

class Enemy {

    // MARK: - PROPERTIES
    let node: SKSpriteNode

    // MARK: - INIT
    init(in frame: CGRect, with variation: CGFloat) {
        self.node = SpriteFactory.sprite(of: .enemy, in: frame)
        node.position.y = node.position.y + variation
    }
}
