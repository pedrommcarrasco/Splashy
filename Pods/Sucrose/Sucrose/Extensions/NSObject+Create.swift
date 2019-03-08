//
//  NSObject+Create.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

extension NSObject {
    
    public static func create<T>(_ setup: (T) -> Void) -> T where T: NSObject {
        let object = T()
        setup(object)
        return object
    }
}
