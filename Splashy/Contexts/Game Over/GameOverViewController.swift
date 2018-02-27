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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - ENTRANCE
    private func animateEntrance() {
        if isFirstAppearance {
            gameOverView.bounds.origin.y -= 200

            UIView.animate(withDuration: AnimationDurations.normal.rawValue) { [weak self] in
                guard let `self` = self else { return }
                self.gameOverView.bounds.origin.y += 200
            }

            isFirstAppearance = false
        }
    }
}
