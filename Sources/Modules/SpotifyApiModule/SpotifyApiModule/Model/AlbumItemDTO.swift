//
//  AlbumItemDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 22/07/2021.
//

import NetworkingService

public struct AlbumItemDTO: DTO {
    
    public var href: String
    public var albumGroup: String?
    public var albumType: String
    public var artists: [SimplifiedArtistObjectDTO]
    public var availableMarkets: [String]
    public var externalUrls: ExternalUrlObjectDTO
    public var id: String
    public var images: [ImageObjectDTO]
    public var name: String
    public var releaseDate: String
    public var releaseDatePrecision: String
    public var restrictions: AlbumRestrictionObjectDTO?
    public var totalTracks: Int
    public var type: String
    public var uri: String

    public var description: String {
        return """
        ------------
        album_group = \(albumGroup ?? "nil")
        album_type = \(albumType)
        artists = \(artists)
        available_markets = \(availableMarkets)
        external_urls = \(externalUrls)
        href = \(href)
        id = \(id)
        release_date = \(releaseDate)
        release_date_precision = \(releaseDatePrecision)
        total_tracks = \(totalTracks)
        type = \(type)
        uri = \(uri)
        ------------
        """
    }
}
