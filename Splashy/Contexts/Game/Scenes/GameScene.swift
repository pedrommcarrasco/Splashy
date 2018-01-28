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
	var viewModel: GameViewModel!

	// MARK : - LIFECYCLE
	override func didMove(to view: SKView) {
		setup()
	}

	override func update(_ currentTime: TimeInterval) {}

	// MARK : - SETUP
	private func setup() {
		physicsWorld.contactDelegate = self
		setupBackground()
		setupGround()
		setupSplashy()
	}

	private func setupSplashy() {
		splashy = SpriteFactory.sprite(of: SpriteType.splashy, in: frame)
		addChild(splashy)
	}

	private func setupEnemies() {
		enemiesNodes = SKNode()

		enemiesNodes.addChild(SpriteFactory.sprite(of: .ruby, in: frame))
		enemiesNodes.addChild(setupEnemy(with: EnemyConstants.lowerY))
		enemiesNodes.addChild(setupEnemy(with: EnemyConstants.upperY))
		
		enemiesNodes.zPosition = SpriteType.enemy.zPosition

		let randomVariation = CGFloat.randomBetween(
			min: EnemyConstants.bottomVariation,
			and: EnemyConstants.topVariation
		)
		enemiesNodes.position.y = enemiesNodes.position.y + randomVariation

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

		let distance = CGFloat(frame.width + enemiesNodes.frame.width + EnemyConstants.widthExtra)
		let moveEnemies = SKAction.moveBy(
			x: -distance,
			y: 0,
			duration: TimeInterval(EnemyConstants.movementRate * distance)
		)
		let removeEnemies = SKAction.removeFromParent()

		moveRemoveAction = SKAction.sequence([moveEnemies, removeEnemies])
	}

	private func collisionNodeSize() -> CGFloat {
		return (EnemyConstants.upperY*2) - 107.1
	}


	private func jump() {
		splashy.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
		splashy.physicsBody?.applyImpulse(
			CGVector(dx: SplashyConstants.dxVelocity, dy: SplashyConstants.dyVelocity)
		)
	}

	// MARK : - INTERACTION
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !viewModel.hasStarted {
			splashy.physicsBody?.affectedByGravity = true
			viewModel.hasStarted = true
			createEnemies()
			jump()
		} else {
			jump()
		}
	}
}

extension GameScene: SKPhysicsContactDelegate {
	func didBegin(_ contact: SKPhysicsContact) {
		switch ContactHelper.body(contact.bodyA, didCollideWith: contact.bodyB) {
		case .splashyAndRuby:
			viewModel.incrementScore()
		default:
			break
		}
	}

}
