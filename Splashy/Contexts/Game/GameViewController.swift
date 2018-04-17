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

protocol GameViewControllerNavigation: class {
    func gameViewController(_ gameViewController: GameViewController, didEndGameWith points: Int)
}

class GameViewController: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet private weak var spriteKitView: SKView!
    @IBOutlet private weak var scoreView: ScoreView!
    
    // MARK: - PROPERTIES
    weak var navigationDelegate: GameViewControllerNavigation?
    
    private var viewModel: GameViewModel? {
        didSet {
            viewModel?.score.bind(observer: { [weak self] in
                guard let scoreView = self?.scoreView else { return }
                scoreView.score = $0
            })
        }
    }
    private var scene: GameScene?
    
    // MARK: - INIT
    init(with viewModel: GameViewModel) {
        defer {
            self.viewModel = viewModel
            self.scene = GameScene(with: .zero, and: viewModel)
        }
        
        super.init(nibName: GameViewController.name, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpriteKitView()
    }
    
    // MARK: - SETUP
    private func setupSpriteKitView() {
        guard let scene = scene else { return }
        
        scene.size = spriteKitView.bounds.size
        scene.scaleMode = .aspectFill
        scene.anchorPoint = CGPoint(x: 0, y: 0)

        scene.sceneDelegate = self
        
        spriteKitView.showsFPS = true
        
        spriteKitView.presentScene(scene)
    }
    
    // MARK: - GAME LIFECYCLE
    func restart() {
        scene?.restart()
    }
}

extension GameViewController: GameSceneDelegate {
    func gameSceneDidEnd(_ gameScene: GameScene) {
        navigationDelegate?.gameViewController(self, didEndGameWith: 0)
    }
}
