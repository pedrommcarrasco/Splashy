//
//  HomeCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {

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
   private func viewController() -> HomeViewController {
      let viewController = HomeViewController()

      let viewModel = HomeViewModel()
      viewController.viewModel = viewModel
      viewController.navigationDelegate = self

      return viewController
   }
}

extension HomeCoordinator: HomeViewNavigationDelegate {
   func homeViewControllerDidPressPlay(_ homeViewController: HomeViewController) {
      let gameCoordinator = GameCoordinator(navigationController: navigationController)
      gameCoordinator.coordinatorDelegate = self
      gameCoordinator.start()
   }
}

extension HomeCoordinator: CoordinatorDelegate {
   func coordinatorDidStart(_ coordinator: Coordinator) {
      coordinators.append(coordinator)
   }

   func coordinatorDidEnd(_ coordinator: Coordinator) {
      coordinators = coordinators.filter { $0 !== coordinator }
   }
}
