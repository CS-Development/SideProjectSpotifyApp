//
//  PublicUserObjectDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 23/07/2021.
//

import NetworkingService

public struct PublicUserObjectDTO: DTO {
    
    public var displayName: String?
    public var externalUrls: ExternalUrlObjectDTO
    public var followers: FollowersObjectDTO?
    public var href: String
    public var id: String
    public var images: [ImageObjectDTO]?
    public var type: String
    public var uri: String
    
    public var description: String {
        return """
        ------------
        display_name = \(displayName as Any)
        external_urls = \(externalUrls)
        followers = \(followers as Any)
        href = \(href)
        id = \(id)
        images = \(images as Any)
        type = \(type)
        uri = \(uri)
        ------------
        """
    }
}
