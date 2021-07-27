//
//  SpotifyAppDependencies.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 27.07.21.
//

import Foundation
import NetworkingService
import SpotifyApiModule
import UIKit

// THIS IS THE APP COMPOSITION ROOT

class SpotifyAppDependencies {
    
    var window: UIWindow?
    
    static let shared = SpotifyAppDependencies()
    
    private lazy var client: HTTPClient = {
        return URLSessionHTTPClient(session: URLSession.shared)
    }()
    
    private lazy var service: SpotifyApiService = {
        return SpotifyApiRemote(url: URL(string: "https://api.spotify.com/v1")!, client: client, accessToken: AccessTokenDTO(accessToken: "BQCtrbDNVESQ0cMeZjvXIIXS5rGAUdmzcLPIi7_uNpLCMGMhXnA3sVvGXjuqm0idAwwc7S9LTm0kfQEEn6s", tokenType: "Bearer", expiresIn: 3600))
    }()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.makeKeyAndVisible()
    }
    
    internal func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    func start() {
        setRootViewController(ViewController(service: service))
    }
}
