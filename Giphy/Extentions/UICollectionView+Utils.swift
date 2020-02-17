//
//  UICollectionView+Utils.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func dequeReusableCell<T>(indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
            else { fatalError("not able to dequeue cell") }
        return cell
    }

    func register(_ klass: AnyClass, identifier: String? = nil) {
        let nibName = String(describing: klass.self)
        let identifier = identifier ?? nibName
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }

    func cellAt<T>(indexPath: IndexPath) -> T {
        guard let cell = cellForItem(at: indexPath) as? T
            else { fatalError("not able to optain cell") }
        return cell
    }
}
