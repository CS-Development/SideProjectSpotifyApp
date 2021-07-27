//
//  MainViewModel.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 27.07.21.
//

import Foundation
import SpotifyApiModule

final class MainViewModel {
    
    var service: SpotifyApiService
    
    init(service: SpotifyApiService) {
        self.service = service
    }
    
    func getFeaturedPlaylists() {
        service.getAllFeaturedPlaylists { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
            }
        }
    }
    
    func getCategories() {
        service.getAllCategories { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
            }
        }
    }
    
    func refactoredUrlRequest() {
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
            }
        }
    }
}
