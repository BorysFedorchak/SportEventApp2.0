//
//  Extensions.swift
//  SportEventApp2.0
//
//  Created by borys on 18.08.2024.
//

import Foundation
import UIKit

// MARK: - UITableViewCell

extension UITableViewCell {
    static func identifier() -> String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier(), bundle: nil)
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    static func identifier() -> String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier(), bundle: nil)
    }
}

