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
    
    func roundedCorners() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(Sizes.cornerRadius)
    }

}
