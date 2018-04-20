//
//  GameViewModel.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameViewModelTests: XCTestCase {

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
        assert(viewModel.score.value == Constants.initialScore)
        assert(viewModel.boost.value == Constants.initialBoost)
        assert(viewModel.isDead == false)
        assert(viewModel.hasStarted == false)
    }

    // MARK: - TEST: didPickRuby()
    func testDidPickRuby() {
        viewModel.didPickRuby()

        assert(viewModel.score.value == Constants.scoreAfterFirstRuby)
        assert(viewModel.boost.value == Constants.boostAfterFirstRuby)
    }

    func testDidPickRubySixTimesFromStart() {
        for _ in 0..<Constants.consecutiveRubies {
            viewModel.didPickRuby()
        }

        assert(viewModel.score.value == Constants.scoreAfterConsecutiveRubies)
        assert(viewModel.boost.value == Constants.boostAfterConsecutiveRubies)
    }

    // MARK: - TEST: splashyCollided()
    func testSplashyCollided() {
        viewModel.splashyCollided()

        assert(viewModel.isDead == true)
    }

    // MARK: - TEST: shouldAnimate()
    func testShouldAnimateDefault() {
        viewModel.hasStarted = false
        viewModel.isDead = false

        let result = viewModel.shouldAnimate()

        assert(result == false)
    }

    func testShouldAnimateTrue() {
        viewModel.hasStarted = true
        viewModel.isDead = false

        let result = viewModel.shouldAnimate()

        assert(result == true)
    }

    func testShouldAnimateFalse() {
        viewModel.hasStarted = true
        viewModel.isDead = true

        let result = viewModel.shouldAnimate()

        assert(result == false)
    }

    // MARK: - TEST: restart()
    func testRestart() {
        viewModel.restart()

        assert(viewModel.score.value == Constants.initialScore)
        assert(viewModel.boost.value == Constants.initialBoost)
        assert(viewModel.isDead == false)
        assert(viewModel.hasStarted == false)
    }
}
