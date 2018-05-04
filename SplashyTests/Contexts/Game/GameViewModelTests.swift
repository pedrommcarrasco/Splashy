//
//  GameViewModel.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class GameViewModelTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let initialScore = 0
        static let initialBoost = BoostType.none

        static let scoreAfterFirstRuby = 1
        static let boostAfterFirstRuby = BoostType.double

        static let consecutiveRubies = 6
        static let scoreAfterConsecutiveRubies = 20
        static let boostAfterConsecutiveRubies = BoostType.quintuple
    }

    // MARK: - PROPERTIES
    var viewModel: GameViewModel!

    // MARK: - SETUP
    override func setUp() {
        super.setUp()
        viewModel = GameViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - TEST: init()
    func testInitialSetup() {
        XCTAssert(viewModel.score.value == Constants.initialScore)
        XCTAssert(viewModel.boost.value == Constants.initialBoost)
        XCTAssert(viewModel.isDead == false)
        XCTAssert(viewModel.hasStarted == false)
    }

    // MARK: - TEST: didPickRuby()
    func testDidPickRuby() {
        viewModel.didPickRuby()

        XCTAssert(viewModel.score.value == Constants.scoreAfterFirstRuby)
        XCTAssert(viewModel.boost.value == Constants.boostAfterFirstRuby)
    }

    func testDidPickRubySixTimesFromStart() {
        for _ in 0..<Constants.consecutiveRubies {
            viewModel.didPickRuby()
        }

        XCTAssert(viewModel.score.value == Constants.scoreAfterConsecutiveRubies)
        XCTAssert(viewModel.boost.value == Constants.boostAfterConsecutiveRubies)
    }

    // MARK: - TEST: splashyCollided()
    func testSplashyCollided() {
        viewModel.splashyCollided()

        XCTAssert(viewModel.isDead == true)
    }

    // MARK: - TEST: shouldAnimate()
    func testShouldAnimateDefault() {
        viewModel.hasStarted = false
        viewModel.isDead = false

        let result = viewModel.shouldAnimate()

        XCTAssert(result == false)
    }

    func testShouldAnimateTrue() {
        viewModel.hasStarted = true
        viewModel.isDead = false

        let result = viewModel.shouldAnimate()

        XCTAssert(result == true)
    }

    func testShouldAnimateFalse() {
        viewModel.hasStarted = true
        viewModel.isDead = true

        let result = viewModel.shouldAnimate()

        XCTAssert(result == false)
    }

    // MARK: - TEST: restart()
    func testRestart() {
        viewModel.restart()

        XCTAssert(viewModel.score.value == Constants.initialScore)
        XCTAssert(viewModel.boost.value == Constants.initialBoost)
        XCTAssert(viewModel.isDead == false)
        XCTAssert(viewModel.hasStarted == false)
    }
}
