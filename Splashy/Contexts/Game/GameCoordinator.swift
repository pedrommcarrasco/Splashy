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
    var coordinators: [Coordinator] = []
    weak var coordinatorDelegate: CoordinatorDelegate?

    // MARK: - PRIVATE PROPERTIES
    private let navigator: NavigatorRepresentable
    private weak var gameViewController: GameViewController?

    // MARK: - INIT
    init(with navigator: NavigatorRepresentable) {
        self.navigator = navigator
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)

        let vc = viewController()
        navigator.transition(to: vc, as: .push)

        gameViewController = vc
    }

    private func viewController() -> GameViewController {
        let viewModel = GameViewModel()
        let viewcontroller = GameViewController(with: viewModel)
        viewcontroller.navigationDelegate = self

        return viewcontroller
    }
}

extension GameCoordinator: GameViewControllerNavigation {
    func gameViewController(_ gameViewController: GameViewController, didEndGameWith points: Int) {
        let gameoverCoordinator = GameOverCoordinator(with: navigator, score: points)
        gameoverCoordinator.coordinatorDelegate = self
        gameoverCoordinator.delegate = self
        gameoverCoordinator.start()
    }
}

extension GameCoordinator: GameOverCoordinatorDelegate {

    func close(from gameoverCoordinator: GameOverCoordinator) {
        coordinatorDidEnd(self)
        navigator.dismiss()
    }

    func retry(from gameoverCoordinator: GameOverCoordinator) {
        gameViewController?.restart()
    }
}
