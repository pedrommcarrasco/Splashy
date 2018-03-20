//
//  GameOverView.swift
//  Splashy
//
//  Created by Pedro Carrasco on 27/02/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class GameOverView: UIView {

    // MARK: - OUTLETS
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var retryButton: StandardButton!
    @IBOutlet weak var recordButton: StandardButton!
    @IBOutlet weak var tutorialButton: StandardButton!

    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        initContent()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        initContent()
    }

    private func initContent() {
        containerView.roundedCorners()
        retryButton.image = #imageLiteral(resourceName: "btn-retry")
        recordButton.image = #imageLiteral(resourceName: "btn-record")
        tutorialButton.image = #imageLiteral(resourceName: "btn-tutorial")
    }
}
