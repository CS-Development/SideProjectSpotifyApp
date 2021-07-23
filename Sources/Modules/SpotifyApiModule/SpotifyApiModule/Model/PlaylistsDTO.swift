//
//  PlaylistsDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 23/07/2021.
//

import NetworkingService

public struct PlaylistsDTO: DTO {
    
    public var href: String
    public var items: [PlaylistItemDTO]

    public var description: String {
        return """
        ------------
        href = \(href)
        items = \(items)
        ------------
        """
    }
}
