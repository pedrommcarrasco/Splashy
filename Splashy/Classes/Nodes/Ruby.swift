//
//  Ruby.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

struct Ruby {

    // MARK: - PROPERTIES
    let node: SKSpriteNode

    // MARK: - INIT
    init(in frame: CGRect) {
        self.node = SpriteFactory.sprite(of: .ruby, in: frame)
    }
}

