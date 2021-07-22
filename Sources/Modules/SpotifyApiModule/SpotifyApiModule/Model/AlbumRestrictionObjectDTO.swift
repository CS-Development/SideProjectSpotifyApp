//
//  AlbumRestrictionObjectDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 22/07/2021.
//

import NetworkingService

public struct AlbumRestrictionObjectDTO: DTO {
    
    public var reason: String
    
    public var description: String {
        return """
        ------------
        reason = \(reason)
        ------------
        """
    }
}
