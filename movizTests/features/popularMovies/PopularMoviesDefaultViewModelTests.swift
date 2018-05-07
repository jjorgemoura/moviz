//
//  PopularMoviesDefaultViewModelTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest
import RxSwift

class PopularMoviesDefaultViewModelTests: XCTestCase {

    func testViewModelLoadPopularFilms() {
        let fakeNetworkDispatcher = FakeNetworkDispatcher()
        fakeNetworkDispatcher.dataEncoded = try! JSONEncoder().encode(retrievePopularMovies())

        let networkService = NetworkWebService(networkDispatcher: fakeNetworkDispatcher)
        let movieService = MoviesWebService(networkService: networkService, remoteHost: FakeRemoteHost())

        let viewModel = PopularMoviesDefaultViewModel(service: movieService, appSchedulers: TestingAppSchedulers())

        viewModel.loadPopularMovies()

        let movie = viewModel.popularMovies.first!
        XCTAssertEqual(movie.title, "Star Wars")
    }

    private func retrievePopularMovies() -> PopularMoviesData {
        return PopularMoviesData(page: 1, results: [movieData()])
    }

    private func movieData() -> MovieData {
        return MovieData(identifier: 1,
                         title: "Star Wars",
                         overview: "",
                         popularity: 2.0,
                         posterPath: "",
                         releaseDate: "2018-02-02",
                         voteAverage: 2.0)
    }
}
