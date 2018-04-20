//
//  GameOverViewModel.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class GameOverViewModelTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let pointInSingular = "score-point".localizedString
        static let pointInPlural = "score-points".localizedString
        static let lowerScore = 1
        static let higherScore = 10
        static let initialScore = 0
    }

    // MARK: - PROPERTIES
    var viewModel: GameOverViewModel!

    // MARK: - SETUP
    override func setUp() {
        super.setUp()
        let recorsManagerMock = RecordsManagerMock()
        viewModel = GameOverViewModel(with: Constants.initialScore, and: recorsManagerMock)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - TEST: init(with score: Int, and recordsManager: RecordsManagerRepresentable) + scoreAsset
    func testInitWithLowerScoreBeingOne() {
        let viewModel = GameOverViewModel(with: Constants.lowerScore, and: RecordsManagerMock())


        assert(viewModel.score == Constants.lowerScore)
        assert(viewModel.scoreAsset == Assets.gameoverImage)
        assert(viewModel.scoreDescription == Constants.pointInSingular)
    }

    func testInitWithHigherScore() {
        let viewModel = GameOverViewModel(with: Constants.higherScore, and: RecordsManagerMock())

        assert(viewModel.score == Constants.higherScore)
        assert(viewModel.scoreAsset == Assets.newRecordImage)
        assert(viewModel.scoreDescription == Constants.pointInPlural)
    }

}
