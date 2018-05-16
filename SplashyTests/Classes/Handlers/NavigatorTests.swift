//
//  NavigatorTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 16/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class NavigatorTests: XCTestCase {

    // MARK: - PROPERTIES
    var navigationControllerMock: NavigationControllerMock!
    var navigator: Navigator!

    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()

        navigationControllerMock = NavigationControllerMock()
        navigator = Navigator(with: navigationControllerMock)
    }

    override func tearDown() {
        super.tearDown()

        navigationControllerMock = nil
        navigator = nil
    }

    // MARK: - TEST: transition(to viewController: UIViewController, as type: NavigatorTransitionType)
    func testNavigateAsRoot() {
        navigator.transition(to: UIViewController(), as: .root)

        XCTAssertTrue(navigationControllerMock.wasRoot)
        XCTAssertFalse(navigationControllerMock.wasPresent)
        XCTAssertFalse(navigationControllerMock.wasPush)
    }

    func testNavigateAsPush() {
        navigator.transition(to: UIViewController(), as: .push)

        XCTAssertTrue(navigationControllerMock.wasPush)
        XCTAssertFalse(navigationControllerMock.wasPresent)
        XCTAssertFalse(navigationControllerMock.wasRoot)
    }

    func testNavigateAsPresent() {
        navigator.transition(to: UIViewController(), as: .modal)

        XCTAssertTrue(navigationControllerMock.wasPresent)
        XCTAssertFalse(navigationControllerMock.wasRoot)
        XCTAssertFalse(navigationControllerMock.wasPush)
    }

    func testNavigateAsDismiss() {
        navigator.dismiss()

        XCTAssertTrue(navigationControllerMock.wasDismiss)
        XCTAssertFalse(navigationControllerMock.wasPop)
    }

    func testNavigateAsPop() {
        navigator.pop()

        XCTAssertTrue(navigationControllerMock.wasPop)
        XCTAssertFalse(navigationControllerMock.wasDismiss)
    }
}
