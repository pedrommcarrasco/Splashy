//
//  GameCoordinatorTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameCoordinatorTests: XCTestCase {

    // MARK: - PROPERTIES
    var coordinator: GameCoordinator!
    var navigator: NavigatorRepresentable!
    var viewController: GameViewController!
    var navigationController: NavigationControllerMock!

//    var delegateSpy: GameOverCoordinatorDelegateSpy!

    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()

        navigationController = NavigationControllerMock()
        navigator = Navigator(with: navigationController)

        let viewModel = GameViewModel()
        viewController = GameViewController(with: viewModel)

        coordinator = GameCoordinator(with: navigator)

//        delegateSpy = GameOverCoordinatorDelegateSpy()
//        coordinator.delegate = delegateSpy

        coordinator.start()
    }

    override func tearDown() {
        super.tearDown()

//        delegateSpy = nil
        viewController = nil
        navigator = nil
        coordinator = nil
    }

    // MARK: - TEST: start()
    func testStart() {
        XCTAssertTrue(navigationController.wasPush)
    }

//    func testRetry()
}
