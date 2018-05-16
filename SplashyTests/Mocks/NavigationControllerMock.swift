//
//  NavigationControllerMock.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 16/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit
@testable import Splashy

class NavigationControllerMock: UINavigationController {

    // MARK: - PUBLIC PROPERTIES
    var wasRoot = false
    var wasPush = false
    var wasPresent = false
    var wasDismiss = false
    var wasPop = false

    // MARK: - PRIVATE PROPERTIES
    var actualViewController: UIViewController?

    // MARK: - PUBLIC FUNCTIONS
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        actualViewController = viewControllers.first
        wasRoot = true
        super.setViewControllers(viewControllers, animated: animated)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        actualViewController = viewController
        wasPush = true
        super.pushViewController(viewController, animated: animated)
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        actualViewController = viewControllerToPresent
        wasPresent = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        wasDismiss = true
        super.dismiss(animated: flag, completion: completion)
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        wasPop = true
        return super.popViewController(animated: animated)
    }
}
