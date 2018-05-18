//
//  SimpleDelegatableSpy.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest

protocol SimpleDelegatableSpy {

    func evaluateCall(expectation: XCTestExpectation?)
}

extension SimpleDelegatableSpy {

    func evaluateCall(expectation: XCTestExpectation?) {
        guard let expectation = expectation else { return XCTFail() }
        expectation.fulfill()
    }
}
