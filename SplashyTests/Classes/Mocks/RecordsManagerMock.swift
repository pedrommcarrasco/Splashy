//
//  RecordsManagerMock.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
@testable import Splashy

struct RecordsManagerMock: RecordsManagerRepresentable {

    var currentRecord: Int = 3

    func isNewRecord(_ score: Int) -> Bool {
        return score > currentRecord
    }
}
