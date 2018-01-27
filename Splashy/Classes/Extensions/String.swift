//
//  String.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

extension String {

    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }

    var localizedFirstLetterUppercaseString: String {
        return localizedString.capitalized
    }

    var localizedUppercaseString: String {
        return localizedString.uppercased()
    }

}
