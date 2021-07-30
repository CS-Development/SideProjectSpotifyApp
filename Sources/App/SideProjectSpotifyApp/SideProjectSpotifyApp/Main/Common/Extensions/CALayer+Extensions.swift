//
//  CALayer+Extension.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import UIKit

extension CALayer {
    func addShadow() {
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.1
        shadowOffset = CGSize(width: -1, height: 3)
        shadowRadius = 5
    }
}
