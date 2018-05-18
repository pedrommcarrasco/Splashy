
//
//  EnemiesAndRuby.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 04/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class EnemiesAndRubyTests: XCTestCase {
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let contentRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        static let numberOfChildrenNodes = 3
    }

    // MARK: - TEST: init(in frame: CGRect)
    func testEnemiesAndRubyInit() {
        let enemiesAndRuby = EnemiesAndRuby.init(in: Constants.contentRect)

        XCTAssert(enemiesAndRuby.node.children.count == Constants.numberOfChildrenNodes)
    }
}
