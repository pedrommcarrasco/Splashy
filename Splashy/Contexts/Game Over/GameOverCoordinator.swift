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

class GameOverCoordinator: Coordinator, CoordinatorDelegate {

    // MARK: - PROPERTIES
    weak var coordinatorDelegate: CoordinatorDelegate?
    weak var delegate: GameOverCoordinatorDelegate?
    private let navigationController: UINavigationController
    private let viewController: GameOverViewController
    internal var coordinators: [Coordinator]

    // MARK: - INIT
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.coordinators = []

        let viewModel = GameOverViewModel()
        self.viewController = GameOverViewController(with: viewModel)

        self.viewController.navigationDelegate = self
        self.viewController.modalTransitionStyle = .coverVertical
        self.viewController.modalPresentationStyle = .overCurrentContext
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
        navigationController.present(viewController, animated: true, completion: nil)
    }
}

extension GameOverCoordinator: GameoverViewControllerNavigationDelegate {
    func didPressRetry(in gameoverViewController: GameOverViewController) {
        delegate?.retry(from: self)
        coordinatorDelegate?.coordinatorDidEnd(self)
        viewController.dismiss(animated: true, completion: nil)
    }

    func didPressRecords(in gameoverViewController: GameOverViewController) {}
    func didPressTutorial(in gameoverViewController: GameOverViewController) {}
}
