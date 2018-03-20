//
//  Roundable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol Roundable {}

extension Roundable where Self: UIView {

    func asCircle() {
        layer.masksToBounds = true
        layer.cornerRadius = bounds.width/2
    }

    func roundedCorners() {
        clipsToBounds = true
        layer.cornerRadius = CGFloat(Sizes.cornerRadius)
    }

}
