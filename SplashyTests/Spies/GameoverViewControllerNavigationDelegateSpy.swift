//
//  SpyGameoverViewControllerNavigationDelegate.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameoverViewControllerNavigationDelegateSpy: SimpleDelegatableSpy  {

    // MARK: - PROPERTIES
    var expectation: XCTestExpectation?
}

// MARK: - GameoverViewControllerNavigationDelegate
extension GameoverViewControllerNavigationDelegateSpy: GameoverViewControllerNavigationDelegate {
    func didPressClose(in gameoverViewController: GameOverViewController) {
        evaluateCall(expectation: expectation)
    }
    
    func didPressRetry(in gameoverViewController: GameOverViewController) {
        evaluateCall(expectation: expectation)
    }
}
