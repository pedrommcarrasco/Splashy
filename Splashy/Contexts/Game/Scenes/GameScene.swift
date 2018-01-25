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
    var ground = SKSpriteNode()
    var splashy = SKSpriteNode()
    var enemiesNodes = SKNode()
    var background = SKSpriteNode()

    // MARK : - PROPERTIES
    var moveRemoveAction = SKAction()
    var viewModel: GameSceneViewModel!

    // MARK : - LIFECYCLE
    override func didMove(to view: SKView) {
        setup()
    }

    override func update(_ currentTime: TimeInterval) {}

    // MARK : - SETUP
    private func setup() {
        setupBackground()
        setupGround()
        setupSplashy()
        createEnemies()
    }

    private func setupSplashy() {
        splashy = SpriteFactory.sprite(of: SpriteType.splashy, in: frame)
        addChild(splashy)
    }

    private func setupEnemies() {
        enemiesNodes = SKNode()
        enemiesNodes.addChild(setupEnemy(with: EnemyConstants.lowerY))
        enemiesNodes.addChild(setupEnemy(with: EnemyConstants.upperY))
        enemiesNodes.zPosition = SpriteType.enemy.zPosition
        enemiesNodes.run(moveRemoveAction)
        addChild(enemiesNodes)
    }

    private func setupEnemy(with variation: CGFloat) -> SKSpriteNode {
        let enemy = SpriteFactory.sprite(of: SpriteType.enemy, in: frame)
        enemy.position.y = enemy.position.y + variation

        return enemy
    }

    private func setupBackground() {
        background = SpriteFactory.sprite(of: SpriteType.background, in: frame)
        addChild(background)
    }

    private func setupGround() {
        ground = SpriteFactory.sprite(of: SpriteType.ground, in: frame)
        addChild(ground)
    }

    // MARK : - FUNCTIONS
    private func createEnemies() {
        let spawnAction = SKAction.run { [weak self] in
            self?.setupEnemies()
        }

        let spawnRateAction = SKAction.wait(forDuration: EnemyConstants.spawnRate)
        let spawnWithRateAction = SKAction.sequence([spawnAction, spawnRateAction])
        run(SKAction.repeatForever(spawnWithRateAction))

        let distance = CGFloat(frame.width + enemiesNodes.frame.width)
        let moveEnemies = SKAction.moveBy(
            x: -distance,
            y: 0,
            duration: TimeInterval(EnemyConstants.movementRate * distance)
        )
        let removeEnemies = SKAction.removeFromParent()

        moveRemoveAction = SKAction.sequence([moveEnemies, removeEnemies])
    }



    private func jump() {
        splashy.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        splashy.physicsBody?.applyImpulse(
            CGVector(dx: SplashyConstants.dxVelocity, dy: SplashyConstants.dyVelocity)
        )
    }

    // MARK : - INTERACTION
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        jump()
    }
}
