//
//  Kingfisher+String+Extension.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 05/07/2024.
//

import UIKit
import Kingfisher

extension String {
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: self) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                completion(value.image)
            case .failure(let error):
                print("Error downloading image: \(error)")
                completion(nil)
            }
        }
    }
}
