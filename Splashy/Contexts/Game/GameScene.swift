//
//  GameScene.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

protocol GameSceneDelegate: class {
	func gameSceneDidEnd(_ gameScene: GameScene)
}

class GameScene: SKScene {
	
	// MARK: - CONSTANTS
	private enum Constants {
		static let backgroundWidthExtension: CGFloat = 2
	}

	// MARK: - SPRITES
	private var splashy: Splashy!
	private var enemiesAndRuby: EnemiesAndRuby!
	
	private var sky = SKSpriteNode()
	private var ground = SKSpriteNode()
	private var background = SKSpriteNode()

	// MARK: - PROPERTIES
	private var moveRemoveAction = SKAction()
	private var viewModel: GameViewModel

	weak var sceneDelegate: GameSceneDelegate?
	
	// MARK: - PROPERTIES
	init(with size: CGSize, and viewModel: GameViewModel) {
		self.viewModel = viewModel
		super.init(size: size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - LIFECYCLE
	override func didMove(to view: SKView) {
		setup()
	}

	override func update(_ currentTime: TimeInterval) {
		animateBackground()
	}

	// MARK: - SETUP
	func restart() {
		removeAllChildren()
		removeAllActions()
		scene?.speed = 1
		viewModel.restart()

		setup()
	}

	private func setup() {
		physicsWorld.contactDelegate = self
		setupBackground()
		setupLimits()
		setupSplashy()
	}

	private func setupSplashy() {
		splashy = Splashy(in: frame)
		addChild(splashy.node)
	}

	private func setupEnemiesAndRuby() {
		enemiesAndRuby = EnemiesAndRuby(in: frame)
		enemiesAndRuby.node.run(moveRemoveAction)
		addChild(enemiesAndRuby.node)
	}

	private func setupBackground() {
		for i in 0...1 {
			let background = SpriteFactory.sprite(of: .background, in: frame)
			background.position = CGPoint(x: CGFloat(i) *  background.size.width, y: 0)
			addChild(background)
		}
	}

	private func setupLimits() {
		ground = SpriteFactory.sprite(of: .ground, in: frame)
		addChild(ground)
		
		sky = SpriteFactory.sprite(of: .sky, in: frame)
		addChild(sky)
	}

	// MARK: - FUNCTIONS
	private func createEnemiesAndRuby() {
		let spawnAction = SKAction.run { [weak self] in
			self?.setupEnemiesAndRuby()
		}

		let spawnRateAction = SKAction.wait(forDuration: EnemyConstants.spawnRate)
		let spawnWithRateAction = SKAction.sequence([spawnAction, spawnRateAction])
		run(SKAction.repeatForever(spawnWithRateAction))

		let distance = CGFloat(frame.width + EnemyConstants.widthExtra)
		let moveEnemies = SKAction.moveBy(
			x: -distance,
			y: 0,
			duration: TimeInterval(EnemyConstants.movementRate * distance)
		)
		let removeEnemies = SKAction.removeFromParent()

		moveRemoveAction = SKAction.sequence([moveEnemies, removeEnemies])
	}

	private func animateBackground() {
		if viewModel.shouldAnimate() {
			enumerateChildNodes(
				withName: SpriteType.background.rawValue,
				using: { [weak self ] node, _ in
					guard let background = node as? SKSpriteNode else { return }
					background.position = CGPoint(
						x: background.position.x - BackgroundConstants.velocity,
						y: background.position.y
					)

					self?.attemptToReset(background)
				}
			)
		}
	}

	private func attemptToReset(_ background: SKSpriteNode) {
		if background.position.x <= -background.size.width {
			background.position = CGPoint(
				x: background.position.x + (background.size.width * Constants.backgroundWidthExtension),
				y: background.position.y
			)
		}
	}
	
	private func body(_ a: SKPhysicsBody, didCollideWith b : SKPhysicsBody) {
		if a.collision(with: b, isBetween: .splashy, and: .ruby), !viewModel.isDead {
			viewModel.didPickRuby()
			
			if a.isKind(of: .ruby) { a.node?.removeFromParent()
			} else { b.node?.removeFromParent() }
		}
		
		if a.collision(with: b, isBetween: .splashy, and: .enemy) ||
			a.collision(with: b, isBetween: .splashy, and: .ground) ||
			a.collision(with: b, isBetween: .splashy, and: .sky) {
			
			if !viewModel.isDead { sceneDelegate?.gameSceneDidEnd(self) }
			
			viewModel.splashyCollided()
			scene?.speed = 0
			removeAllActions()
		}
	}

	// MARK: - INTERACTION
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !viewModel.hasStarted {
			splashy.node.physicsBody?.affectedByGravity = true
			viewModel.hasStarted = true
			createEnemiesAndRuby()
			splashy.jumpAction()
		} else if !viewModel.isDead {
			splashy.jumpAction()
		}
	}
}

extension GameScene: SKPhysicsContactDelegate {
	func didBegin(_ contact: SKPhysicsContact) {
		body(contact.bodyA, didCollideWith: contact.bodyB)
	}
}
