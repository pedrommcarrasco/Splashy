//
//  GameCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class GameCoordinator: Coordinator {

    // MARK: - PROPERTIES
    private let navigationController: UINavigationController
    private let viewController: GameViewController

    weak var coordinatorDelegate: CoordinatorDelegate?

    internal var coordinators: [Coordinator]

    // MARK: - INIT
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.coordinators = []

        let viewModel = GameViewModel()
        self.viewController = GameViewController(with: viewModel)
        self.viewController.navigationDelegate = self
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension GameCoordinator: GameViewControllerNavigation {
    func gameViewController(_ gameViewController: GameViewController, didEndGameWith points: Int) {
        let gameoverCoordinator = GameOverCoordinator(navigationController: navigationController, score: points)
        gameoverCoordinator.coordinatorDelegate = self
        gameoverCoordinator.delegate = self
        gameoverCoordinator.start()
    }
}

extension GameCoordinator: GameOverCoordinatorDelegate {
    func retry(from gameoverCoordinator: GameOverCoordinator) {
        viewController.restart()
    }
}
