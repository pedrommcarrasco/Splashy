//
//  RecordsViewModelTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 11/06/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class RecordsViewModelTests: XCTestCase {
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let pointInSingular = "point"
        static let pointInPlural = "points"
        static let record = 5
    }

    // MARK: - PROPERTIES
    var viewModel: RecordsViewModel!
    var recordsManagerMock: RecordsManagerMock!

    // MARK: - SETUP
    override func setUp() {
        super.setUp()

        recordsManagerMock = RecordsManagerMock()
        viewModel = RecordsViewModel(with: recordsManagerMock)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - TEST: record
    func testRecord() {
        XCTAssertEqual(viewModel.record, Constants.record)
    }

    // MARK: - TEST: recordDescription
    func testRecordDescriptionPlural() {
        XCTAssertEqual(viewModel.recordDescription, Constants.pointInPlural)
    }

    func testRecordDescriptionSingular() {
        recordsManagerMock.currentRecord = 1
        XCTAssertEqual(viewModel.recordDescription, Constants.pointInSingular)
    }
}
