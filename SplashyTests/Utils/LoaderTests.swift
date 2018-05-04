//
//  LoaderTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 04/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class LoaderTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let expectedJumpImagesCount = 9
    }

    // MARK: - TEST: func load(texture type: LoadType) -> [SKTexture]
    func testLoadSplashyJump() {

        let jumpTextures = Loader.load(texture: .splashyJump)

        XCTAssert(jumpTextures.count == Constants.expectedJumpImagesCount)
    }
}
