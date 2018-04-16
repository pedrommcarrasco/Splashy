//
//  BoostType.swift
//  Splashy
//
//  Created by Pedro Carrasco on 16/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

enum BoostType: Int {
    case none = 1
    case double
    case triple
    case quadruple
    case quintuple
    
    func toString() -> String {
        return "x\(self.rawValue)"
    }
}
