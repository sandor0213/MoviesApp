//
//  Reusable+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 05/07/2024.
//

import UIKit

public protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UIView: Reusable {}
