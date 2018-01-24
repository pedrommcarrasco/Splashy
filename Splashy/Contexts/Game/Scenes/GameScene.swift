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
    var ground = SpriteType.ground.asNode()
    var splashy = SpriteType.splashy.asNode()
    var background = SpriteType.background.asNode()

    // MARK : - PROPERTIES
    var viewModel: GameSceneViewModel!

    // MARK : - LIFECYCLE
    override func didMove(to view: SKView) {
        setupBackground()
        setupGround()
        setupSplashy()
        createEnemies()
    }

    override func update(_ currentTime: TimeInterval) {

    }

    // MARK : - SETUP
    private func setupBackground() {
        background.setScale(1.3)
        background.position = CGPoint(x: frame.width/2, y: frame.height/2)
        addChild(background)
    }

    private func setupGround() {
        ground.setScale(SpriteType.ground.scale())
        ground.position = SpriteType.ground.position(in: frame, with: ground)
        addChild(ground)
    }

    private func setupSplashy() {
        splashy.setScale(SpriteType.splashy.scale())
        splashy.position = SpriteType.splashy.position(in: frame, with: splashy)
        addChild(splashy)
    }


    private func createEnemies() {
        let enemiesNodes = SKNode()

        let topEnemy = SpriteType.enemy.asNode()
        topEnemy.position = CGPoint(x: frame.width/2, y: frame.height/2 + 100)
        topEnemy.setScale(0.6)

        let bottomEnemy = SpriteType.enemy.asNode()
        bottomEnemy.position = CGPoint(x: frame.width/2, y: frame.height/2 - 150)
        bottomEnemy.setScale(0.6)

        enemiesNodes.addChild(topEnemy)
        enemiesNodes.addChild(bottomEnemy)

        addChild(enemiesNodes)
    }

    private func setupEnemy() {}

    // MARK : - INTERACTION
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
