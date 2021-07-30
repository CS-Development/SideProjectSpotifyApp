//
//  AlbumsViewModel.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import Foundation
import SpotifyApiModule

final class AlbumsViewModel {
    
    var service: SpotifyApiService
    var onUpdate: () -> Void = { }
    private(set) var cells: [Cell] = []
    
    init(service: SpotifyApiService) {
        self.service = service
    }
    
    func getAlbums() {
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
                
                #warning("need refactor hre")
                self.cells = dto.albums.items.map {
                    let albumCellViewModel = AlbumCellViewModel(title: $0.name,
                                                                image: self.loadImageData(urlString: $0.images[0].url) ?? Data())
                    return .album(albumCellViewModel)
                }
                
                self.onUpdate()
            }
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return cells.count
    }
    
    enum Cell {
        case album(AlbumCellViewModel)
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func loadImageData(urlString: String) -> Data? {
        #warning("unwrap safe URL instead of force")
        if let data = try? Data(contentsOf: URL(string: urlString)!) {
            return data
        }
        return nil
    }
}
