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
    func close(from gameoverCoordinator: GameOverCoordinator)
}

class GameOverCoordinator: Coordinator {

    // MARK: - PROPERTIES
    weak var coordinatorDelegate: CoordinatorDelegate?
    weak var delegate: GameOverCoordinatorDelegate?
    var coordinators: [Coordinator] = []

    // MARK: - PRIVATE PROPERTIES
    private let navigator: NavigatorRepresentable
    private let score: Int

    // MARK: - INIT
    init(with navigator: NavigatorRepresentable, score: Int) {
        self.navigator = navigator
        self.score = score
        self.coordinators = []
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
        navigator.transition(to: viewController(), as: .modal)
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
    func didPressClose(in gameoverViewController: GameOverViewController) {
        coordinatorDelegate?.coordinatorDidEnd(self)
        delegate?.close(from: self)

        navigator.pop()
    }

    func didPressRetry(in gameoverViewController: GameOverViewController) {
        delegate?.retry(from: self)
        coordinatorDelegate?.coordinatorDidEnd(self)

        navigator.dismiss()
    }
}
