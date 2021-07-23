//
//  PlaylistItemDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 23/07/2021.
//

import NetworkingService

public struct PlaylistItemDTO: DTO {
    
    public var collaborative: Bool
    public var itemDescription: String?
    public var externalUrls: ExternalUrlObjectDTO
    public var href: String
    public var id: String
    public var images: [ImageObjectDTO]
    public var name: String
    public var owner: PublicUserObjectDTO
    public var isPublic: Bool?
    public var snapshotId: String
    public var tracks: PlaylistTracksRefObjectDTO?
    public var type: String
    public var uri: String
      
    public var description: String {
        return """
        ------------
        collaborative = \(collaborative)
        itemDescription = \(itemDescription as Any)
        external_urls = \(externalUrls)
        href = \(href)
        id = \(id)
        images = \(images)
        name = \(name)
        owner = \(owner)
        public = \(isPublic as Any)
        snapshot_id = \(snapshotId)
        tracks = \(tracks)
        type = \(type)
        uri = \(uri)
        ------------
        """
    }
}

