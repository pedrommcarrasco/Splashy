//
//  NibLoadableTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 04/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

final class NibLoadableTests: XCTestCase {

    // MARK: - TEST: func loadNib()
    func testLoadNib() {

        let testNibView = GameOverView(with: GameOverViewModelMock())

        XCTAssertNotNil(testNibView)
    }
}
