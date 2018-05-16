//
//  AppDelegate.swift
//  Splashy
//
//  Created by Pedro Carrasco on 22/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Coordinator
        setupCoordinator()

        return true
    }
}

// MARK: - Private
private extension AppDelegate {

    // MARK: PROPERTIES
    var navigationController: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true

        return navigationController
    }

    // MARK: COORDINATOR
    func setupCoordinator() {

        window = UIWindow()
        guard let window = window else { return }

        let navigator = Navigator(with: navigationController)
        appCoordinator = AppCoordinator(with: window, navigator: navigator)
        appCoordinator.start()
        window.makeKeyAndVisible()
    }
}

