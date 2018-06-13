//
//  GameOverViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit
import Constrictor

protocol GameoverViewControllerNavigationDelegate: class {
    func didPressRetry(in gameoverViewController: GameOverViewController)
    func didPressClose(in gameoverViewController: GameOverViewController)
}

class GameOverViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet private weak var gameoverViewContainer: UIView!

    // MARK: - PROPERTIES
    weak var navigationDelegate: GameoverViewControllerNavigationDelegate?

    // MARK: - PRIVATE PROPERTIES
    private var viewModel: GameOverViewModelRepresentable

    // MARK: - INIT
    init(with viewModel: GameOverViewModelRepresentable) {
        self.viewModel = viewModel
        super.init(nibName: GameOverViewController.name, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameoverView()
    }

    // MARK: - SETUP GAMEOVER VIEW
    private func setupGameoverView() {
        let gameoverView = GameOverView(with: viewModel)
        gameoverView.delegate = self
        gameoverViewContainer.addSubview(gameoverView)
        
        gameoverView.constrictEdgesToSuperview()
    }
}

extension GameOverViewController: GameOverViewDelegate {
    func didPressClose(in gameoverView: GameOverView) {
        navigationDelegate?.didPressClose(in: self)
    }

    func didPressRetry(in gameoverView: GameOverView) {
        navigationDelegate?.didPressRetry(in: self)
    }
}
