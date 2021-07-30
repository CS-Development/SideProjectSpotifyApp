//
//  AlbumCellViewModel.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import Foundation
import SpotifyApiModule

class AlbumCellViewModel {
    
    let title: String
    let image: Data
    
    init(title: String, image: Data) {
        self.title = title
        self.image = image
    }
    
}
