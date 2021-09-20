//
//  CALayer+Extension.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import UIKit

extension CALayer {
    func addShadow() {
        shadowColor = UIColor.label.cgColor
        shadowOpacity = 0.2
        shadowOffset = CGSize(width: -1, height: 3)
        shadowRadius = 5
    }
}
