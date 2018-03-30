//
//  MoviesWebServiceTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

private class FakeNetworkRequester: NetworkRequester {

    var returnValidRequest: Bool = true

    func buildRequest(for endpointURL: String, parameters: [String: String]) -> URLRequest? {
        if returnValidRequest {
            return URLRequest(url: URL(string: "https://www.google.com")!)
        }
        return nil
    }

    func request(for url: String) -> URLRequest? {
        if returnValidRequest {
            return URLRequest(url: URL(string: "https://www.google.com")!)
        }
        return nil
    }
}

private class FakeNetworkService: NetworkService {
    var returnPopularFilms: Bool = true

    func performGet(request: URLRequest, completion: @escaping (NetworkResult) -> Void) {
        if returnPopularFilms {
            let networkResult = NetworkResult.ok(data: popularFilmsData())
            completion(networkResult)
        } else {
            let networkResult = NetworkResult.ok(data: imageData())
            completion(networkResult)
        }
    }

    private func imageData() -> Data {
        let image = UIImage(named: "testImage")
        return UIImagePNGRepresentation(image!)!
    }

    private func popularFilmsData() -> Data {
        let filmData = staticFilmData()
        let popularData = PopularMoviesData(page: 1, results: [filmData])
        let data = try! JSONEncoder().encode(popularData)
        return data
    }

    private func staticFilmData() -> FilmData {
        return FilmData(identifier: 1,
                        title: "",
                        overview: "",
                        popularity: 2.0,
                        posterPath: "",
                        releaseDate: "2018-02-02",
                        voteAverage: 2.0)
    }
}

class MoviesWebServiceTests: XCTestCase {

    private var fakeNetworkService: FakeNetworkService!
    private var fakeNetworkRequester: FakeNetworkRequester!
    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        fakeNetworkService = FakeNetworkService()
        fakeNetworkRequester = FakeNetworkRequester()
    }

    func testMovieServiceRetrivePopularFilmData() {
        expectation = expectation(description: "Movie Service Expectation")
        let moviesService = MoviesWebService(networkService: fakeNetworkService, networkRequester: fakeNetworkRequester)

        moviesService.retrievePopularMovies(index: 1) { filmData in
            self.expectation.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }

    func testMovieServiceDownloadPosterImage() {
        expectation = expectation(description: "Movie Service Expectation")
        fakeNetworkService.returnPopularFilms = false
        let moviesService = MoviesWebService(networkService: fakeNetworkService, networkRequester: fakeNetworkRequester)

        moviesService.loadPosterImage(url: "") { image in
            self.expectation.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
