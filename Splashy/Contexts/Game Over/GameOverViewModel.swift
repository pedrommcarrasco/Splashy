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
    let score: String
    
    let iconRetry = Assets.iconRetry
    let iconRecords = Assets.iconRecords
    let iconTutorial = Assets.iconTutorial
    
    init(with score: Int) {
        self.score = "\(score)"
    }
}
