//
//  SideProjectSpotifyAppTests.swift
//  SideProjectSpotifyAppTests
//
//  Created by Christian Slanzi on 16.07.21.
//

import XCTest
@testable import SideProjectSpotifyApp
import SpotifyApiModule

class SideProjectSpotifyAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let fakeService = FakeService()
        let viewController = ViewController(service: fakeService)
        viewController.viewDidLoad()
        
        XCTAssertTrue(fakeService.getAllNewReleasesWasCalled)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class FakeService: SpotifyApiService {
    var getAllNewReleasesWasCalled = false
    
    func getAllNewReleases(completion: @escaping (SearchResult) -> Void) {
        getAllNewReleasesWasCalled = true
    }
    
    func getAllCategories(completion: @escaping (SearchCategoriesResult) -> Void) {
        
    }
    
    func getAllFeaturedPlaylists(completion: @escaping (SearchPlaylistsResult) -> Void) {
        
    }
}
