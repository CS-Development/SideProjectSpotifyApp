//
//  SpotifyAccountRemote.swift
//  SpotifyApiModule
//
//  Created by Christian Slanzi on 19.07.21.
//

import NetworkingService

public class SpotifyApiRemote: SpotifyApiService {
    
    private var url: URL
    private var client: HTTPClient
    private var accessToken: AccessTokenDTO
    
    public init(url: URL, client: HTTPClient, accessToken: AccessTokenDTO) {
        self.url = url
        self.client = client
        self.accessToken = accessToken
        self.client.requestHttpHeaders.add(value: "\(accessToken.tokenType) \(accessToken.accessToken)"
                                      , forKey: "Authorization")
    }
    
    public func getAllNewReleases(completion: @escaping (SearchResult) -> Void) {
        
        client.makeRequest(toURL: url.appendingPathComponent("browse/new-releases"), withHttpMethod: .get) { [weak self] result in
                guard self != nil else { return }
                
                completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
    public func getAllCategories(completion: @escaping (SearchCategoriesResult) -> Void) {
        
        client.makeRequest(toURL: url.appendingPathComponent("browse/categories"), withHttpMethod: .get) { [weak self] result in
                guard self != nil else { return }
                
                completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
    
    public func getAllFeaturedPlaylists(completion: @escaping (SearchPlaylistsResult) -> Void) {
        client.makeRequest(toURL: url.appendingPathComponent("browse/featured-playlists"), withHttpMethod: .get) { [weak self] result in
                guard self != nil else { return }
                
                completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
}
