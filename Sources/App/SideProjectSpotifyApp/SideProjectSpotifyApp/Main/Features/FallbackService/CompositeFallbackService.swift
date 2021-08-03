//
//  CompositeFallbackService.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 03.08.21.
//

import Foundation
import SpotifyApiModule

public class CompositeFallbackService: SpotifyApiService {
    
    let remote: SpotifyApiService
    let local: SpotifyApiService
    
    public init(remote: SpotifyApiService, local: SpotifyApiService) {
        self.remote = remote
        self.local = local
    }
    
    public func setAccessToken(_ token: SpotifyApiModule.AccessTokenDTO) {
        // TODO
    }
    
    public func getAllNewReleases(completion: @escaping (SearchResult) -> Void) {
        remote.getAllNewReleases { result in
            switch result {
            case .failure(_):
                self.local.getAllNewReleases { result in
                    completion(result)
                }
                break
            case let .success(answer):
                // TODO: Save 'answer' to the database
                completion(result)
                break
            }
        }
    }
    
    public func getAllCategories(completion: @escaping (SearchCategoriesResult) -> Void) {
        
    }
    
    public func getAllFeaturedPlaylists(completion: @escaping (SearchPlaylistsResult) -> Void) {
        
    }
}
 



