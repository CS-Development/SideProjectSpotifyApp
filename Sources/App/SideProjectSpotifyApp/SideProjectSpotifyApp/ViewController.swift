//
//  ViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 16.07.21.
//

import UIKit
import NetworkingService

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPink
        
        standardGetUrlRequestWithJsonAnswer()
    }
    
    func refactoredUrlRequest() {
        
        let client = URLSessionHTTPClient(session: URLSession.shared)
        client.requestHttpHeaders.add(value: "Bearer BQD8NtKU2MjsTOqup1RyScIvlmZoP_x53ZGabiRSHBGqvPIkRxE7dIU8IbUhsmeZPUkec8boXLr_gst5L-o", forKey: "Authorization")
        client.makeRequest(toURL: URL(string:"https://api.spotify.com/v1/getNewReleases")!, withHttpMethod: .get) { result in
            //
            let album:AlbumModelDTO = GenericDecoder.decodeResult(result: result)
        }
    }
    
//    curl -X "POST" -H "Authorization: Basic ZDY3MGE1OTlmZGM2NGI1ZjkyMGY4MmI0NDUwYTlhNGU6NThkZDE3NmQ4YmJhNGE3YjkzNTA4NGMwNmU3ZDNlYTE=" -d grant_type=client_credentials https://accounts.spotify.com/api/token

    func standardGetUrlRequestWithJsonAnswer() {
        
        
        // Create URL
        let url = URL(string: "https://api.spotify.com/v1/getNewReleases")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        
        
        
        // Set HTTP Request Header
        request.setValue("Bearer BQD8NtKU2MjsTOqup1RyScIvlmZoP_x53ZGabiRSHBGqvPIkRxE7dIU8IbUhsmeZPUkec8boXLr_gst5L-o", forHTTPHeaderField: "Authorization")
        
        
        
        
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                
                let album = self.parseJSON(data: data)
                print(album)
            }
        
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> AlbumModelDTO? {
        
        var returnValue: AlbumModelDTO?
        do {
            returnValue = try JSONDecoder().decode(AlbumModelDTO.self, from: data)
        } catch {
            print("Error took place\(error.localizedDescription).")
        }
        
        return returnValue
    }

}

public struct AlbumModelDTO: DTO {
    
    public var href: String
    public var name: String
    public var numOfSongs: Int
    
    //
    
    //
    
    //
    
    //
    
    //

    public var description: String {
        return """
        ------------
        href = \(href)
        name = \(name)
        numOfSongs = \(numOfSongs)
        ------------
        """
    }
}

