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

    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()

        navigationController = NavigationControllerMock()
        navigator = Navigator(with: navigationController)

        let viewModel = GameViewModel()
        viewController = GameViewController(with: viewModel)

        coordinator = GameCoordinator(with: navigator)
    }

    // MARK: - TEST: start()
    func testStart() {
        coordinator.start()
        XCTAssertTrue(navigationController.wasPush)
        XCTAssert(navigationController.topViewController is GameViewController)
    }

}
