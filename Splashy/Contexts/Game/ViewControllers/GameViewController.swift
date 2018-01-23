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
    @IBOutlet weak var spriteKitView: SKView!

    // MARK : - PROPERTIES
    var viewModel: GameViewModel!

    // MARK : - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpriteKitView()
    }

    // MARK : - SETUP
    private func setupSpriteKitView() {
        let scene = GameScene(size: spriteKitView.bounds.size)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = CGPoint(x: 0, y: 0)

        spriteKitView.presentScene(scene)
    }
}
