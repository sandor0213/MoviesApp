//
//  APIService.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 01/07/2024.
//

import Alamofire

enum NetworkError: Error {
    case noInternetConnection
}

final class APIService {
    typealias CompletionHandler<T: Decodable> = (Result<T, Error>) -> Void
    
    static func request<T: Decodable>( apiPath: String, method: HTTPMethod, parameters: [String: String]?, body: Data? = nil, responseType: T.Type, completion: @escaping CompletionHandler<T>) {
        ProgressHUD.show()
        guard NetworkReachabilityManager.shared.isReachable else {
            ProgressHUD.dismiss()
            completion(.failure(NetworkError.noInternetConnection))
            return
        }
        
        let urlString = Constants.API.baseURL + apiPath
        guard let url = URL(string: urlString) else {
            ProgressHUD.dismiss()
            completion(.failure(AFError.invalidURL(url: urlString)))
            return
        }
        
        var allParameters = parameters ?? [:]
        allParameters[Constants.API.apiKeyName] = Constants.API.apiKey
        
        do {
            var urlRequest = try URLRequest(url: url, method: method)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: allParameters)
            urlRequest.httpBody = method == .get ? nil : body
            
            AF.request(urlRequest)
                .validate()
                .responseDecodable(of: responseType) { response in
                    ProgressHUD.dismiss()
                    switch response.result {
                    case .success(let decodedResponse):
                        completion(.success(decodedResponse))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        } catch {
            ProgressHUD.dismiss()
            completion(.failure(AFError.createURLRequestFailed(error: error)))
        }
    }
}
