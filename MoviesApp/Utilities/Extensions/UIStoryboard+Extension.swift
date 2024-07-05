//
//  UIStoryboard+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import UIKit

extension UIStoryboard {
    enum Item: String {
        case main = "Main"
    }
    
    enum ControllerIdentifier: String {
        // Main
        case moviesViewController = "MoviesViewController"
        case movieDetailViewController = "MovieDetailViewController"
    }
    
    static func controller<T: UIViewController>(_ storyboard: Item, type: T.Type? = nil, identifier: ControllerIdentifier? = nil) -> T {
        let initialViewController = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: identifier == nil ? String(describing: type.self) : identifier!.rawValue) as! T
        return initialViewController
    }
}
