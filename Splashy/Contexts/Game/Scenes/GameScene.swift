//
//  GameScene.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    // MARK : - SPRITES
    var ground = SpriteType.ground.node
    var splashy = SpriteType.splashy.node
    var background = SpriteType.background.node

    // MARK : - PROPERTIES
    var viewModel: GameSceneViewModel!

    // MARK : - LIFECYCLE
    override func didMove(to view: SKView) {
        setupBackground()
        setupGround()
        setupSplashy()
        setupEnemies()
    }

    override func update(_ currentTime: TimeInterval) {

    }

    // MARK : - SETUP
    private func setupSplashy() {
        splashy.setScale(SpriteType.splashy.scale)
        splashy.position = SpriteType.splashy.position(in: frame, with: splashy)
        addChild(splashy)
    }

    private func setupEnemies() {
        let enemiesNodes = SKNode()

        enemiesNodes.addChild(createEnemy(with: -100))
        enemiesNodes.addChild(createEnemy(with: 100))

        addChild(enemiesNodes)
    }

    private func setupBackground() {
        background.setScale(SpriteType.background.scale)
        background.position = SpriteType.background.position(in: frame, with: background)
        addChild(background)
    }

    private func setupGround() {
        ground.setScale(SpriteType.ground.scale)
        ground.position = SpriteType.ground.position(in: frame, with: ground)
        addChild(ground)
    }

    // MARK : - FUNCTIONS
    private func createEnemy(with variation: CGFloat) -> SKSpriteNode {
        let enemy = SpriteType.enemy.node
        enemy.setScale(SpriteType.enemy.scale)
        enemy.position = SpriteType.enemy.position(in: frame, with: enemy)
        enemy.position.y = enemy.position.y + variation

        return enemy
    }

    // MARK : - INTERACTION
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
