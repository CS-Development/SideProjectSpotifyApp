//
//  ViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 16.07.21.
//

import UIKit
import NetworkingService
import SpotifyApiModule

class ViewController: UIViewController {

    var service: SpotifyApiService
    
    init(service: SpotifyApiService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPink
//        refactoredUrlRequest()
//        getCategories()
        getFeaturedPlaylists()
    }
    
    func getFeaturedPlaylists() {
        service.getAllFeaturedPlaylists { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
            }
        }
    }
    
    func getCategories() {
        service.getAllCategories { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
            }
        }
    }
    
    func refactoredUrlRequest() {
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(dto):
                print(dto)
            }
        }
    }
}

