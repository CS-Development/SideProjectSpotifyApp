//
//  SpotifyAccountApiRemote.swift
//  SpotifyAccountApiModule
//
//  Created by Christian Slanzi on 28.07.21.
//

import NetworkingService

public class SpotifyAccountApiRemote: SpotifyAccountApiService {
    
    private var url: URL
    private var client: HTTPClient
    private var clientID: String
    private var clientSecret: String

    public init(url: URL, client: HTTPClient, clientID: String, clientSecret: String) {
        self.url = url
        self.client = client
        self.clientID = clientID
        self.clientSecret = clientSecret
    }
    
    public func getApiToken(completion: @escaping (TokenResult) -> Void) {
        let base64Encoded = "\(clientID):\(clientSecret)".toBase64()
        client.requestHttpHeaders.add(value: "Basic \(base64Encoded)", forKey: "Authorization")
        client.requestHttpHeaders.add(value: "application/x-www-form-urlencoded", forKey: "Content-Type")
        client.httpBodyParameters.add(value: "client_credentials", forKey: "grant_type")
        client.makeRequest(toURL: url.appendingPathComponent("token"), withHttpMethod: .post) { [weak self] result in
                guard self != nil else { return }
                
                completion(GenericDecoder.decodeResult(result: result))
        }
    }
}

//TODO: move String extension to a Utils framework
extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

}
