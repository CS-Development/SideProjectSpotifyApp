//
//  ExternalUrlObjectDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 22/07/2021.
//

import NetworkingService

public struct ExternalUrlObjectDTO: DTO {
    
    public var spotify: String
    
    public var description: String {
        return """
        ------------
        spotify = \(spotify)
        ------------
        """
    }
    
}
