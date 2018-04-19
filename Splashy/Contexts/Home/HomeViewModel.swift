//
//  HomeViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol HomeViewModelRepresentable {
    var playImage: String { get }
    var tutorialImage: String { get }
    var recordImage: String { get }
}

struct HomeViewModel: HomeViewModelRepresentable {
    
    // MARK: - PROPERTIES
    let playImage = Assets.iconPlay
    let tutorialImage = Assets.iconTutorial
    let recordImage = Assets.iconRecords
}
