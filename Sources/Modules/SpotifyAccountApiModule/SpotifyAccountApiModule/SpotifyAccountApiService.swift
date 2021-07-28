//
//  SpotifyAccountApiService.swift
//  SpotifyAccountApiModule
//
//  Created by Christian Slanzi on 28.07.21.
//

import NetworkingService

public protocol SpotifyAccountApiService {
    typealias ServiceError = NetworkingServiceError
    
    typealias TokenResult = Swift.Result<AccessTokenDTO, ServiceError>

    func getApiToken(completion: @escaping (TokenResult) -> Void)
}
