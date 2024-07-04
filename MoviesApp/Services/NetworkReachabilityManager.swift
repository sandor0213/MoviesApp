//
//  NetworkReachabilityManager.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import Alamofire

final class NetworkReachabilityManager {
    static let shared = NetworkReachabilityManager()

    private let reachabilityManager = Alamofire.NetworkReachabilityManager()

    private init() {}

    var isReachable: Bool {
        return reachabilityManager?.isReachable ?? false
    }
}
