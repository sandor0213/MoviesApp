//
//  Constants.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 01/07/2024.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "https://api.themoviedb.org/3/"
        static let apiKey = "28516947e951b3148ced8d0b2c5d16bb"
        static let apiKeyName = "api_key"
        
        static let moviePopularPath = "movie/popular"
    }
    
    struct PersistentContainer {
        static let persistentContainerName = "MoviesApp"
    }
    
    struct Main {
        static let languageKey = "language"
    }
}
