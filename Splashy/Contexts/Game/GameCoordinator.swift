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
    private let navigator: NavigatorRepresentable
    private let viewController: GameViewController

    weak var coordinatorDelegate: CoordinatorDelegate?

    internal var coordinators: [Coordinator] = []

    // MARK: - INIT
    init(with navigator: NavigatorRepresentable) {
        self.navigator = navigator

        let viewModel = GameViewModel()
        self.viewController = GameViewController(with: viewModel)
        self.viewController.navigationDelegate = self
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)

        navigator.transition(to: self.viewController, as: .push)
    }
}

extension GameCoordinator: GameViewControllerNavigation {
    func gameViewController(_ gameViewController: GameViewController, didEndGameWith points: Int) {
        let gameoverCoordinator = GameOverCoordinator(with: self.navigator, score: points)
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
