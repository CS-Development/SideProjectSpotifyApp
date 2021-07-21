//
//  CategoriesAnswerDTO.swift
//  SpotifyApiModule
//
//  Created by Pawel Kacela on 21/07/2021.
//

import NetworkingService

public struct CategoriesAnswerDTO: DTO {
    public var categories: CategoriesDTO
    
    public var description: String {
        return """
        ------------
        categories = \(categories)
        ------------
        """
    }
}
