//
//  SpriteType.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

enum SpriteType: String {
    case splashy = "character-main"
    case enemy = "character-enemy"
    case ground = "ground"
}

extension SpriteType {
    func asNode() -> SKSpriteNode {
        return SKSpriteNode(imageNamed: self.rawValue)
    }
}
