//
//  Randomizable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 03/03/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol Randomizable {
    static func random() -> CGFloat
    static func randomBetween(min: CGFloat, and max: CGFloat) -> CGFloat
}
