//
//  GameViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol GameViewModelRepresentable {
    var score: Bindable<Int> { get }
    var boost: Bindable<BoostType> { get }
    var hasStarted: Bool { get set }
    var isDead: Bool{ get }

    func didPickRuby()
    func splashyCollided()
    func shouldAnimate() -> Bool
    func restart()
}

class GameViewModel: GameViewModelRepresentable {
    
    private enum Constants {
        static let rubyPoint = 1
    }
    
    // MARK: - PROPERTIES
    let score: Bindable<Int> = Bindable(0)
    let boost: Bindable<BoostType> = Bindable(.none)
    var hasStarted = false
    var isDead = false

    private var timer: Timer?

    init() {
        self.timer = nil
        self.timer = GameViewModel.setupTimer(for: self)
    }

    // MARK: - FUNCTIONS
    func didPickRuby() {
        score.value += Constants.rubyPoint * boost.value.rawValue
        boost.value = BoostType(rawValue: boost.value.rawValue + Constants.rubyPoint) ?? .quintuple

        invalidadeBoostTimer()
        timer = GameViewModel.setupTimer(for: self)
    }

    func splashyCollided() {
        isDead = true
        invalidadeBoostTimer()
    }

    func shouldAnimate() -> Bool {
        return hasStarted && !isDead
    }

    func restart() {
        isDead = false
        hasStarted = false
        score.value = 0
        boost.value = .none
        timer = GameViewModel.setupTimer(for: self)
    }

    func invalidadeBoostTimer() {
        timer?.invalidate()
    }
}

private extension GameViewModel {

    @objc private func decreaseBoost() {
        boost.value = BoostType(rawValue: boost.value.rawValue - 1) ?? .none
    }

    static func setupTimer(for instance: GameViewModel) -> Timer {
        return Timer.scheduledTimer(timeInterval: 2.5,
                                    target: instance,
                                    selector: #selector(decreaseBoost),
                                    userInfo: nil,
                                    repeats: true)
    }
}
