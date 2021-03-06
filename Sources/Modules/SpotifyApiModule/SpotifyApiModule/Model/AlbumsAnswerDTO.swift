//
//  AlbumsAnswerDTO.swift
//  SpotifyApiModule
//
//  Created by Christian Slanzi on 19.07.21.
//

import NetworkingService

public struct AlbumsAnswerDTO: DTO {
    public var albums: AlbumDTO
    
    public var description: String {
        return """
        ------------
        albums = \(albums)
        ------------
        """
    }
}
