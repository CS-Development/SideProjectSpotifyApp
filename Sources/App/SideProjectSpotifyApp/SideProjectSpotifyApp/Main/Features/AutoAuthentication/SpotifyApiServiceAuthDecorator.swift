//
//  SpotifyApiServiceAuthDecorator.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 30.07.21.
//

import SpotifyApiModule
import SpotifyAccountApiModule
import NetworkingService

/*
struct ParameterType {
    
}

struct DataType {
    
}

protocol SystemInterface {
    func functionality(parameters: ParameterType) -> DataType
}

class BasicSystem: SystemInterface {
    final func functionality(parameters: ParameterType) -> DataType {
        return DataType()
    }
}

class Database {
    func save(_ data: DataType) {
        
    }
}

class DecoratedBasicSystem: SystemInterface  {
    
    var basicSystem: SystemInterface
    var database: Database!
    
    public init(basicSystem: SystemInterface) {
        self.basicSystem = basicSystem
    }
    
    func functionality(parameters: ParameterType) -> DataType {
        
        // DO ALL THE NEW EXTRA STUFF
        
        //elaborate the parameters.....
        extraFunctionality()
        var data = basicSystem.functionality(parameters: parameters)
        
        // operate on data
        database.save(data)
        
        return data
    }
    
    func extraFunctionality() {}
}

class SystemClient {

    let system: SystemInterface
    
    internal init(system: SystemInterface) {
        self.system = system
    }
    
    func operate() {
        system.functionality(parameters: ParameterType())
    }
}


class Shape {
    func surface() -> Float {
        fatalError()
    }
}

class Rectangle: Shape {
    
    var sideA: Float
    var sideB: Float
    
    func surface() -> Float {
        return sideA * sideB
    }
}
class Circle: Shape {
    
    var ray: Float
    func surface() -> Float {
        return 2pi * ray
    }
}

class ColoredCircle: Circle, Color {
    var color: UIColor
}

class Client {
    var shapes: [Shape]
    
    func surface() {
        var totSurface: Float = 0.0
        for shape in shapes {
            totSurface += shape.surface()
            
            if shape.self
        }
    }
}

class ColoredCircle: CircleInterface, ColoredInteface, ... {
    
    
}

class Client1 {
    var circle: CircleInterface
    
    var loading: LoadingAPI
    
    func operate() {
        loading.loadData()
    }
}

class Client2 {
    var circle: CircleInterface
    
    var loading: SavingAPI
    
    func operate() {
        loading.saveData()
    }
}


protocol LoadingAPI {
    func loadData()
}

protocol SavingAPI {
    func saveData()
}

class APISystem: LoadingAPI, SavingAPI {
    func loadData() {
        <#code#>
    }
    
    func saveData() {
        <#code#>
    }
}






protocol ServiceInterface {
    func apiMethod()
}

class ServiceSystem: ServiceInterface  {
    
    func apiMethod() {}
}

class JWT_ServiceSystem: ServiceInterface {
    
    
    var serviceSystem: ServiceSystem
    var jwt....
}

class AWS_ServiceSystem: ServiceInterface {
    var aws....
}

class Oauth_ServiceSystem: ServiceInterface {
    var aws....
}
 



// COMPOSITION VS INHERITANCE

class Client {

    var system: BasicSystem
    
    internal init(system: BasicSystem) {
        self.system = system
    }
    
    func operate() {
        // doing something on the system
    }
}

class AdvancedSystem: BasicSystem {
    
    //
    
    override func functionality(parameters: ParameterType) -> DataType {
        return DataType()
    }
}

class CompositionRoot {
    
    func create() {
        
        let system = BasicSystem()
        let decoratedSystem = DecoratedBasicSystem(basicSystem: system)
        
        let client = SystemClient(system: decoratedSystem)
        
        
    }
    
    func createSystem() {
        
        let system = BasicSystem()
        let advancedSystem = AdvancedSystem()
        let client = Client(system: system)
        client.operate()
    }
}

 */














class SpotifyApiServiceAuthDecorator: SpotifyApiService {
    
    var service: SpotifyApiService
    var authService: SpotifyAccountApiService
    
    internal init(service: SpotifyApiService, authService: SpotifyAccountApiService) {
        self.service = service
        self.authService = authService
    }
    
    func setAccessToken(_ token: SpotifyApiModule.AccessTokenDTO) {
        service.setAccessToken(token)
    }
    
    func getAllNewReleases(completion: @escaping (SearchResult) -> Void) {
        //autoAuthenticateRequest(function: service.getAllNewReleases, completion: completion)
        
        service.getAllNewReleases { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            self.getAllNewReleases(completion: completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
    
    func getAllCategories(completion: @escaping (SearchCategoriesResult) -> Void) {
        //autoAuthenticateRequest(function: service.getAllCategories, completion: completion)
        
        
        service.getAllCategories { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            self.getAllCategories(completion: completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
    
    func getAllFeaturedPlaylists(completion: @escaping (SearchPlaylistsResult) -> Void) {
        autoAuthenticateRequest(function: service.getAllFeaturedPlaylists, completion: completion)

        
        authenticateRequest(function: service.getAllFeaturedPlaylists, completion: completion)
        
        
        service.getAllFeaturedPlaylists { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            self.getAllFeaturedPlaylists(completion: completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
    
    typealias MethodHandler<T> = (_ completion: @escaping (GenericResult<T>) -> Void)  -> Void
    typealias GenericResult<T> = Swift.Result<T, ServiceError>
    
    
    
    func authenticateRequest<T>(function: @escaping((_ completion: @escaping (Swift.Result<T, ServiceError>) -> Void)->Void), completion: @escaping (Swift.Result<T, ServiceError>) -> Void) {
        function { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            function(completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
    
    
    
    
    func autoAuthenticateRequest<T>( function: @escaping MethodHandler<T>,
                                 completion: @escaping (GenericResult<T>) -> Void) {
        function { result in
            switch result {
            case let .failure(error):
                switch error {
                case .notAuthorized:
                    
                    self.authService.getApiToken { tokenResult in
                        switch tokenResult {
                        case .failure(_):
                            completion(result)
                        case let .success(token):
                            self.setAccessToken(SpotifyApiModule.AccessTokenDTO(accessToken: token.accessToken,
                                                                                tokenType: token.tokenType,
                                                                                expiresIn: token.expiresIn))
                            function(completion)
                        }
                    }

                default:
                    completion(result)
                }
                break
            case .success(_):
                completion(result)
            }
        }
    }
}
