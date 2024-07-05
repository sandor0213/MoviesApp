//
//  UIImage+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 05/07/2024.
//

import UIKit

extension UIImage {
    var aspectRatio: CGFloat {
        return size.width / size.height
    }
}
