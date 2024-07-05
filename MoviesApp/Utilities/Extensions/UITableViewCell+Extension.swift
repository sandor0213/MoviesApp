//
//  UITableViewCell+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 05/07/2024.
//

import UIKit

extension UITableViewCell {
    func setupShadow() {
       contentView.layer.cornerRadius = 10
       contentView.layer.masksToBounds = false
       contentView.layer.shadowColor = UIColor.black.cgColor
       contentView.layer.shadowOpacity = 0.3
       contentView.layer.shadowOffset = CGSize(width: 0, height: 8)

       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOpacity = 0.2
       layer.shadowOffset = CGSize(width: 0, height: 8)
       layer.masksToBounds = false
   }
}
