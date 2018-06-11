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
    var coordinators: [Coordinator] = []
    weak var coordinatorDelegate: CoordinatorDelegate?
    private let navigator: NavigatorRepresentable

    // MARK: - INIT
    init(with navigator: NavigatorRepresentable) {
        self.navigator = navigator
    }

    // MARK: - START
    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
        navigator.transition(to: viewController(), as: .modal)
    }

    // MARK: - FUNCTIONS
    private func viewController() -> RecordsViewController {
        let viewModel = RecordsViewModel(with: RecordsManager())
        let viewController = RecordsViewController(with: viewModel)
        
        viewController.navigationDelegate = self

        return viewController
    }
}

extension RecordsCoordinator: RecordsViewControllerNavigationDelegate {

    func didPressDismiss(in recordsViewController: RecordsViewController) {
        coordinatorDelegate?.coordinatorDidEnd(self)
        navigator.dismiss()
    }
}
