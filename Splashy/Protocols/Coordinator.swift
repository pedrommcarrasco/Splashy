//
//  Coordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 22/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol Coordinator: class {

    // MARK: - PROPERTIES
    weak var coordinatorDelegate: CoordinatorDelegate? { get set }
    var coordinators: [Coordinator] { get set }

    // MARK: - FUNCTIONS
    func start()
}

protocol CoordinatorDelegate: class {
    func coordinatorDidStart(_ coordinator: Coordinator)
    func coordinatorDidEnd(_ coordinator: Coordinator)
}
