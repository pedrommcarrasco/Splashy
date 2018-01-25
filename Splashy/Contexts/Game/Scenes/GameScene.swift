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
    var enemiesNodes = SKNode()
    var background = SpriteType.background.node

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
        splashy.setScale(SpriteType.splashy.scale)
        splashy.position = SpriteType.splashy.position(in: frame, with: splashy)
        splashy.zPosition = SpriteType.splashy.zPosition

        let texture = SKTexture(imageNamed: SpriteType.splashy.rawValue)
        let size = CGSize(
            width: splashy.size.width * SplashyConstants.physicsBodyRatio,
            height: splashy.size.height * SplashyConstants.physicsBodyRatio
        )
        splashy.physicsBody = SKPhysicsBody(texture: texture, size: size)

        splashy.physicsBody?.categoryBitMask = SpriteType.splashy.physicsId
        splashy.physicsBody?.collisionBitMask = SpriteType.ground.physicsId | SpriteType.enemy.physicsId
        splashy.physicsBody?.contactTestBitMask =  SpriteType.ground.physicsId | SpriteType.enemy.physicsId
        splashy.physicsBody?.affectedByGravity = true
        splashy.physicsBody?.isDynamic = true

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
        let enemy = SpriteType.enemy.node
        enemy.setScale(SpriteType.enemy.scale)
        enemy.position = SpriteType.enemy.position(in: frame, with: enemy)
        enemy.position.y = enemy.position.y + variation

        let texture = SKTexture(imageNamed: SpriteType.enemy.rawValue)
        enemy.physicsBody = SKPhysicsBody(texture: texture, size: enemy.size)

        enemy.physicsBody?.categoryBitMask = SpriteType.enemy.physicsId
        enemy.physicsBody?.collisionBitMask = SpriteType.splashy.physicsId
        enemy.physicsBody?.contactTestBitMask = SpriteType.splashy.physicsId
        enemy.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.isDynamic = false

        return enemy
    }

    private func setupBackground() {
        background.setScale(SpriteType.background.scale)
        background.position = SpriteType.background.position(in: frame, with: background)
        background.zPosition = SpriteType.background.zPosition
        addChild(background)
    }

    private func setupGround() {
        ground.setScale(SpriteType.ground.scale)
        ground.position = SpriteType.ground.position(in: frame, with: ground)
        ground.zPosition = SpriteType.ground.zPosition

        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.categoryBitMask = SpriteType.ground.physicsId
        ground.physicsBody?.collisionBitMask = SpriteType.splashy.physicsId
        ground.physicsBody?.contactTestBitMask = SpriteType.splashy.physicsId
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.isDynamic = false

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
