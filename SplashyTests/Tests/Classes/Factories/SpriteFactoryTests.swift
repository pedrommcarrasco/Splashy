//
//  SpriteFactory.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class SpriteFactoryTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let contentRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        static  let cgfloatAccuracy: CGFloat = 0.01 // CGFloat.uplOfOne isn't working for enemy scale 🤷‍♂️
    }

    // MARK: - TEST: sprite(of type: SpriteType, in frame: CGRect) -> SKSpriteNode
    func testCreateSplashy() {
        let type = SpriteType.splashy
        let sprite = SpriteFactory.sprite(of: type, in: Constants.contentRect)

        XCTAssertEqual(sprite.xScale, type.scale, accuracy: Constants.cgfloatAccuracy)
        XCTAssertEqual(sprite.yScale, type.scale, accuracy: Constants.cgfloatAccuracy)

        XCTAssert(sprite.position == type.position(in: Constants.contentRect, with: sprite))
        XCTAssert(sprite.zPosition == type.zPosition)
        XCTAssert(sprite.name == type.rawValue)

        XCTAssert(sprite.physicsBody?.affectedByGravity == type.isAffectedByGravity)
        XCTAssert(sprite.physicsBody?.categoryBitMask == type.physicsId)
        XCTAssert(sprite.physicsBody?.collisionBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.contactTestBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.isDynamic == type.isDynamic)
    }

    func testCreateEnemy() {
        let type = SpriteType.enemy
        let sprite = SpriteFactory.sprite(of: type, in: Constants.contentRect)

        XCTAssertEqual(sprite.xScale, type.scale, accuracy: Constants.cgfloatAccuracy)
        XCTAssertEqual(sprite.yScale, type.scale, accuracy: Constants.cgfloatAccuracy)

        XCTAssert(sprite.position == type.position(in: Constants.contentRect, with: sprite))
        XCTAssert(sprite.zPosition == type.zPosition)
        XCTAssert(sprite.name == type.rawValue)

        XCTAssert(sprite.physicsBody?.affectedByGravity == type.isAffectedByGravity)
        XCTAssert(sprite.physicsBody?.categoryBitMask == type.physicsId)
        XCTAssert(sprite.physicsBody?.collisionBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.contactTestBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.isDynamic == type.isDynamic)
    }

    func testCreateRuby() {
        let type = SpriteType.ruby
        let sprite = SpriteFactory.sprite(of: type, in: Constants.contentRect)

        XCTAssertEqual(sprite.xScale, type.scale, accuracy: Constants.cgfloatAccuracy)
        XCTAssertEqual(sprite.yScale, type.scale, accuracy: Constants.cgfloatAccuracy)

        XCTAssert(sprite.position == type.position(in: Constants.contentRect, with: sprite))
        XCTAssert(sprite.zPosition == type.zPosition)
        XCTAssert(sprite.name == type.rawValue)

        XCTAssert(sprite.physicsBody?.affectedByGravity == type.isAffectedByGravity)
        XCTAssert(sprite.physicsBody?.categoryBitMask == type.physicsId)
        XCTAssert(sprite.physicsBody?.collisionBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.contactTestBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.isDynamic == type.isDynamic)
    }

    func testCreateGround() {
        let type = SpriteType.ground
        let sprite = SpriteFactory.sprite(of: type, in: Constants.contentRect)

        XCTAssertEqual(sprite.xScale, type.scale, accuracy: Constants.cgfloatAccuracy)
        XCTAssertEqual(sprite.yScale, type.scale, accuracy: Constants.cgfloatAccuracy)

        XCTAssert(sprite.position == type.position(in: Constants.contentRect, with: sprite))
        XCTAssert(sprite.zPosition == type.zPosition)
        XCTAssert(sprite.name == type.rawValue)

        XCTAssert(sprite.physicsBody?.affectedByGravity == type.isAffectedByGravity)
        XCTAssert(sprite.physicsBody?.categoryBitMask == type.physicsId)
        XCTAssert(sprite.physicsBody?.collisionBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.contactTestBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.isDynamic == type.isDynamic)
    }

    func testCreateSky() {
        let type = SpriteType.sky
        let sprite = SpriteFactory.sprite(of: type, in: Constants.contentRect)

        XCTAssertEqual(sprite.xScale, type.scale, accuracy: Constants.cgfloatAccuracy)
        XCTAssertEqual(sprite.yScale, type.scale, accuracy: Constants.cgfloatAccuracy)

        XCTAssert(sprite.position == type.position(in: Constants.contentRect, with: sprite))
        XCTAssert(sprite.zPosition == type.zPosition)
        XCTAssert(sprite.name == type.rawValue)

        XCTAssert(sprite.physicsBody?.affectedByGravity == type.isAffectedByGravity)
        XCTAssert(sprite.physicsBody?.categoryBitMask == type.physicsId)
        XCTAssert(sprite.physicsBody?.collisionBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.contactTestBitMask == type.colisionBitmask)
        XCTAssert(sprite.physicsBody?.isDynamic == type.isDynamic)
    }

    func testCreateBackground() {
        let type = SpriteType.background
        let sprite = SpriteFactory.sprite(of: type, in: Constants.contentRect)

        XCTAssert(sprite.xScale == type.scale && sprite.yScale == type.scale)
        XCTAssert(sprite.position == type.position(in: Constants.contentRect, with: sprite))
        XCTAssert(sprite.zPosition == type.zPosition)
        XCTAssert(sprite.name == type.rawValue)

        XCTAssert(sprite.anchorPoint == CGPoint(x: 0, y: 0))
        XCTAssert(sprite.physicsBody == nil)
    }
}
