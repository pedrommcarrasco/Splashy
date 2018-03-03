//
//  GameOverViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var gameOverView: GameOverView!

    // MARK: - PROPERTIES
    private var isFirstAppearance = true
    private var viewModel: GameOverViewModel

    // MARK: - INIT
    init(with viewModel: GameOverViewModel) {
        self.viewModel = viewModel
        super.init(nibName: GameOverViewController.name, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
