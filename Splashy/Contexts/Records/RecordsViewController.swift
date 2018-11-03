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
    weak var navigationDelegate: RecordsViewControllerNavigationDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    private let viewModel: RecordsViewModelRepresentable

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
        setupRecordsView()
    }
    
    private func setupRecordsView() {
        let recordsView = RecordsView(with: viewModel)
        recordsViewContainer.addSubview(recordsView)
        recordsView.constrictEdges(to: self)
        recordsView.delegate = self
    }
}

extension RecordsViewController: RecordsViewDelegate {
    func didPressDismiss(in gameoverView: RecordsView) {
        navigationDelegate?.didPressDismiss(in: self)
    }
}
