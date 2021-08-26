//
//  AlbumDetailViewModel.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 26/08/2021.
//

import Foundation
import SpotifyApiModule

class AlbumDetailViewModel {
    
    let album: AlbumItemDTO
    
    init(album: AlbumItemDTO) {
        self.album = album
    }
    
    lazy var imageData: Data = {
        return loadImageData(urlString: album.images[0].url) ?? Data()
    }()
    
    func loadImageData(urlString: String) -> Data? {
        #warning("unwrap safe URL instead of force")
        if let data = try? Data(contentsOf: URL(string: urlString)!) {
            return data
        }
        return nil
    }
    
}
