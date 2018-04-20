//
//  RecordsManagerMock.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
@testable import Splashy

class RecordsManagerMock: RecordsManagerRepresentable {

    // MARK: - CONTANTS
    private enum Constants {
        static let record = 5
    }

    // MARK: - PROPERTIES
    var currentRecord = Constants.record

    // MARK: - FUNCTIONS
    func isNewRecord(_ score: Int) -> Bool {
        let isNewRecord = score > currentRecord

        if isNewRecord { currentRecord = score }

        return isNewRecord
    }
}
