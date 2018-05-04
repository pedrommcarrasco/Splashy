//
//  CountingLabelTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 04/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class CountingLabelTests: XCTestCase {
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        static let initialText = "0"
        static let countFinalValue: Float = 30
        static let countTimeInterval = 1.0
        static let expectationsTimeout = 3.0
    }

    // MARK: - func init(frame: CGRect)
    func testInit() {
        let countingLabel = CountingLabel(frame: Constants.labelFrame)

        XCTAssertNotNil(countingLabel)
        XCTAssert(countingLabel.text == Constants.initialText)
    }

    // MARK: - TEST: func count(until value: Float, with duration: TimeInterval)
    func testCountUntil() {
        let countingLabel = CountingLabel(frame: Constants.labelFrame)
        countingLabel.count(until: Constants.countFinalValue, with: Constants.countTimeInterval)

        let countExpectation = expectation(description: "Waiting for label to count until the desired number")

        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.countTimeInterval) {
            countExpectation.fulfill()
        }

        waitForExpectations(timeout: Constants.expectationsTimeout)

        XCTAssert(Int(countingLabel.text ?? Constants.initialText) == Int(Constants.countFinalValue))
    }
}
