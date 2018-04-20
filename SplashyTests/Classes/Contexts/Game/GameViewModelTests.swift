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

    var viewModel: GameViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = GameViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testInitialSetup() {
        assert(viewModel.score.value == 0)
        assert(viewModel.boost.value == .none)
        assert(viewModel.isDead == false)
        assert(viewModel.hasStarted == false)
    }

    func testDidPickRuby() {
        viewModel.didPickRuby()

        assert(viewModel.score.value == 1)
        assert(viewModel.boost.value == .double)
    }

    func testDidPickRubySixTimesFromStart() {
        for _ in 0..<6 {
            viewModel.didPickRuby()
        }

        assert(viewModel.score.value == 20)
        assert(viewModel.boost.value == .quintuple)
    }

    func testSplashyCollided() {
        viewModel.splashyCollided()

        assert(viewModel.isDead == true)
    }

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

    func testRestart() {
        viewModel.restart()

        assert(viewModel.score.value == 0)
        assert(viewModel.boost.value == .none)
        assert(viewModel.isDead == false)
        assert(viewModel.hasStarted == false)
    }
}
