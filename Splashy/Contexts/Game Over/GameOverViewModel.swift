//
//  GameOverViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

struct GameOverViewModel {

    // MARK: - PROPERTIES
    let retryIcon = Assets.iconRetry
    let recordsIcon = Assets.iconRecords
    let tutorialIcon = Assets.iconTutorial
    
    let score: Int
    let scoreDescription: String
    
    var scoreAsset: String {
        return isNewRecord ? Assets.newRecordImage : Assets.gameoverImage
    }
    
    private let isNewRecord: Bool
    
    // MARK: - INIT
    init(with score: Int, and recordsManager: RecordsManager) {
        self.score = score
        self.isNewRecord = recordsManager.isNewRecord(score)
        self.scoreDescription = score == 1 ? "score-point".localizedString : "score-points".localizedString
    }
}
