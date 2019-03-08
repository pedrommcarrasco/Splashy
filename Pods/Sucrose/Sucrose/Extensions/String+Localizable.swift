//
//  String+Localizable.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 09/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

extension String {
    
    public var localized: String { return NSLocalizedString(self, comment: "") }
}
