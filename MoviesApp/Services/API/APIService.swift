//
//  APIService.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 01/07/2024.
//

import Alamofire

final class APIService {
    typealias CompletionHandler<T: Decodable> = (Result<T, AFError>) -> Void
    
    static func request<T: Decodable>( apiPath: String, method: HTTPMethod, parameters: [String: String]?, body: Data? = nil, responseType: T.Type, completion: @escaping CompletionHandler<T>) {
        let urlString = Constants.API.baseURL + apiPath
        guard let url = URL(string: urlString) else {
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
                    switch response.result {
                    case .success(let decodedResponse):
                        
                        // TODO: Store model in storage
                        
                        completion(.success(decodedResponse))
                    case .failure(let error):
                        
                        // TODO: Fetch model from storage
                        
                        completion(.failure(error))
                    }
                }
        } catch {
            
            // TODO: Fetch model from storage
            
            completion(.failure(AFError.createURLRequestFailed(error: error)))
        }
    }
}
