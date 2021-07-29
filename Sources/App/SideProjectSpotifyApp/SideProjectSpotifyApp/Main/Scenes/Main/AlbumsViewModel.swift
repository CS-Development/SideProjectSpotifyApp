//
//  AlbumsViewModel.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import Foundation
import SpotifyApiModule

final class AlbumsViewModel {
    
    var albumsItems: [AlbumItemDTO]
    var service: SpotifyApiService
    var onUpdate: () -> Void = { }
    
    init(service: SpotifyApiService) {
        self.service = service
        self.albumsItems = [AlbumItemDTO]()
    }
    
    func getAlbums() {
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
                self.albumsItems = dto.albums.items
                self.onUpdate()
            }
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return albumsItems.count
    }
    
}
