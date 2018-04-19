//
//  SpriteFactory.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class SpriteFactoryTests: XCTestCase {

    let contentRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreateSplashy() {
        let sprite = SpriteFactory.sprite(of: .splashy, in: contentRect)

        assert(sprite.xScale == SpriteType.splashy.scale && sprite.yScale == SpriteType.splashy.scale)
        assert(sprite.position == SpriteType.splashy.position(in: contentRect, with: sprite))
        assert(sprite.zPosition == SpriteType.splashy.zPosition)
        assert(sprite.name == SpriteType.splashy.rawValue)

        assert(sprite.physicsBody?.affectedByGravity == SpriteType.splashy.isAffectedByGravity)
        assert(sprite.physicsBody?.categoryBitMask == SpriteType.splashy.physicsId)
        assert(sprite.physicsBody?.collisionBitMask == SpriteType.splashy.colisionBitmask)
        assert(sprite.physicsBody?.contactTestBitMask == SpriteType.splashy.colisionBitmask)
        assert(sprite.physicsBody?.isDynamic == SpriteType.splashy.isDynamic)
    }
}
