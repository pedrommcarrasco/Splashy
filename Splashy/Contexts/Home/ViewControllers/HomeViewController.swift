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

   // MARK : - OUTLETS
   @IBOutlet weak var playButton: UIButton!

   // MARK : - PROPERTIES
   var viewModel: HomeViewModel!
   weak var navigationDelegate: HomeViewNavigationDelegate?

   // MARK : - LIFECYCLE
   override func viewDidLoad() {
      super.viewDidLoad()
      setupButtons()
   }

   // MARK : - SETUP
   private func setupButtons() {
      playButton.roundedCorners()
      playButton.setTitle(viewModel.playButtonText, for: .normal)
   }

   // MARK : - ACTIONS
   @IBAction func playButtonAction(_ sender: UIButton) {
      self.navigationDelegate?.homeViewControllerDidPressPlay(self)
   }
}
