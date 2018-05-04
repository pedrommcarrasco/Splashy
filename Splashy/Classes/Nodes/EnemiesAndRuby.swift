//
//  EnemiesAndRuby.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

struct EnemiesAndRuby {

    // MARK: - PROPERTIES
    let node: SKNode

    // MARK: - INIT
    init(in frame: CGRect) {
        let ruby = Ruby(in: frame)
        let topEnemy = Enemy(in: frame, with: EnemyConstants.upperY)
        let bottomEnemy = Enemy(in: frame, with: EnemyConstants.lowerY)

        self.node = SKNode()
        node.addChild(ruby.node)
        node.addChild(topEnemy.node)
        node.addChild(bottomEnemy.node)

        let randomVariation = CGFloat.randomBetween(min: EnemyConstants.bottomVariation, and: EnemyConstants.topVariation)
        node.position.y = node.position.y + randomVariation
    }
}
