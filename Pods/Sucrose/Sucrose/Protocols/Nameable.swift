//
//  Nameable.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 08/03/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

public protocol Nameable {
    static var name: String { get }
}

extension Nameable {
    
    public static var name: String {
        return String(describing: self)
    }
}
