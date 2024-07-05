//
//  ProgressHUD.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import SVProgressHUD

final class ProgressHUD {
    
    static func configure() {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setBackgroundColor(UIColor.gray)
    }
    
    static func show() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    static func dismiss() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
