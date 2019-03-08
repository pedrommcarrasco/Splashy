//
//  OptionalString+Unwrap.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

public protocol OptionalString {}
extension String: OptionalString {}
public extension Optional where Wrapped: OptionalString {
    
    public var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}
