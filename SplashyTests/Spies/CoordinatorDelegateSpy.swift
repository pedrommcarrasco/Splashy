//
//  CoordinatorDelegateSpy.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 18/05/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class CoordinatorDelegateSpy: Coordinator {

    var coordinators: [Coordinator] = []
    var coordinatorDelegate: CoordinatorDelegate?

    func start() {}

    // MARK: - PROPERTIES
    var expectation: XCTestExpectation?
}

// MARK: - CoordinatorDelegate
extension CoordinatorDelegateSpy: CoordinatorDelegate {

    func coordinatorDidStart(_ coordinator: Coordinator) {
        coordinators.append(coordinator)
        evaluateCall(expectation: expectation)
    }

    func coordinatorDidEnd(_ coordinator: Coordinator) {
        coordinators = coordinators.filter { $0 !== coordinator }
        evaluateCall(expectation: expectation)
    }
}

// MARK: - SimpleDelegatableSpy
extension CoordinatorDelegateSpy: SimpleDelegatableSpy {}
