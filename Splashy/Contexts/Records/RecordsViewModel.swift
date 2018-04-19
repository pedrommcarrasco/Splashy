//
//  RecordsViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol RecordsViewModelRepresentable {}

struct RecordsViewModel: RecordsViewModelRepresentable {

    // MARK: - PROPERTIES
    private let recordsManager: RecordsManagerRepresentable

    // MARK: - INIT
    init(with recordsManager: RecordsManagerRepresentable) {
        self.recordsManager = recordsManager
    }
}
