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
}

class GameOverView: UIView {

    // MARK: - OUTLETS
    @IBOutlet private weak var containerView: UIView!

    @IBOutlet private weak var scoreLabel: CountingLabel!
    @IBOutlet private weak var scoreDescriptionLabel: UILabel!
    @IBOutlet private weak var scoreStateImageView: UIImageView!
    
    @IBOutlet private weak var retryButton: StandardButton!

    // MARK: - PROPERTIES
    let viewModel: GameOverViewModelRepresentable
    weak var delegate: GameOverViewDelegate?

    // MARK: - INIT
    init(with viewModel: GameOverViewModelRepresentable) {
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

        setupScoreLabel()
        setupButtons()
        setupScoreDescriptionImageView()
    }

    // MARK: - SETUP
    private func setupScoreLabel() {
        scoreLabel.count(until: Float(viewModel.score), with: AnimationDurations.normal.rawValue)
        scoreDescriptionLabel.text = viewModel.scoreDescription
    }

    private func setupButtons() {
        retryButton.configureImage(with: viewModel.retryIcon)
    }

    private func setupScoreDescriptionImageView() {
        guard let scoreImage = UIImage(named: viewModel.scoreAsset) else { return }
        scoreStateImageView.image = scoreImage
    }

    // MARK: - ACTIONS
    @IBAction private func retryButtonAction(_ sender: StandardButton) {
        delegate?.didPressRetry(in: self)
    }
}
