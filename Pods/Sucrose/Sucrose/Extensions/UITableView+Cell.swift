//
//  UITableView+Cell.swift
//  Sucrose
//
//  Created by Pedro Carrasco on 14/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

extension UITableView {

    public func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.name)
    }

    public func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath, as type: T.Type) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.name, for: indexPath) as? T else {
            fatalError("Unknown Cell at \(indexPath)")
        }

        return cell
    }
}
