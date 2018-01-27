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
    
    var observer: Observer?
    
    func bind(observer: Observer?) {
        self.observer = observer
    }
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
