//
//  GameOverCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol GameOverCoordinatorDelegate: class {
    func retry(from gameoverCoordinator: GameOverCoordinator)
}

class GameOverCoordinator: Coordinator {

    // MARK: - PROPERTIES
    private let navigationController: UINavigationController
    private let score: Int

    weak var coordinatorDelegate: CoordinatorDelegate?
    weak var delegate: GameOverCoordinatorDelegate?

    internal var coordinators: [Coordinator]

    // MARK: - INIT
    init(navigationController: UINavigationController, score: Int) {
        self.navigationController = navigationController
        self.score = score
        self.coordinators = []
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
        navigationController.present(viewController(), animated: true, completion: nil)
    }

    // MARK: - FUNCTIONS
    private func viewController() -> GameOverViewController {
        let viewModel = GameOverViewModel(with: score, and: RecordsManager())
        let viewController = GameOverViewController(with: viewModel)

        viewController.navigationDelegate = self
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overCurrentContext

        return viewController
    }
}

extension GameOverCoordinator: GameoverViewControllerNavigationDelegate {
    func didPressRetry(in gameoverViewController: GameOverViewController) {
        delegate?.retry(from: self)
        coordinatorDelegate?.coordinatorDidEnd(self)
        
        navigationController.dismiss(animated: true, completion: nil)
    }

    func didPressRecords(in gameoverViewController: GameOverViewController) {}
    func didPressTutorial(in gameoverViewController: GameOverViewController) {}
}
