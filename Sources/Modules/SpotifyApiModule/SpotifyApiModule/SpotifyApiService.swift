//
//  SpotifyApiService.swift
//  SpotifyApiModule
//
//  Created by Christian Slanzi on 19.07.21.
//

import NetworkingService

public protocol SpotifyApiService {
    typealias ServiceError = NetworkingServiceError
    
    typealias SearchResult = Swift.Result<AlbumsAnswerDTO, ServiceError>

    //func setAccessToken(_ token: AccessTokenDTO)
    func getAllNewReleases(completion: @escaping (SearchResult) -> Void)
    
    
    typealias SearchCategoriesResult = Swift.Result<CategoriesAnswerDTO, ServiceError>
    
    func getAllCategories(completion: @escaping (SearchCategoriesResult) -> Void)
    
    
    typealias SearchPlaylistsResult = Swift.Result<PlaylistsAnswerDTO, ServiceError>
    
    func getAllFeaturedPlaylists(completion: @escaping (SearchPlaylistsResult) -> Void)
    
}
