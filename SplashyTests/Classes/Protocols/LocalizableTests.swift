//
//  LocalizableTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class LocalizableTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let localizableString = "unitTest-test"
        static let localizableStringFirstUppercase = "unitTest-firstUppercase"

        static let expectedLocalizedString = "test"
        static let expectedLocalizedFirstLetterUppercaseString = "Test"
        static let expectedLocalizedUppercaseString =  "TEST"
    }

    // MARK: - TEST: localizedString
    func testLocalizedString() {
        let result = Constants.localizableString.localizedString

        XCTAssert(result == Constants.expectedLocalizedString)
    }

    // MARK: - TEST: localizedFirstLetterUppercaseString
    func testLocalizedFirstLetterUppercaseString() {
        let result = Constants.localizableString.localizedFirstLetterUppercaseString

        XCTAssert(result == Constants.expectedLocalizedFirstLetterUppercaseString)
    }

    // MARK: - TEST: localizedUppercaseString
    func testLocalizedUppercaseString() {
        let result = Constants.localizableString.localizedUppercaseString

        XCTAssert(result == Constants.expectedLocalizedUppercaseString)
    }
}
