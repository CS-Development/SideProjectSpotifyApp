//
//  SimplifiedArtistObjectDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 22/07/2021.
//

import NetworkingService

public struct SimplifiedArtistObjectDTO: DTO {
    
    public var externalUrls: ExternalUrlObjectDTO
    public var href: String
    public var id: String
    public var name: String
    public var type: String
    public var uri: String
    
    public var description: String {
        return """
        ------------
        external_urls = \(externalUrls)
        href = \(href)
        id = \(id)
        name = \(name)
        type = \(type)
        uri = \(uri)
        ------------
        """
    }
    
}
