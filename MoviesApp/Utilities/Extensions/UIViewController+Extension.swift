//
//  UIViewController+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 05/07/2024.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround(cancelsTouchesInView: Bool = true) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelsTouchesInView
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
