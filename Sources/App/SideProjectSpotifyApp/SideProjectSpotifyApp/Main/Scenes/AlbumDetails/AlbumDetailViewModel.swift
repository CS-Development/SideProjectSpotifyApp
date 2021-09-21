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
    
    var releaseDate: String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, yyyy"
        
        guard let date = dateFormatterGet.date(from: album.releaseDate) else { return nil }
        let dateToDisplay = dateFormatterPrint.string(from: date)
        
        return "Release Date: \(dateToDisplay)"
    }
    
    lazy var imageData: Data = {
        return loadImageData(urlString: album.images[0].url) ?? Data()
    }()
    
    func loadImageData(urlString: String) -> Data? {
        
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return data
    }
    
}
