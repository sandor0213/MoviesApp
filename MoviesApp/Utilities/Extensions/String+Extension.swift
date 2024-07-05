//
//  String+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import Foundation

extension String {
    func localized() -> String {
        if let path = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: Constants.Main.languageKey) ?? "en", ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        }
        return self
    }
}
