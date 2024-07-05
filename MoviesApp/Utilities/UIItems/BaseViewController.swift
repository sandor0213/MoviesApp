//
//  BaseViewController.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Bundle.setLanguage(UserDefaults.standard.string(forKey: Constants.Main.languageKey) ?? "en")
        localizeStoryboardTitle()
        localizeNavigationItemTitle()
    }
}
