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

    func scale() -> CGFloat {
        switch self {
        case .ground:
            return 1.1
        default:
            return 0
        }
    }

    func position(in frame: CGRect, with sprite: SKSpriteNode) -> CGPoint {
        switch self {
        case .ground:
            return CGPoint(x: frame.width/2, y: 0 + sprite.frame.height/2)
        default:
            return .zero
        }
    }
}
