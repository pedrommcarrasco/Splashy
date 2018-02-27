//
//  GameOverCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class GameOverCoordinator: Coordinator, CoordinatorDelegate {

    // MARK: - PROPERTIES
    weak var coordinatorDelegate: CoordinatorDelegate?
    private let navigationController: UINavigationController
    internal var coordinators: [Coordinator]

    // MARK: - INIT
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.coordinators = []
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
        navigationController.pushViewController(
            viewController(), animated: true
        )
    }

    // MARK: - FUNCTIONS
    private func viewController() -> GameOverViewController {
        let viewModel = GameOverViewModel()
        let viewController = GameOverViewController(with: viewModel)

        return viewController
    }
}
