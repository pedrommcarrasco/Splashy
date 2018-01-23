//
//  String.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

extension String {

    public var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }

    public var localizedFirstLetterUppercaseString: String {
        return localizedString.capitalized
    }

    public var localizedUppercaseString: String {
        return localizedString.uppercased()
    }

}
