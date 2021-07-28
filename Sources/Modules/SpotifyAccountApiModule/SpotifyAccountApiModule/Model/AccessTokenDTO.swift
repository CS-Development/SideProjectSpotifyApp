//
//  AccessTokenDTO.swift
//  SpotifyAccountApiModule
//
//  Created by Christian Slanzi on 28.07.21.
//

import NetworkingService

public struct AccessTokenDTO: DTO {
    public var accessToken: String
    public var tokenType: String
    public var expiresIn: Int
    
    public init(accessToken: String, tokenType: String, expiresIn: Int) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
    }
    
    public var description: String {
        return """
        ------------
        accessToken = \(accessToken)
        tokenType = \(tokenType)
        expiresIn = \(expiresIn)
        ------------
        """
    }
}
