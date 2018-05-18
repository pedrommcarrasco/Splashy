//
//  NodeCollidingTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
import SpriteKit
@testable import Splashy

final class NodeCollidingTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let contenctRect = CGRect(x: 0, y: 0, width: 100, height: 100)

        static let didSplashyCollideWithEnemy = true
        static let didSplashyCollideWithBackground = false
    }

    // MARK: - PROPERTIES
    var splashy: SKSpriteNode!
    var enemy: SKSpriteNode!

    // MARK: - SETUP
    override func setUp() {
        super.setUp()

        splashy = SpriteFactory.sprite(of: .splashy, in: Constants.contenctRect)
        enemy = SpriteFactory.sprite(of: .enemy, in: Constants.contenctRect)
    }
    
    override func tearDown() {
        splashy = nil
        enemy = nil

        super.tearDown()
    }

    // MARK: - TEST: collision(with node: SKPhysicsBody, isBetween typeA: SpriteType, and typeB: SpriteType)
    func testCollisionBetweenSplashyAndEnemy() {
        guard let splashyPhysicsBody = splashy.physicsBody, let enemyPhysicsBody = enemy.physicsBody else {
            XCTFail()
            return
        }

        var result = splashyPhysicsBody.collision(with: enemyPhysicsBody, isBetween: .splashy, and: .enemy)

        XCTAssert(result == Constants.didSplashyCollideWithEnemy)

        result = splashyPhysicsBody.collision(with: enemyPhysicsBody, isBetween: .splashy, and: .background)

        XCTAssert(result == Constants.didSplashyCollideWithBackground)

    }
}
