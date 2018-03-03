//
//  Localizable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 03/03/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol Localizable {
    var localizedString: String { get }
    var localizedFirstLetterUppercaseString: String { get }
    var localizedUppercaseString: String { get}
}
