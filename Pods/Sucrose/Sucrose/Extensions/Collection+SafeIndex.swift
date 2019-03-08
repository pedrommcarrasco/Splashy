//
//  Collection+SafeIndex.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

extension Collection {
    
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
