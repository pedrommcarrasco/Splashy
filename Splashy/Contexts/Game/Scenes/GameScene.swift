//
//  GameScene.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    // MARK : - SPRITES
    var ground = SpriteType.ground.asNode()
    var splashy = SpriteType.splashy.asNode()

    // MARK : - PROPERTIES
    var viewModel: GameSceneViewModel!

    // MARK : - LIFECYCLE
    override func didMove(to view: SKView) {
        setupGround()
        setupSplashy()
    }

    override func update(_ currentTime: TimeInterval) {

    }

    // MARK : - SETUP
    private func setupGround() {
        ground.setScale(SpriteType.ground.scale())
        ground.position = SpriteType.ground.position(in: frame, with: ground)
        addChild(ground)
    }

    private func setupSplashy() {
        splashy.setScale(SpriteType.splashy.scale())
        splashy.position = SpriteType.splashy.position(in: frame, with: splashy)
        addChild(splashy)
    }

    // MARK : - INTERACTION
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
