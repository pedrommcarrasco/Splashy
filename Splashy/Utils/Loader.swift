//
//  Loader.swift
//  Splashy
//
//  Created by Pedro Carrasco on 31/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

enum LoadType {
    case splashyJump
}

struct Loader {
    static func load(texture type: LoadType) -> [SKTexture] {
        switch type{
        case .splashyJump:
            return splashyJump()
        }
    }

    private static func splashyJump() -> [SKTexture] {
        var textureArray = [SKTexture]()
        for index in 1 ... 9 {
            let textureName = "jump\(index)"
            let texture = SKTexture(imageNamed: textureName)
            textureArray.append(texture)
        }

        return textureArray
    }
}
