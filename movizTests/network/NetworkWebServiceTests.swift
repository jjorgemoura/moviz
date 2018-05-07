//
//  NetworkWebServiceTests.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest
import RxSwift

class NetworkWebServiceTests: XCTestCase {
    
    func testPerformCall() {
        let networkDispatcher = FakeNetworkDispatcher()
        let movieData = MovieData(identifier: 5,
                                  title: "queen",
                                  overview: "",
                                  popularity: 2.0,
                                  posterPath: "",
                                  releaseDate: "",
                                  voteAverage: 2.0)
        networkDispatcher.dataEncoded = try! JSONEncoder().encode(movieData)
        
        let networkService = NetworkWebService(networkDispatcher: networkDispatcher)
        let request = JsonWebRequest(resource: Resource(method: .get, url: "", queryParameters: [: ], body: nil))
        
        let resultData = try! networkService.performCall(for: request).toBlocking().first()
        
        let movie = try! JSONDecoder().decode(MovieData.self, from: resultData!)
        XCTAssertEqual(movie.identifier, 5)
    }
}
