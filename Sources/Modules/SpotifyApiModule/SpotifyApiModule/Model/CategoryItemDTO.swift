//
//  CategoryItemDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 23/07/2021.
//

import NetworkingService

public struct CategoryItemDTO: DTO {
    
    public var href: String
    public var icons: [ImageObjectDTO]
    public var id: String
    public var name: String
        
    public var description: String {
        return """
        ------------
        href = \(href)
        icons = \(icons)
        id = \(id)
        name = \(name)
        ------------
        """
    }
}
