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
    var hasStarted = false
    var isDead = false
    let score: Bindable<Int> = Bindable(0)
    
    // MARK: - FUNCTIONS
    func didPickRuby() {
        score.value += 1
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
    }
}
