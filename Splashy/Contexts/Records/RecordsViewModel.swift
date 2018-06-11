//
//  RecordsViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol RecordsViewModelRepresentable {
    var retryIcon: String { get }
    var record: Int { get }
    var recordDescription: String { get }
}

struct RecordsViewModel: RecordsViewModelRepresentable {

    // MARK: - STRINGS
    private enum Strings {
        static let scorePoint = "score-point".localizedString
        static let scorePoints = "score-points".localizedString
    }

    // MARK: - CONSTANTS
    private enum Constants {
        static let singularScore = 1
    }

    // MARK: - PROPERTIES
    let retryIcon = Assets.iconRetry
    var record: Int { return recordsManager.currentRecord }
    var recordDescription: String { return recordsManager.currentRecord == 1 ? Strings.scorePoint : Strings.scorePoints}

    private let recordsManager: RecordsManagerRepresentable

    // MARK: - INIT
    init(with recordsManager: RecordsManagerRepresentable) {
        self.recordsManager = recordsManager
    }
}
