//
//  PopularMoviesDefaultViewModelTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

private class FakeMovieService: MoviesService {

    func retrievePopularMovies(index: Int, completion: @escaping (PopularMoviesData) -> Void) {
        let popularMoviesData = PopularMoviesData(page: 1, results: [filmData()])
        completion(popularMoviesData)
    }

    func loadPosterImage(url: String, completion: @escaping (UIImage) -> Void) { }

    private func filmData() -> FilmData {
        return FilmData(identifier: 1,
                        title: "",
                        overview: "",
                        popularity: 2.0,
                        posterPath: "",
                        releaseDate: "2018-02-02",
                        voteAverage: 2.0)
    }
}

class PopularMoviesDefaultViewModelTests: XCTestCase {

    private var fakeMovieService: FakeMovieService!
    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        fakeMovieService = FakeMovieService()
    }

    func testViewModelLoadPopularFilms() {
        expectation = expectation(description: "Popular Movies ViewModel load films from Service Expectation")
        let viewModel = PopularMoviesDefaultViewModel(service: fakeMovieService)
        viewModel.delegate = self

        viewModel.loadPopularMovies()

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}

extension PopularMoviesDefaultViewModelTests: PopularMoviesViewModelDelegate {

    func dataUpdated() {
        expectation.fulfill()
    }
}
