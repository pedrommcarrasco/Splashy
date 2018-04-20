//
//  BindableTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class BindableTests: XCTestCase {

    // MARK: - CONSTANTS
    private enum Constants {
        static let initialValue = 0
        static let finalValue = 2
    }

    // MARK: - PROPERTIES
    var intBindable: Bindable<Int>!
    var valueUpdated = false

    // MARK: - SETUP
    override func setUp() {
        super.setUp()

        valueUpdated = false
        intBindable = Bindable(Constants.initialValue)
    }

    override func tearDown() {
        intBindable = nil

        super.tearDown()
    }

    // MARK: - TEST: init(_ value: T)
    func testInit() {
        assert(intBindable.value == Constants.initialValue)
    }

    // MARK: - TEST: bind(observer: Observer?)
    func testBind() {
        intBindable.bind {
            if self.valueUpdated {
                assert($0 == Constants.finalValue)
            } else {
                assert($0 == Constants.initialValue)
            }
        }

        valueUpdated = true
        intBindable.value = Constants.finalValue

        valueUpdated = false
        intBindable.value = Constants.initialValue
    }
}
