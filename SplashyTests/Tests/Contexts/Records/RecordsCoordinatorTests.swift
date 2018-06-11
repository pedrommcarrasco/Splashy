//
//  RecordsCoordinatorTests.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 11/06/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class RecordsCoordinatorTests: XCTestCase {
    
    // MARK: - PROPERTIES
    var coordinator: RecordsCoordinator!
    var navigator: NavigatorRepresentable!
    var viewController: RecordsViewController!
    var navigationController: NavigationControllerMock!
    
    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()
        
        navigationController = NavigationControllerMock()
        navigator = Navigator(with: navigationController)
        
        let viewModel = RecordsViewModelMock()
        viewController = RecordsViewController(with: viewModel)
        
        coordinator = RecordsCoordinator(with: navigator)
        coordinator.start()
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewController = nil
        navigator = nil
        coordinator = nil
    }
    
    // MARK: - TEST: start()
    func testStart() {
        XCTAssertTrue(navigationController.wasPresent)
    }
    
    // MARK: - TEST: didPressDismiss(in recordsViewController: RecordsViewController)
    func testDidPressRetry() {
        coordinator.didPressDismiss(in: viewController)
        XCTAssertTrue(navigationController.wasDismiss)
    }
}
