//
//  UIView+Shape.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 14/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIView {

    public func asCircle() {
        layer.cornerRadius = min(frame.size.height, frame.size.width) / 2.0
        layer.masksToBounds = true
    }
}
