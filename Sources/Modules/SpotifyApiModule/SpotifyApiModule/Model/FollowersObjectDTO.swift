//
//  FollowersObjectDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 23/07/2021.
//

import NetworkingService

public struct FollowersObjectDTO: DTO {
    
    public var href: String?
    public var total: Int
    
    public var description: String {
        return """
    ------------
    href = \(href as Any)
    total = \(total)
    ------------
    """
    }
    
}
