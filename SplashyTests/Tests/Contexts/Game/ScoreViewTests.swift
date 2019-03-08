//
//  ScoreViewTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 06/06/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class ScoreViewTests: XCTestCase {
    
    // MARK: - CONSTANTS
    private enum Strings {
        static let scorePoint = "score-point".localized
        static let scorePoints = "score-points".localized
        static let scoreBoost = "score-boost".localized
    }
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let oneScore = 1
        static let zeroScore = 0
        static let tenScore = 10
    }
    
    // MARK: - PROPERTIES
    var scoreView: ScoreView!
    
    // MARK: - PROPERTIES
    override func setUp() {
        super.setUp()
        
        scoreView = ScoreView(frame: .zero)
    }
    
    override func tearDown() {
        scoreView = nil
        
        super.tearDown()
    }
    
    // MARK: - TEST: score
    func testSetScoreAsZero() {
        testSetScore(with: Constants.zeroScore,
                     expectedComplementaryString: Strings.scorePoints)
    }
    
    func testSetScoreAsOne() {
        testSetScore(with: Constants.oneScore,
                     expectedComplementaryString: Strings.scorePoint)
    }
    
    func testSetScoreAsTen() {
        testSetScore(with: Constants.tenScore,
                     expectedComplementaryString: Strings.scorePoints)
    }
    
    // MARK: - TEST: score
    func testSetBoostAsNone() {
        testSetBoost(with: .none)
    }
    
    func testSetBoostAsDouble() {
        testSetBoost(with: .double)
    }
    
    func testSetBoostAsTriple() {
        testSetBoost(with: .triple)
    }
    
    func testSetBoostAsQuadruple() {
        testSetBoost(with: .quadruple)
    }
    
    func testSetBoostAsQuintuple() {
        testSetBoost(with: .quintuple)
    }
}

private extension ScoreViewTests {
    
    private func testSetScore(with score: Int, expectedComplementaryString: String) {
        scoreView.score = score
        
        let result = scoreView.scoreText
        let expectedResult = "\(score) \(expectedComplementaryString)"
        
        XCTAssertEqual(result, expectedResult)
    }
    
    private func testSetBoost(with boostType: BoostType) {
        scoreView.boost = boostType
        
        let result = scoreView.boostText
        let expectedResult = "\(boostType.toString()) \(Strings.scoreBoost)"
        
        XCTAssertEqual(result, expectedResult)
    }
}
