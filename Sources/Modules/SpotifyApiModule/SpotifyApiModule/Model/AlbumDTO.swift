//
//  AlbumDTO.swift
//  SpotifyApiModule
//
//  Created by Christian Slanzi on 19.07.21.
//

import NetworkingService

public struct AlbumDTO: DTO {
    
    public var href: String
    public var items: [AlbumItemDTO]

    public var description: String {
        return """
        ------------
        href = \(href)
        items = \(items)
        ------------
        """
    }
}
