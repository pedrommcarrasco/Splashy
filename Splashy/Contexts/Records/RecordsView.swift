//
//  RecordsView.swift
//  Splashy
//
//  Created by Pedro Carrasco on 11/06/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol RecordsViewDelegate: class {
    func didPressDismiss(in gameoverView: RecordsView)
}

class RecordsView: UIView {

    // MARK: - OUTLETS
    @IBOutlet weak var containerView: UIView!

    @IBOutlet private weak var scoreLabel: CountingLabel!
    @IBOutlet private weak var scoreDescriptionLabel: UILabel!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var dismissButton: StandardButton!

    // MARK: - PROPERTIES
    
    let viewModel: RecordsViewModelRepresentable
    weak var delegate: RecordsViewDelegate?

    // MARK: - INIT
    init(with viewModel: RecordsViewModelRepresentable) {
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

        setupScoreLabels()
        setupRetryButton()
        setupTitleImageView()
    }

    // MARK: - SETUP
    private func setupScoreLabels() {
        scoreLabel.count(until: Float(viewModel.record), with: AnimationDurations.normal.rawValue)
        scoreDescriptionLabel.text = viewModel.recordDescription
    }

    private func setupRetryButton() {
        dismissButton.configureImage(with: viewModel.dismissIcon)
    }

    private func setupTitleImageView() {
        guard let image = UIImage(named: viewModel.titleAsset) else { return }
        titleImageView.image = image
        titleImageView.contentMode = .scaleAspectFit
    }

    // MARK: - ACTIONS
    @IBAction func dismissButtonAction(_ sender: StandardButton) {
        delegate?.didPressDismiss(in: self)
    }
}
