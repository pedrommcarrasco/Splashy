//
//  Bindable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 27/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

class Bindable<T> {
    typealias Observer = (T) -> ()

    // MARK: - PROPERTIES
    var observer: Observer?
    var value: T {
        didSet {
            observer?(value)
        }
    }

    // MARK: - INITIALIZATION
    init(_ value: T) {
        self.value = value
    }

    // MARK: - FUNCTIONS
    func bind(observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
}
