//
//  Navigator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 16/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol NavigatorRepresentable {
    func root() -> UINavigationController
    func transition(to viewController: UIViewController, as type: NavigatorTransitionType)
    func dismiss()
    func pop()
}

struct Navigator: NavigatorRepresentable {

    // MARK: - Private Properties
    private var navigationController: UINavigationController

    // MARK: - Init
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Publoc Navigation Functions
    func root() -> UINavigationController {
        return navigationController
    }

    func transition(to viewController: UIViewController, as type: NavigatorTransitionType) {
        switch type {
        case .root:
            navigationController.viewControllers = [viewController]
        case .push:
            navigationController.pushViewController(viewController, animated: true)
        case .modal:
            navigationController.present(viewController, animated: true, completion: nil)
        }
    }

    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }
}
