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

    // MARK : - PROPERTIES
    var viewModel: GameSceneViewModel!

    // MARK : - LIFECYCLE
    override func didMove(to view: SKView) {
        setupGround()
    }

    override func update(_ currentTime: TimeInterval) {

    }

    // MARK : - SETUP
    private func setupGround() {
        ground.setScale(SpriteType.ground.scale())
        ground.position = SpriteType.ground.position(in: frame, with: ground)
        addChild(ground)
    }


    // MARK : - INTERACTION
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
