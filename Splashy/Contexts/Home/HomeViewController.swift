//
//  HomeViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit
import Sucrose

protocol HomeViewNavigationDelegate: class {
    func didPressPlay(in homeViewController: HomeViewController)
	func didPressRecords(in homeViewController: HomeViewController)
}

class HomeViewController: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet private weak var playButton: StandardButton!
    @IBOutlet private weak var recordsButton: StandardButton!
    @IBOutlet private var actionButtons: [StandardButton]!
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var buttonsStackView: UIStackView!
    
    // MARK: - PROPERTIES
    weak var navigationDelegate: HomeViewNavigationDelegate?

	// MARK: - PRIVATE PROPERTIES
	private var viewModel: HomeViewModelRepresentable

    // MARK: - INIT
    init(with viewModel: HomeViewModelRepresentable) {
        self.viewModel = viewModel

        super.init(nibName: HomeViewController.name, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - SETUP
    private func setup() {
        setupActionsStackView()
        setupButtons()
        setupBackground()
    }
    
    private func setupActionsStackView() {
        let offset = buttonsStackView.bounds.size.height
        buttonsStackView.bounds.origin.y -= offset
		
        UIView.animate(withDuration: AnimationDurations.normal.rawValue) { [weak self] in
            self?.buttonsStackView.bounds.origin.y += offset
        }
    }
    
    private func setupButtons() {
		playButton.configureImage(with: viewModel.playImage)
		recordsButton.configureImage(with: viewModel.recordImage)
		
        actionButtons.forEach { [weak self] button in
            self?.animate(button: button)
        }
    }
    
    private func animate(button: StandardButton) {
		guard let index = actionButtons.index(of: button) else { return }

		button.alpha = 0
		button.isHidden = false
		
		let scaleProportion = AnimationStyling.Scale.high.rawValue
		button.transform = CGAffineTransform(scaleX: scaleProportion, y: scaleProportion)
		
		UIView.animate(withDuration: AnimationDurations.short.rawValue,
                       delay: delayForButton(at: index),
                       options: .curveEaseOut, animations: {
						
						button.alpha = 1
						button.transform = CGAffineTransform.identity
                        button.layoutIfNeeded()

        }, completion: nil)
    }
    
    private func setupBackground() {
        backgroundImageView.alpha = 0
        UIView.animate(withDuration: AnimationDurations.long.rawValue) { [weak self] in
            self?.backgroundImageView.alpha = 1
        }
    }
    
    // MARK: - HELPER FUNCTIONS
    private func delayForButton(at index: Int) -> Double {
        return AnimationsDelay.short.rawValue*Double(index)
    }
    
    // MARK: - ACTIONS
    @IBAction func playButtonAction(_ sender: StandardButton) {
		navigationDelegate?.didPressPlay(in: self)
    }

    @IBAction func recordsButtonAction(_ sender: StandardButton) {
        navigationDelegate?.didPressRecords(in: self)
    }
}
