//
//  GameOverCoordinatorTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameOverCoordinatorTests: XCTestCase {

    // MARK: - PROPERTIES
    var coordinator: GameOverCoordinator!
    var navigator: NavigatorRepresentable!
    var viewController: GameOverViewController!
    var navigationController: NavigationControllerMock!

    var delegateSpy: GameOverCoordinatorDelegateSpy!

    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()

        navigationController = NavigationControllerMock()
        navigator = Navigator(with: navigationController)

        let viewModel = GameOverViewModelMock()
        viewController = GameOverViewController(with: viewModel)

        coordinator = GameOverCoordinator(with: navigator, score: 2)

        delegateSpy = GameOverCoordinatorDelegateSpy()
        coordinator.delegate = delegateSpy

        coordinator.start()
    }
    
    override func tearDown() {
        super.tearDown()

        delegateSpy = nil
        viewController = nil
        navigator = nil
        coordinator = nil
    }

    // MARK: - TEST: init(with navigator: NavigatorRepresentable, score: Int)
    func testInit() {
        XCTAssertNotNil(coordinator)
    }

    // MARK: - TEST: didPressRetry(in gameoverViewController: GameOverViewController)
    func testDidPressRetry() {
        setupDelegateSpy()
        coordinator.didPressRetry(in: viewController)

        waitForExpectations(timeout: Timeout.short) {
            guard $0 == nil else { return XCTFail() }

            XCTAssertTrue(self.navigationController.wasDismiss)
        }
    }
}

// MARK: - PRIVATE
private extension GameOverCoordinatorTests {

    func setupDelegateSpy() {
        let delegateExpectation = expectation(description: "Calls the delegate")
        delegateSpy.expectation = delegateExpectation
    }
}
