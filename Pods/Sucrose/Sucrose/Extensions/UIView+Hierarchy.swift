//
//  UIView+Hierarchy.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIView {
    
    public func addSubviews(_ views: UIView ...) {
        views.forEach { self.addSubview($0) }
    }
    
    public func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
