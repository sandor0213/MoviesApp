//
//  APIRequests.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 01/07/2024.
//

import Foundation
import Alamofire

final class APIRequests {
    static func getMoviesPopular(completion: @escaping (Result<MoviesModel, AFError>) -> Void) {
        APIService.request(
            apiPath: Constants.API.moviePopularPath,
            method: .get,
            parameters: [:],
            responseType: MoviesModel.self,
            completion: completion
        )
    }
}
