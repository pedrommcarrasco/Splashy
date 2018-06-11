//
//  RecordsViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 19/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol RecordsViewControllerNavigationDelegate: class {
    func didPressDismiss(in recordsViewController: RecordsViewController)
}

class RecordsViewController: UIViewController {

    // NARK: - OUTLETS
    @IBOutlet weak var recordsViewContainer: UIView!

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

        let r = RecordsView(with: viewModel)
        recordsViewContainer.addSubview(r)
        r.constrictEdgesToSuperview()
        r.delegate = self
    }
}

extension RecordsViewController: RecordsViewDelegate {
    func didPressDismiss(in gameoverView: RecordsView) {
        navigationDelegate?.didPressDismiss(in: self)
    }
}
