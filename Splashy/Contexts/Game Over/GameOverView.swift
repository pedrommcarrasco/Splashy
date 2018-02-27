//
//  GameOverView.swift
//  Splashy
//
//  Created by Pedro Carrasco on 27/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class GameOverView: UIView {

    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    // MARK: - SETUP
}
