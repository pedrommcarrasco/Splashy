//
//  CountingLabel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 18/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit
class CountingLabel: UILabel {
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let counterRate: Float = 3.0
        static let updateCountTimeInterval: TimeInterval = 0.01
    }
    
    // MARK: - PROPERTIES
    var progress: TimeInterval = 0.0
    var duration: TimeInterval = 0.0
    var lastUpdate: TimeInterval = 0.0
    var timer: Timer?
    var finalValue: Float = 0
    var currentValue: Float {
        if (progress >= duration) {
            return finalValue
        }

        let percent = Float(progress / duration)
        let update = updateCounter(with: percent)
        return update * finalValue
    }
    
    // MARK: - METHODS
    func count(until value: Float, with duration: TimeInterval) {
        invalidate()

        self.duration = duration
        self.finalValue = value
        self.lastUpdate = Date.timeIntervalSinceReferenceDate
        
        timer = Timer.scheduledTimer(timeInterval: Constants.updateCountTimeInterval, target: self,
                                     selector: #selector(update), userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func update() {
        
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        if (progress >= duration) {
            invalidate()
            progress = duration
        }
        
        self.text = "\(Int(currentValue))"
    }
    
    func updateCounter(with percentage: Float) -> Float {
        return 1.0 - powf((1.0 - percentage), Constants.counterRate)
    }
    
    private func invalidate() {
        timer?.invalidate()
        timer = nil
    }
}

