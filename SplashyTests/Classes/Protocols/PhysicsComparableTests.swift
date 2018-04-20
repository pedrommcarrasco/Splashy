//
//  PhysicsComparableTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
import SpriteKit
@testable import Splashy

class PhysicsComparableTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let contentRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    }

    // MARK: - TEST: isKind(of type: SpriteType) -> Bool
    func testIsKindSplashy() {
        let splashy = SpriteFactory.sprite(of: .splashy, in: Constants.contentRect)
        XCTAssert(splashy.physicsBody?.isKind(of: .splashy) == true)
        XCTAssert(splashy.physicsBody?.isKind(of: .ruby) == false)
        XCTAssert(splashy.physicsBody?.isKind(of: .enemy) == false)
        XCTAssert(splashy.physicsBody?.isKind(of: .ground) == false)
    }

    func testIsKindEnemy() {
        let enemy = SpriteFactory.sprite(of: .enemy, in: Constants.contentRect)
        XCTAssert(enemy.physicsBody?.isKind(of: .splashy) == false)
        XCTAssert(enemy.physicsBody?.isKind(of: .ruby) == false)
        XCTAssert(enemy.physicsBody?.isKind(of: .enemy) == true)
        XCTAssert(enemy.physicsBody?.isKind(of: .ground) == false)
    }

    func testIsKindRuby() {
        let ruby = SpriteFactory.sprite(of: .ruby, in: Constants.contentRect)
        XCTAssert(ruby.physicsBody?.isKind(of: .splashy) == false)
        XCTAssert(ruby.physicsBody?.isKind(of: .ruby) == true)
        XCTAssert(ruby.physicsBody?.isKind(of: .enemy) == false)
        XCTAssert(ruby.physicsBody?.isKind(of: .ground) == false)
    }

    func testIsKindGround() {
        let ground = SpriteFactory.sprite(of: .ground, in: Constants.contentRect)
        XCTAssert(ground.physicsBody?.isKind(of: .splashy) == false)
        XCTAssert(ground.physicsBody?.isKind(of: .ruby) == false)
        XCTAssert(ground.physicsBody?.isKind(of: .enemy) == false)
        XCTAssert(ground.physicsBody?.isKind(of: .ground) == true)
    }
}
