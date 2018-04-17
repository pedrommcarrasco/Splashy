//
//  ScoreView.swift
//  Splashy
//
//  Created by Pedro Carrasco on 16/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    // MARK: - OUTLETS
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var boostLabel: UILabel!
    
    // MARK: - PROPERTIES
    var score = 0 {
        didSet { scoreChanged(to: score) }
    }
    
    var boost = BoostType.none {
        didSet { boostChanged(to: boost) }
    }
    
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
        scoreLabel.text = "\(score) \("score-points".localizedString)"
    }
    
    private func boostChanged(to boost: BoostType) {
        boostLabel.text = "\(boost.toString()) \("score-boost".localizedString)"
    }
}
