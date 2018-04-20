//
//  CoordinatorTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class CoordinatorTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let initialHomeCoordinatorsCount = 0
        static let afterAddHomeCoordinatorsCount = 1
    }

    // MARK: - PROPERTIES
    var homeCoordinator: HomeCoordinatorMock!
    var gameCoordinator: GameCoordinatorMock!
    
    override func setUp() {
        super.setUp()

        homeCoordinator = HomeCoordinatorMock()

        gameCoordinator = GameCoordinatorMock()
        gameCoordinator.coordinatorDelegate = homeCoordinator
    }
    
    override func tearDown() {
        homeCoordinator = nil
        gameCoordinator = nil

        super.tearDown()
    }

    // MARK: - TEST: coordinatorDidStart(_ coordinator: Coordinator)
    func testCoordinatorDidStart() {
        XCTAssert(homeCoordinator.coordinators.count == Constants.initialHomeCoordinatorsCount)

        gameCoordinator.start()

        XCTAssert(homeCoordinator.coordinators.count == Constants.afterAddHomeCoordinatorsCount)
    }

    // MARK: - TEST: coordinatorDidEnd(_ coordinator: Coordinator)
    func testCoordinatorDidEnd() {
        gameCoordinator.start()

        gameCoordinator.coordinatorDelegate?.coordinatorDidEnd(gameCoordinator)

        XCTAssert(homeCoordinator.coordinators.count == Constants.initialHomeCoordinatorsCount)
    }
}
