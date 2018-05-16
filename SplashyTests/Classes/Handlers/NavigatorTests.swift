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

        self.navigationControllerMock = NavigationControllerMock()
        self.navigator = Navigator(with: navigationControllerMock)
    }

    override func tearDown() {
        super.tearDown()

        self.navigationControllerMock = nil
        self.navigator = nil
    }

    // MARK: - TEST: transition(to viewController: UIViewController, as type: NavigatorTransitionType)
    func testNavigateAsRoot() {
        navigator.transition(to: UIViewController(), as: .root)

        XCTAssertTrue(self.navigationControllerMock.wasRoot)
        XCTAssertFalse(self.navigationControllerMock.wasPresent)
        XCTAssertFalse(self.navigationControllerMock.wasPush)
    }

    func testNavigateAsPush() {
        navigator.transition(to: UIViewController(), as: .push)

        XCTAssertTrue(self.navigationControllerMock.wasPush)
        XCTAssertFalse(self.navigationControllerMock.wasPresent)
        XCTAssertFalse(self.navigationControllerMock.wasRoot)
    }

    func testNavigateAsPresent() {
        navigator.transition(to: UIViewController(), as: .modal)

        XCTAssertTrue(self.navigationControllerMock.wasPresent)
        XCTAssertFalse(self.navigationControllerMock.wasRoot)
        XCTAssertFalse(self.navigationControllerMock.wasPush)
    }

    func testNavigateAsDismiss() {
        navigator.dismiss()

        XCTAssertTrue(self.navigationControllerMock.wasDismiss)
        XCTAssertFalse(self.navigationControllerMock.wasPop)
    }

    func testNavigateAsPop() {
        navigator.pop()

        XCTAssertTrue(self.navigationControllerMock.wasPop)
        XCTAssertFalse(self.navigationControllerMock.wasDismiss)
    }
}
