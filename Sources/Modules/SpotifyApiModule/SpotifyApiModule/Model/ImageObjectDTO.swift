//
//  ImageObjectDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 22/07/2021.
//

import NetworkingService

public struct ImageObjectDTO: DTO {
    
    public var height: Int
    public var url: String
    public var width: Int
    
    public var description: String {
        return """
        ------------
        height = \(height)
        url = \(url)
        width = \(width)
        ------------
        """
    }
}
