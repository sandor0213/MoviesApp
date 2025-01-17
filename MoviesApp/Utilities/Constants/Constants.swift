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
        static let baseImageURL: (_ path: String) -> String = { "http://image.tmdb.org/t/p/w500\($0)" }
        static let apiKey = "28516947e951b3148ced8d0b2c5d16bb"
        static let apiKeyName = "api_key"
        
        static let moviePopularPath = "movie/popular"
        static let genreMovieListPath = "genre/movie/list"
        static let movieDetailsPath = "movie/"
    }
    
    struct PersistentContainer {
        static let persistentContainerName = "MoviesApp"
    }
    
    struct Main {
        static let languageKey = "language"
    }
}
