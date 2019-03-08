//
//  UIButton+Init.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UIButton {
    
    public convenience init(image: UIImage?) {
        self.init(frame: .zero)
        setImage(image, for: .normal)
    }
}
