//
//  EnemiesAndRuby.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

class EnemiesAndRuby {

    // MARK: - PROPERTIES
    let node: SKNode
    let ruby: Ruby
    let topEnemy: Enemy
    let bottomEnemy: Enemy

    // MARK: - INIT
    init(in frame: CGRect) {
        self.ruby = Ruby(in: frame)
        self.topEnemy = Enemy(in: frame, with: EnemyConstants.upperY)
        self.bottomEnemy = Enemy(in: frame, with: EnemyConstants.lowerY)

        self.node = SKNode()
        node.addChild(ruby.node)
        node.addChild(topEnemy.node)
        node.addChild(bottomEnemy.node)

        let randomVariation = CGFloat.randomBetween(min: EnemyConstants.bottomVariation, and: EnemyConstants.bottomVariation)
        node.position.y = node.position.y + randomVariation
    }
}



//enemiesNodes = SKNode()
//
//enemiesNodes.addChild(Ruby(in: frame).node)
//enemiesNodes.addChild(setupEnemy(with: EnemyConstants.lowerY).node)
//enemiesNodes.addChild(setupEnemy(with: EnemyConstants.upperY).node)
//
//enemiesNodes.zPosition = SpriteType.enemy.zPosition
//
//let randomVariation = CGFloat.randomBetween(
//    min: EnemyConstants.bottomVariation,
//    and: EnemyConstants.topVariation
//)
//enemiesNodes.position.y = enemiesNodes.position.y + randomVariation
//
//enemiesNodes.run(moveRemoveAction)
//addChild(enemiesNodes)

