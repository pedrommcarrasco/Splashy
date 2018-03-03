//
//  NibLoadable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 03/03/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

protocol NibLoadable {}

extension NibLoadable where Self: UIView {
    func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName:  String(describing: type(of: self)), bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
    }
}
