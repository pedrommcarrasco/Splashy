//
//  GameViewController.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit
import UIKit
import SceneKit

class GameViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet private weak var spriteKitView: SKView!
    @IBOutlet private weak var scoreLabel: UILabel!

    // MARK: - PROPERTIES
    var viewModel: GameViewModel! {
        didSet {
            viewModel.score.bind(observer: { [weak self] in
                guard let scoreLabel = self?.scoreLabel else { return }
                scoreLabel.text = "\($0)"
            })
        }
    }
    private var scene = GameScene()

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpriteKitView()
    }

    // MARK: - SETUP
    private func setupSpriteKitView() {
        scene = GameScene(size: spriteKitView.bounds.size)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = CGPoint(x: 0, y: 0)

        scene.viewModel = viewModel
        spriteKitView.showsFPS = true

        spriteKitView.presentScene(scene)
    }

    // MARK: - TEST
    @IBAction func restartButtonAction(_ sender: UIButton) {
        scene.restart()
    }
}
