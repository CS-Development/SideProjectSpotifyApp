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
        setRootViewController(makeMainTabBarController())
    }
    
    func makeMainViewController() -> UIViewController {
        let viewModel = MainViewModel(service: service)
        let viewController = ViewController(viewModel: viewModel)
        return viewController
    }
    
    func makeMainTabBarController() -> UIViewController {
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .yellow
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        let tabController = MainTabBarController(viewControllers: [makeMainViewController(), vc1, vc2])
        return tabController
    }
}
