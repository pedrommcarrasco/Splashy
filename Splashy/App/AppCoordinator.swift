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

    private let navigator: NavigatorRepresentable

    internal var coordinators: [Coordinator] = []

    // MARK: - INITIALIZATION
    init(with window: UIWindow, navigator: NavigatorRepresentable) {
        window.rootViewController = navigator.root()
        window.makeKeyAndVisible()

        self.navigator = navigator
    }

    // MARK: - FUNCTIONS
    func start() {
        let homeCoordinator = HomeCoordinator(with: self.navigator)
        homeCoordinator.coordinatorDelegate = self
        homeCoordinator.start()
    }
}
