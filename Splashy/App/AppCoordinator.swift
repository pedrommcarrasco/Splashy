//
//  AppCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 22/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - PROPERTIES
    weak var coordinatorDelegate: CoordinatorDelegate?
    private let window: UIWindow
    private let navigationController: UINavigationController
    internal var coordinators: [Coordinator]

    // MARK: - INITIALIZATION
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.coordinators = []

        self.window.rootViewController = self.navigationController
    }

    // MARK: - FUNCTIONS
    func start() {

    }
}

extension AppCoordinator: CoordinatorDelegate {
    func didStartExecution(onCoordinator: Coordinator) {
        coordinators.append(onCoordinator)
    }

    func didFinishExecution(onCoordinator: Coordinator) {
        coordinators = coordinators.filter { $0 !== onCoordinator }
    }
}
