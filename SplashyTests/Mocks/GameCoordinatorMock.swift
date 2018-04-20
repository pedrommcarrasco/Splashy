//
//  SecondCoordinatorMock.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 20/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
@testable import Splashy

class GameCoordinatorMock: Coordinator {
    var coordinatorDelegate: CoordinatorDelegate?
    var coordinators: [Coordinator] = []

    func start() {
        coordinatorDelegate?.coordinatorDidStart(self)
    }
}
