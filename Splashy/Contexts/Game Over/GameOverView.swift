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
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var retryButton: StandardButton!
    @IBOutlet weak var recordButton: StandardButton!
    @IBOutlet weak var tutorialButton: StandardButton!

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
        retryButton.image = UIImage(named: viewModel.iconRetry)
        recordButton.image = UIImage(named: viewModel.iconRecords)
        tutorialButton.image = UIImage(named: viewModel.iconTutorial)
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
