//
//  RecordsViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol RecordsViewControllerNavigationDelegate: class {
    func didPressClose(in recordsViewController: RecordsViewController)
}

class RecordsViewController: UIViewController {

    // MARK: - PROPERTIES
    private let viewModel: RecordsViewModelRepresentable

    weak var navigationDelegate: RecordsViewControllerNavigationDelegate?

    // MARK: - INIT
    init(with viewModel: RecordsViewModelRepresentable) {
        self.viewModel = viewModel
        super.init(nibName: RecordsViewController.name, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
