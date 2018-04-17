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
    @IBOutlet private weak var scoreViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - PROPERTIES
    weak var navigationDelegate: GameViewControllerNavigation?
    
    private var viewModel: GameViewModel? {
        didSet {
            viewModel?.score.bind(observer: { [weak self] in
                guard let scoreView = self?.scoreView else { return }
                scoreView.score = $0
            })
            
            viewModel?.boost.bind(observer: { [weak self] in
                guard let scoreView = self?.scoreView else { return }
                scoreView.boost = $0
            })
        }
    }
    
    private var scene: GameScene?
    
    // MARK: - CONSTANTS
    private enum Constants{
        static let scoreViewAppearingTopConstraintToAdd: CGFloat = 100
        static let scoreViewDisappearingTopConstraintToAdd: CGFloat = -100
    }
    
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
        
        #if DEBUG
            spriteKitView.showsFPS = true
        #endif
        
        spriteKitView.presentScene(scene)
    }
    
    // MARK: - GAME LIFECYCLE
    func restart() {
        animateScore(with: .appearing)
        scene?.restart()
    }
    
    // MARK: - ANIMATION
    private func animateScore(with type: AnimationType) {
        let valueToAdd: CGFloat
        
        switch type {
        case .appearing:
            valueToAdd = Constants.scoreViewAppearingTopConstraintToAdd
        case .disappearing:
            valueToAdd = Constants.scoreViewDisappearingTopConstraintToAdd
        }
        
        UIView.animate(withDuration: AnimationDurations.short.rawValue) { [weak self] in
            self?.scoreViewTopConstraint.constant += valueToAdd
            self?.view.layoutIfNeeded()
        }
    }
}

extension GameViewController: GameSceneDelegate {    
    func gameSceneDidEnd(_ gameScene: GameScene) {
        animateScore(with: .disappearing)
        navigationDelegate?.gameViewController(self, didEndGameWith: 0)
    }
}
