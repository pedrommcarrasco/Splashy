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
        navigationDelegateSpy = nil
    }

    // MARK: - TEST: init
    func testInit() {
        XCTAssertNotNil(viewController)
    }

    // MARK: - TEST: didPressRetry(in gameoverView: GameOverView)
    func testDidPressRetry() {
        runAndTest(viewController.didPressRetry)
    }

    // MARK: - TEST: didPressRecords(in gameoverView: GameOverView)
    func testDidPressRecords() {
        runAndTest(viewController.didPressRecords)
    }

    // MARK: - TEST: didPressTutorial(in gameoverView: GameOverView)
    func testDidPressTutorial() {
        runAndTest(viewController.didPressTutorial)
    }
}

// MARK: - PRIVATE
private extension GameOverViewControllerTests {
    typealias GameoverVCNavigationDelegateFunction = (GameOverView) -> ()

    func runAndTest(_ function: GameoverVCNavigationDelegateFunction) {
        setupDelegateSpy()

        function(view)

        waitForExpectations(timeout: Timeout.short) {
            guard $0 == nil else { return XCTFail() }
        }
    }

    func setupDelegateSpy() {
        let delegateExpectation = expectation(description: "Calls the delegate")
        navigationDelegateSpy.expectation = delegateExpectation
    }
}
