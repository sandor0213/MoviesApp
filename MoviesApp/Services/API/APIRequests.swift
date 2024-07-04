//
//  APIRequests.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 01/07/2024.
//

import Foundation
import Alamofire

final class APIRequests {
    static func getMoviesPopular(completion: @escaping (Result<MoviesModel, Error>) -> Void) {
        APIService.request(apiPath: Constants.API.moviePopularPath, method: .get, parameters: [:], responseType: MoviesModel.self) { result in
            switch result {
            case .success(let moviesModel):
                StorageManager.shared.saveMoviesModel(moviesModel: moviesModel)
                completion(.success(moviesModel))
                
            case .failure(let error):
                if case NetworkError.noInternetConnection = error {
                    if let moviesModel = StorageManager.shared.fetchMoviesModel() {
                        completion(.success(moviesModel))
                    } else {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}
