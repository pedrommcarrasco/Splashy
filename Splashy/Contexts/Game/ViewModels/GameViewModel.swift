//
//  GameViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

class GameViewModel {
    var hasStarted = false
    var isDead = false
    let score: Bindable<Int> = Bindable(0)
    
    func didPickRuby() {
        score.value += 1
    }

    func splashyCollided() {
        isDead = true 
    }
}
