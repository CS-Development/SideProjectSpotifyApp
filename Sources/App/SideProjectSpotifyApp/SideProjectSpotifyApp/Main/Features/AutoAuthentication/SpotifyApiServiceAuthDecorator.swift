//
//  SpotifyApiServiceAuthDecorator.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 30.07.21.
//

import SpotifyApiModule
import SpotifyAccountApiModule
import NetworkingService

class SpotifyApiServiceAuthDecorator: SpotifyApiService {
    
    var service: SpotifyApiService
    var authService: SpotifyAccountApiService
    
    internal init(service: SpotifyApiService, authService: SpotifyAccountApiService) {
        self.service = service
        self.authService = authService
    }
    
    func setAccessToken(_ token: SpotifyApiModule.AccessTokenDTO) {
        service.setAccessToken(token)
    }
    
    func getAllNewReleases(completion: @escaping (SearchResult) -> Void) {
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            self.getAllNewReleases(completion: completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
    
    func getAllCategories(completion: @escaping (SearchCategoriesResult) -> Void) {
        service.getAllCategories { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            self.getAllCategories(completion: completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
    
    func getAllFeaturedPlaylists(completion: @escaping (SearchPlaylistsResult) -> Void) {
        service.getAllFeaturedPlaylists { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            self.getAllFeaturedPlaylists(completion: completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
}
