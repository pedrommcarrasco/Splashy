//
//  SplashyTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 04/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class SplashyTests: XCTestCase {
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let contentRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    }

    // MARK: - TEST: init(in frame: CGRect)
    func testSplashyInit() {
        let splashy = Splashy(in: Constants.contentRect)

        XCTAssert(splashy.node.physicsBody?.categoryBitMask == SpriteType.splashy.physicsId)
    }
}
