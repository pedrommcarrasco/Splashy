//
//  GameOverCoordinatorDelegateSpy.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameOverCoordinatorDelegateSpy: SimpleDelegatableSpy {

    // MARK: - PROPERTIES
    var expectation: XCTestExpectation?
}

// MARK: - GameoverViewControllerNavigationDelegate
extension GameOverCoordinatorDelegateSpy: GameOverCoordinatorDelegate {

    func retry(from gameoverCoordinator: GameOverCoordinator) {
        evaluateCall(expectation: expectation)
    }
}
