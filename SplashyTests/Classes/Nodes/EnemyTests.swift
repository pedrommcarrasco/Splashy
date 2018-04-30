//
//  EnemyTests.swift
//  Splashy
//
//  Created by Pedro Carrasco on 30/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class EnemyTests: XCTestCase {

    // MARK: - CONSTANTS
    fileprivate enum Constants {
        static let contentRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        static let variation: CGFloat = 10.0
    }

    // MARK: - init(in frame: CGRect, with variation: CGFloat)
    func testEnemyInit() {
        let enemy = Enemy(in: Constants.contentRect, with: Constants.variation)
        let expectedPositionInY = SpriteFactory.sprite(of: .enemy, in: Constants.contentRect).position.y + Constants.variation


        XCTAssert(enemy.node.position.y == expectedPositionInY)
    }
}
