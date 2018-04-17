//
//  GameViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

class GameViewModel {
    
    // MARK: - PROPERTIES
    let score: Bindable<Int> = Bindable(0)
    let boost: Bindable<BoostType> = Bindable(.none)
    
    var hasStarted = false
    var isDead = false
    
    // MARK: - FUNCTIONS
    func didPickRuby() {
        score.value += 1 * boost.value.rawValue
        boost.value = BoostType(rawValue: boost.value.rawValue + 1) ?? .quintuple
    }

    func splashyCollided() {
        isDead = true
    }

    func shouldAnimate() -> Bool {
        return hasStarted && !isDead
    }

    func restart() {
        isDead = false
        hasStarted = false
        score.value = 0
        boost.value = .none
    }
}
