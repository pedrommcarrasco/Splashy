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
   private let navigator: NavigatorRepresentable

   weak var coordinatorDelegate: CoordinatorDelegate?

   internal var coordinators: [Coordinator] = []

   // MARK: - INIT
   init(with navigator: NavigatorRepresentable) {

      self.navigator = navigator
   }

   // MARK: - START
   func start() {
      coordinatorDelegate?.coordinatorDidStart(self)
      navigator.transition(to: viewController(), as: .push)
   }

   // MARK: - FUNCTIONS
   private func viewController() -> HomeViewController {
      let viewModel = HomeViewModel()
      let viewController = HomeViewController(with: viewModel)
      viewController.navigationDelegate = self

      return viewController
   }
}

extension HomeCoordinator: HomeViewNavigationDelegate {
   func didPressPlay(in homeViewController: HomeViewController) {
      let gameCoordinator = GameCoordinator(with: navigator)
      gameCoordinator.coordinatorDelegate = self
      gameCoordinator.start()
   }
}
