//
//  SpyGameoverViewControllerNavigationDelegate.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameoverViewControllerNavigationDelegateSpy  {

    // MARK: - PROPERTIES
    var expectation: XCTestExpectation?
}

// MARK: - PRIVATE
private extension GameoverViewControllerNavigationDelegateSpy {

    func evaluateCall() {
        guard let expectation = expectation else { return XCTFail() }
        expectation.fulfill()
    }
}

// MARK: - GameoverViewControllerNavigationDelegate
extension GameoverViewControllerNavigationDelegateSpy: GameoverViewControllerNavigationDelegate {

    func didPressRetry(in gameoverViewController: GameOverViewController) {
        evaluateCall()
    }

    func didPressRecords(in gameoverViewController: GameOverViewController) {
        evaluateCall()
    }

    func didPressTutorial(in gameoverViewController: GameOverViewController) {
        evaluateCall()
    }
}
