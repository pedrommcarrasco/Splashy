//
//  GameOverViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol GameoverViewControllerNavigationDelegate: class {
    func didPressRetry(in gameoverViewController: GameOverViewController)
    func didPressRecords(in gameoverViewController: GameOverViewController)
    func didPressTutorial(in gameoverViewController: GameOverViewController)
}

class GameOverViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var gameoverViewContainer: UIView!

    // MARK: - PROPERTIES
    private var viewModel: GameOverViewModelRepresentable
    weak var navigationDelegate: GameoverViewControllerNavigationDelegate?

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
        gameoverView.translatesAutoresizingMaskIntoConstraints = false
        gameoverViewContainer.addSubview(gameoverView)
        
        NSLayoutConstraint.activate(
            [gameoverView.topAnchor.constraint(equalTo: gameoverViewContainer.topAnchor),
             gameoverView.bottomAnchor.constraint(equalTo: gameoverViewContainer.bottomAnchor),
             gameoverView.leadingAnchor.constraint(equalTo: gameoverViewContainer.leadingAnchor),
             gameoverView.trailingAnchor.constraint(equalTo: gameoverViewContainer.trailingAnchor)]
        )
    }
}

extension GameOverViewController: GameOverViewDelegate {
    func didPressRetry(in gameoverView: GameOverView) {
        navigationDelegate?.didPressRetry(in: self)
    }

    func didPressRecords(in gameoverView: GameOverView) {
        navigationDelegate?.didPressRecords(in: self)
    }

    func didPressTutorial(in gameoverView: GameOverView) {
        navigationDelegate?.didPressTutorial(in: self)
    }
}
