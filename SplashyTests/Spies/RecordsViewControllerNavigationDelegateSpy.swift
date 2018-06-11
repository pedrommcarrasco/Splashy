//
//  RecordsViewControllerNavigationDelegateSpy.swift
//  SplashyTests
//
//  Created by Pedro Carrasco on 11/06/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import XCTest
@testable import Splashy

class RecordsViewControllerNavigationDelegateSpy: SimpleDelegatableSpy {
    
    // MARK: - PROPERTIES
    var expectation: XCTestExpectation?
}

// MARK: - GameoverViewControllerNavigationDelegate
extension RecordsViewControllerNavigationDelegateSpy: RecordsViewControllerNavigationDelegate {
    func didPressDismiss(in recordsViewController: RecordsViewController) {
        evaluateCall(expectation: expectation)
    }
}
