//
//  CategoriesDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 21/07/2021.
//

import NetworkingService

public struct CategoriesDTO: DTO {
    
    public var href: String
    public var items: [CategoryItemDTO]

    public var description: String {
        return """
        ------------
        href = \(href)
        items = \(items)
        ------------
        """
    }
    
}
