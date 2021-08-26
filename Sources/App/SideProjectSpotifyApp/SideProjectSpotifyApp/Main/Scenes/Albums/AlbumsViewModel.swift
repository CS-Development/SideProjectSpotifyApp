//
//  AlbumsViewModel.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import Foundation
import SpotifyApiModule

final class AlbumsViewModel {
    
    var router: AlbumsViewControllerRouting
    var service: SpotifyApiService
    var onUpdate: () -> Void = { }
    private(set) var albums: [AlbumItemDTO] = []
    
    init(service: SpotifyApiService, router: AlbumsViewControllerRouting) {
        self.service = service
        self.router = router
    }
    
    func getAlbums() {
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
                self.albums = dto.albums.items
                self.onUpdate()
            }
        }
    }
    
    func selectAlbum(for indexPath: IndexPath) {
        let album = albums[indexPath.row]
        router.routeToDetailViewController(album: album)
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return albums.count
    }
    
    enum Cell {
        case album(AlbumCellViewModel)
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        let album = albums[indexPath.row]
        let albumCellViewModel = AlbumCellViewModel(title: album.name,
                                                    image: self.loadImageData(urlString: album.images[0].url) ?? Data())
        return .album(albumCellViewModel)
    }
    
    func loadImageData(urlString: String) -> Data? {
        #warning("unwrap safe URL instead of force")
        if let data = try? Data(contentsOf: URL(string: urlString)!) {
            return data
        }
        return nil
    }
}
