//
//  StandardButton.swift
//  Splashy
//
//  Created by Pedro Carrasco on 20/03/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class StandardButton: UIButton {
    
    // MARK: - PROPERTIES
    var image: UIImage? {
        didSet {
            self.setImage(image, for: .normal)
        }
    }
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initContent()
    }
    
    private func initContent() {
        asCircle()
        addVisualEffectView()
    }
    
    // MARK: - PUBLIC
    func configureImage(with name: String) {
        guard let image = UIImage(named: name) else { return }
        self.image = image
    }
    
    // MARK: - PRIVATE
    private func addVisualEffectView() {
        guard let imageView = imageView else { return }
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.isUserInteractionEnabled = false
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(visualEffectView, belowSubview: imageView)
        
        NSLayoutConstraint.activate(
            [visualEffectView.topAnchor.constraint(equalTo: self.topAnchor),
             visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             visualEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             visualEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor)]
        )
        
    }
}
