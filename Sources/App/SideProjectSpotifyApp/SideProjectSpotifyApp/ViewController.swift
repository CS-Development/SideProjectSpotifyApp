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
        service = SpotifyApiRemote(url: URL(string: "https://accounts.spotify.com/api")!, client: client, accessToken: AccessTokenDTO(accessToken: "BQD8NtKU2MjsTOqup1RyScIvlmZoP_x53ZGabiRSHBGqvPIkRxE7dIU8IbUhsmeZPUkec8boXLr_gst5L-o", tokenType: "Bearer", expiresIn: 3600))
        
        refactoredUrlRequest()
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

