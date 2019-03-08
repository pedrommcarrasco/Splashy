//
//  Weak.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

public final class Weak<T> where T: AnyObject {
    
    private(set) weak var value: T?
    
    public init(value: T?) {
        self.value = value
    }
}
