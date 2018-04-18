//
//  GameOverView.swift
//  Splashy
//
//  Created by Pedro Carrasco on 27/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol GameOverViewDelegate: class {
    func didPressRetry(in gameoverView: GameOverView)
    func didPressRecords(in gameoverView: GameOverView)
    func didPressTutorial(in gameoverView: GameOverView)
}

class GameOverView: UIView {

    // MARK: - OUTLETS
    @IBOutlet private weak var containerView: UIView!

    @IBOutlet private weak var scoreLabel: CountingLabel!
    @IBOutlet private weak var scoreDescriptionLabel: UILabel!
    @IBOutlet private weak var scoreStateImageView: UIImageView!
    
    @IBOutlet private weak var retryButton: StandardButton!
    @IBOutlet private weak var recordButton: StandardButton!
    @IBOutlet private weak var tutorialButton: StandardButton!

    // MARK: - PROPERTIES
    let viewModel: GameOverViewModel
    weak var delegate: GameOverViewDelegate?

    // MARK: - INIT
    init(with viewModel: GameOverViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        loadNib()
        initContent()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initContent() {
        containerView.roundedCorners()
        
        scoreLabel.count(until: Float(viewModel.score), with: AnimationDurations.normal.rawValue)
        scoreDescriptionLabel.text = viewModel.scoreDescription
        
        retryButton.image = UIImage(named: viewModel.retryIcon)
        recordButton.image = UIImage(named: viewModel.recordsIcon)
        tutorialButton.image = UIImage(named: viewModel.tutorialIcon)
        
        guard let scoreImage = UIImage(named: viewModel.scoreAsset) else { return }
        scoreStateImageView.image = scoreImage
    }

    // MARK: - ACTIONS
    @IBAction func retryButtonAction(_ sender: StandardButton) {
        delegate?.didPressRetry(in: self)
    }

    @IBAction func recordsButtonAction(_ sender: StandardButton) {
        delegate?.didPressRecords(in: self)
    }

    @IBAction func tutorialButtonAction(_ sender: StandardButton) {
        delegate?.didPressTutorial(in: self)
    }
}
