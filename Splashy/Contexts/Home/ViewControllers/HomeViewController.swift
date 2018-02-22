//
//  HomeViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol HomeViewNavigationDelegate: class {
    func homeViewControllerDidPressPlay(_ homeViewController: HomeViewController)
}

class HomeViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet var actionButtons: [UIButton]!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var buttonsStackView: UIStackView!



    // MARK: - PROPERTIES
    var viewModel: HomeViewModel!
    weak var navigationDelegate: HomeViewNavigationDelegate?

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupBackground()
    }

    // MARK: - SETUP
    private func setupButtons() {
        let offset = buttonsStackView.bounds.size.height
        buttonsStackView.bounds.origin.y -= offset
        UIView.animate(withDuration: 0.66) { [weak self] in
            self?.buttonsStackView.bounds.origin.y += offset
        }

        actionButtons.forEach { button in
            button.roundedCorners()
            guard let index = actionButtons.index(of: button)?.hashValue else { return }
            button.isHidden = true
            UIView.animate(withDuration: 0.33, delay: 0.25*Double(index),
                           options: .curveEaseOut, animations: {
                button.isHidden = false
                button.layoutIfNeeded()
            }, completion: nil)
        }
    }

    private func setupBackground() {
        backgroundImageView.alpha = 0
        UIView.animate(withDuration: 1) { [weak self] in
            self?.backgroundImageView.alpha = 1
        }
    }

    // MARK: - ACTIONS
    @IBAction func playButtonAction(_ sender: UIButton) {
        self.navigationDelegate?.homeViewControllerDidPressPlay(self)
    }
}
