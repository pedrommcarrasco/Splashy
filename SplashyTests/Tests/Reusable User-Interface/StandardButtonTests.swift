//
//  StandardButtonTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 04/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class StandardButtonTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let buttonFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        static let cornerRadiusWidthRatio: CGFloat = 2
        static let visualEffectViewCount = 1
    }

    // MARK: - TEST: init(frame: CGRect)
    func testInitWithFrame() {
        let standardButton = StandardButton(frame: Constants.buttonFrame)

        XCTAssertNotNil(standardButton)
        XCTAssert(standardButton.layer.masksToBounds == true)
        XCTAssert(standardButton.layer.cornerRadius == Constants.buttonFrame.width/Constants.cornerRadiusWidthRatio)
        XCTAssert(standardButton.subviews.filter {$0 is UIVisualEffectView}.count == Constants.visualEffectViewCount)
    }
}
