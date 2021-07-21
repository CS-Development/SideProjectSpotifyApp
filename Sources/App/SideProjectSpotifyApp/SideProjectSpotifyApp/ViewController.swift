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

    var client: URLSessionHTTPClient!
    var service: SpotifyApiRemote!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPink
        
        client = URLSessionHTTPClient(session: URLSession.shared)
        service = SpotifyApiRemote(url: URL(string: "https://api.spotify.com/v1")!, client: client, accessToken: AccessTokenDTO(accessToken: "BQBw-v1kTmkRzq_R1NNVMwuWfAvuyLYECX_RNOtt-oS25J1b8OLAdXGvTzonYp0OkXA-bXiV54Vh0xgTaoQ", tokenType: "Bearer", expiresIn: 3600))
        
//        refactoredUrlRequest()
        getCategories()
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

