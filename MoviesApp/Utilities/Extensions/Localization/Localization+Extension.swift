//
//  Localization+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import UIKit

extension UIViewController {
    func localizeStoryboardTitle() {
        if let titleKey = title {
            title = titleKey.localized()
        }
    }
    
    func localizeNavigationItemTitle() {
        if let titleKey = navigationItem.title {
            navigationItem.title = titleKey.localized()
        }
    }
}

extension UILabel {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let textValue = self.text {
            minimumScaleFactor = 0.5
            self.text = textValue.localized()
        }
    }
    
    open var localizedText: String {
        get {
            return text?.localized() ?? ""
        }
        set(value) {
            minimumScaleFactor = 0.5
            self.text = value.localized()
        }
    }
}

extension UIButton {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let text = self.title(for: self.state) {
            self.setTitle(text.localized(), for: self.state)
        }
    }
    
    func setLocalizedTitle(_ title: String?, for state: UIControl.State) {
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.setTitle(title?.localized() ?? "", for: state)
    }
}


extension UITextField {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let placeHolderValue = self.placeholder {
            self.placeholder = placeHolderValue.localized()
        }
    }
}

extension UITextView {
    open var localizedText: String {
        get {
            return text?.localized() ?? ""
        }
        set(value) {
            self.text = value.localized()
        }
    }
}
