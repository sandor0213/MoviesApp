//
//  ViewController.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 01/07/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIRequests.getMoviesPopular { result in
            switch result {
            case .success(let model):
                print("Movies: \(model)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

