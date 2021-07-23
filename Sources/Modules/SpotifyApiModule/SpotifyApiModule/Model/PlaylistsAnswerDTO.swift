//
//  PlaylistsAnswerDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 23/07/2021.
//

import NetworkingService

public struct PlaylistsAnswerDTO: DTO {
    
    public var playlists: PlaylistsDTO
    
    public var description: String {
        return """
        ------------
        playlists = \(playlists)
        ------------
        """
    }
}
