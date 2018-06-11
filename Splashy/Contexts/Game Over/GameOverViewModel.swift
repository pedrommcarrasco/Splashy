//
//  GameOverViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol GameOverViewModelRepresentable {
    var retryIcon: String { get }
    var closeIcon: String { get }
    var score: Int { get }
    var scoreDescription: String { get }
    var scoreAsset: String { get }
}

struct GameOverViewModel: GameOverViewModelRepresentable {
    
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
    let closeIcon = Assets.iconClose
    let score: Int
    let scoreDescription: String
    
    var scoreAsset: String {
        return isNewRecord ? Assets.newRecordImage : Assets.gameoverImage
    }
    
    private let isNewRecord: Bool
    
    // MARK: - INIT
    init(with score: Int, and recordsManager: RecordsManagerRepresentable) {
        self.score = score
        self.isNewRecord = recordsManager.isNewRecord(score)
        self.scoreDescription = score == Constants.singularScore ? Strings.scorePoint : Strings.scorePoints
    }
}
