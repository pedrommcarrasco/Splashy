//
//  RecordsCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class RecordsCoordinator: Coordinator {

    // MARK: - PROPERTIES
    private let navigationController: UINavigationController

    weak var coordinatorDelegate: CoordinatorDelegate?

    internal var coordinators: [Coordinator]


    // MARK: - INIT
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.coordinators = []
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)

        let recordsViewController = viewController()
        recordsViewController.modalTransitionStyle = .coverVertical
        recordsViewController.modalPresentationStyle = .overCurrentContext

        navigationController.present(recordsViewController, animated: true, completion: nil)
    }

    // MARK: - FUNCTIONS
    private func viewController() -> RecordsViewController {
        let viewModel = RecordsViewModel()
        let viewController = RecordsViewController(with: viewModel)
        
        viewController.navigationDelegate = self
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overCurrentContext

        return viewController
    }
}

extension RecordsCoordinator: RecordsViewControllerNavigationDelegate {

    func didPressClose(in recordsViewController: RecordsViewController) {
        coordinatorDelegate?.coordinatorDidEnd(self)

        navigationController.dismiss(animated: true, completion: nil)
    }
}
