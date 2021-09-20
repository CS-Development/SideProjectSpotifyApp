//
//  SpotifyAppDependencies.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 27.07.21.
//

import Foundation
import NetworkingService
import SpotifyApiModule
import SpotifyAccountApiModule
import UIKit

// THIS IS THE APP COMPOSITION ROOT

class SpotifyAppDependencies {
    
    var window: UIWindow?
    
    static let shared = SpotifyAppDependencies()
    
    private lazy var client: HTTPClient = {
        return URLSessionHTTPClient(session: URLSession.shared)
    }()
    
    private lazy var service: SpotifyApiService = {
        return SpotifyApiRemote(url: URL(string: "https://api.spotify.com/v1")!,
                                client: client,
                                accessToken: AccessTokenDTO(accessToken: "BQCtrbDNVESQ0cMeZjvXIIXS5rGAUdmzcLPIi7_uNpLCMGMhXnA3sVvGXjuqm0idAwwc7S9LTm0kfQEEn6s",
                                                            tokenType: "Bearer",
                                                            expiresIn: 3600))
    }()
    
    private lazy var accountService: SpotifyAccountApiService = {
        return SpotifyAccountApiRemote(url: URL(string: "https://accounts.spotify.com/api")!,
                                       client: client,
                                       clientID: spotifyAccountClientID,
                                       clientSecret: spotifyAccountClientSecret)
    }()
    
    private lazy var authDecoratorService: SpotifyApiService = {
       return SpotifyApiServiceAuthDecorator(service: service, authService: accountService)
    }()
    
    private lazy var localService: SpotifyApiService = {
        // TODO create a local version of SpotifyApiService
       return SpotifyApiServiceAuthDecorator(service: service, authService: accountService)
    }()
    
    private lazy var compositeFallbackService: SpotifyApiService = {
        let service = CompositeFallbackService(remote: authDecoratorService,
                                               local: localService)
        return service
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
        self.setRootViewController(self.makeMainTabBarController())
    }
    
    func makeMainViewController() -> UIViewController {
        
        let viewModel = MainViewModel(service: compositeFallbackService)
        let router = ViewControllerRouter()
        
        let viewController = ViewController(viewModel: viewModel, router: router)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.navigationController = navigationController
        
        navigationController.title = "Main"
        navigationController.tabBarItem.image = UIImage(systemName: "music.note.house")
        return navigationController
    }
    
    func makeAlbumsViewController() -> UIViewController {
        let router = AlbumsViewControllerRouter()
        let viewModel = AlbumsViewModel(service: compositeFallbackService, router: router)
        let viewController = AlbumsViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.navigationController = navigationController
        
        navigationController.title = "Albums"
        navigationController.tabBarItem.image = UIImage(systemName: "music.note.list")
        return navigationController
    }
    
    func makeMainTabBarController() -> UIViewController {
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        let tabController = MainTabBarController(viewControllers: [makeMainViewController(),
                                                                   makeAlbumsViewController(),
                                                                   vc2])
        return tabController
    }
}

//extension SpotifyAppDependencies: ViewControllerRouting {
//    func routeToDetailViewController() {
//        let vc = UIViewController()
//        vc.view.backgroundColor = .brown
//
//        //setRootViewController(vc)
//    }
//}

class AlbumsViewControllerRouter: AlbumsViewControllerRouting {
    var navigationController: UINavigationController?
    
    func routeToDetailViewController(album: AlbumItemDTO) {
        let viewModel = AlbumDetailViewModel(album: album)
        let vc = AlbumDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class ViewControllerRouter: ViewControllerRouting {
    var navigationController: UINavigationController?
    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    
    func routeToDetailViewController() {
        let vc = UIViewController()
        vc.view.backgroundColor = .brown

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// SECRETS

extension SpotifyAppDependencies {
    
    internal var spotifyAccountClientID: String {
      get {
        // 1 - search for the secrets plist file
        let name = "Secrets/Secrets"
        let fileExt = "plist"
        let key = "SPOTIFY_CLIENT_ID"
        let missing = "SPOTIFY_CLIENT_ID-NOT-FOUND"
        let notDefined = "SPOTIFY_CLIENT_ID-NOT-VALID"
        
        return searchSecretValueFor(key: key,
                                    in: name,
                                    with: fileExt,
                                    missingErrorMessageKey: missing,
                                    noteDefinedErrorMessageKey: notDefined)
      }
    }
    
    internal var spotifyAccountClientSecret: String {
      get {
        // 1 - search for the secrets plist file
        let name = "Secrets/Secrets"
        let fileExt = "plist"
        let key = "SPOTIFY_CLIENT_SECRET"
        let missing = "SPOTIFY_CLIENT_SECRET-NOT-FOUND"
        let notDefined = "SPOTIFY_CLIENT_SECRET-NOT-VALID"
        
        return searchSecretValueFor(key: key,
                                    in: name,
                                    with: fileExt,
                                    missingErrorMessageKey: missing,
                                    noteDefinedErrorMessageKey: notDefined)
      }
    }
    
    func searchSecretValueFor(key: String,
                              in name: String,
                              with fileExt: String,
                              missingErrorMessageKey: String,
                              noteDefinedErrorMessageKey: String) -> String {
        
        guard let url = Bundle.main.url(
                    forResource: name,
                    withExtension: fileExt
                ) else {
                    print("Couldn't find file '\(name).\(fileExt)'.")
                    return missingErrorMessageKey
                }
//        guard let filePath = Bundle.main.path(forResource: "Secrets-Info", ofType: "plist") else {
//          //fatalError("Couldn't find file 'Secrets.plist'.")
//            print("Couldn't find file 'Secrets.plist'.")
//            return "COOKING_API_KEY-NOT-FOUND"
//        }
//        // 2
//        let plist = NSDictionary(contentsOfFile: filePath)
        let plist = NSDictionary(contentsOf: url)
        guard let value = plist?.object(forKey: key) as? String else {
          //fatalError("Couldn't find key 'COOKING_API_KEY' in 'Secrets-Info.plist'.")
            print("Couldn't find key '\(key)' in '\(name).\(fileExt)'.")
            return missingErrorMessageKey
        }
        // 3
        if (value.isEmpty || value.starts(with: "_") || value.starts(with: " ") ) {

            print("Value not defined for '\(key)' in '\(name).\(fileExt)'.")
            return noteDefinedErrorMessageKey
        }
        return value
    }
}
