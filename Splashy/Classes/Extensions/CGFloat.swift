//
//  CGFloat.swift
//  Splashy
//
//  Created by Pedro Carrasco on 26/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }

    static func randomBetween(min: CGFloat, and max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}
