//
//  GameOverViewControllerTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameOverViewControllerTests: XCTestCase {

    // MARK: - PROPERTIES
    var view: GameOverView!
    var viewController: GameOverViewController!
    var viewModel: GameOverViewModelRepresentable!
    var navigationDelegateSpy: GameoverViewControllerNavigationDelegateSpy!
    var navigator: NavigatorRepresentable!

    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()

        viewModel = GameOverViewModelMock()
        view = GameOverView(with: viewModel)
        navigationDelegateSpy = GameoverViewControllerNavigationDelegateSpy()

        viewController = GameOverViewController(with: viewModel)
        viewController.navigationDelegate = navigationDelegateSpy
        viewController.loadViewIfNeeded()

        let navigationController = NavigationControllerMock()
        navigator = Navigator(with: navigationController)

        navigator.transition(to: viewController, as: .push)
    }

    override func tearDown() {
        super.tearDown()

        view = nil
        viewController = nil
        viewModel = nil
        navigator = nil
    }

    // MARK: - TEST: init
    func testInit() {
        XCTAssertNotNil(viewController)
    }

    func testDidPressRetry() {
        runAndTest(viewController.didPressRetry)
    }

    func testDidPressRecords() {
        runAndTest(viewController.didPressRecords)
    }

    func testDidPressTutorial() {
        runAndTest(viewController.didPressTutorial)
    }
}

private extension GameOverViewControllerTests {

    func runAndTest(_ function: (GameOverView) -> ()) {
        prepareSpy()

        function(view)

        waitForExpectations(timeout: Timeout.short) {
            guard $0 == nil else { return XCTFail() }
        }
    }

    func prepareSpy() {
        let delegateExpectation = expectation(description: "Calls the delegate")
        navigationDelegateSpy.expectation = delegateExpectation
    }
}
