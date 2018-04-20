//
//  BoostTypeTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class BoostTypeTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let noneString = "x1"
        static let doubleString = "x2"
        static let tripleString = "x3"
        static let quadrupleString = "x4"
        static let quintupleString = "x5"
    }
    
    // MARK: - TEST: toString()
    func testToString() {
        assert(BoostType.none.toString() == Constants.noneString)
        assert(BoostType.double.toString() == Constants.doubleString)
        assert(BoostType.triple.toString() == Constants.tripleString)
        assert(BoostType.quadruple.toString() == Constants.quadrupleString)
        assert(BoostType.quintuple.toString() == Constants.quintupleString)
    }
}
