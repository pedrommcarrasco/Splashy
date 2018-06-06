//
//  ScoreView.swift
//  Splashy
//
//  Created by Pedro Carrasco on 16/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    // MARK: - STRINGS
    private enum Strings {
        static let scorePoint = "score-point".localizedString
        static let scorePoints = "score-points".localizedString
        static let scoreBoost = "score-boost".localizedString
    }
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let initialScore = 0
        static let singularScore = 1
    }
    
    // MARK: - OUTLETS
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var boostLabel: UILabel!
    
    // MARK: - PROPERTIES
    var score = Constants.initialScore { didSet { scoreChanged(to: score) } }
    var boost = BoostType.none { didSet { boostChanged(to: boost) } }
    var scoreText: String? { return scoreLabel.text }
    var boostText: String? { return boostLabel.text }
    
    // MARK: - INITS
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    // MARK: - PRIVATE FUNCTIONS
    private func scoreChanged(to score: Int) {
        let scoreText = score == Constants.singularScore ? Strings.scorePoint : Strings.scorePoints
        scoreLabel.text = "\(score) \(scoreText)"
    }
    
    private func boostChanged(to boost: BoostType) {
        boostLabel.text = "\(boost.toString()) \(Strings.scoreBoost)"
    }
}
