//
//  UIStackView+Hierarchy.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIStackView {
    
    public func addArrangedSubviews(_ views: UIView ...) {
        views.forEach { self.addArrangedSubview($0) }
    }
    
    public func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
