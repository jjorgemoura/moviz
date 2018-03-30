//
//  MovieViewModelTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

private class FakeMovieService: MoviesService {

    func retrievePopularMovies(index: Int, completion: @escaping (PopularMoviesData) -> Void) {
    }

    func loadPosterImage(url: String, completion: @escaping (UIImage) -> Void) {
        let image = UIImage(named: "testImage")
        completion(image!)
    }
}

class MovieViewModelTests: XCTestCase {

    private let filmIdentifier = 1
    private let filmTitle = "James Bond"
    private let filmOverview = "James Bond is a ...."
    private let filmPopularity = 2.0
    private let filmPosterPath = "/jamesbond.png"
    private let filmReleaseDate = "2018-02-05"
    private let filmReleaseDateFormatted = "February 5, 2018"
    private let filmVoteAverage = 3.0
    private let filmVoteAverageFormatted = 30

    private var fakeMovieService: FakeMovieService!
    private var film: FilmData!

    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        fakeMovieService = FakeMovieService()
        film = filmData()
    }

    func testBuildViewModelFromStaticMethodBuildIdentifier() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.identifier, filmIdentifier)
    }

    func testBuildViewModelFromStaticMethodBuildTitle() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.title, filmTitle)
    }

    func testBuildViewModelFromStaticMethodBuildOverview() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.overview, filmOverview)
    }

    func testBuildViewModelFromStaticMethodBuildPopularity() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.popularity, filmPopularity)
    }

    func testBuildViewModelFromStaticMethodBuildPath() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.posterPath, filmPosterPath)
    }

    func testBuildViewModelFromStaticMethodBuildReleaseDate() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.releaseDate, filmReleaseDateFormatted)
    }

    func testBuildViewModelFromStaticMethodBuildWrongReleaseDate() {
        film = filmDataWithInvalidDate()

        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.releaseDate, "")
    }

    func testBuildViewModelFromStaticMethodBuildVoteRate() {
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)

        XCTAssertEqual(viewModel.voteAverage, filmVoteAverageFormatted)
    }

    func testViewModelDownloadPosterImage() {
        expectation = expectation(description: "Movie ViewModel Download Image from Service Expectation")
        let viewModel = MovieViewModel.build(filmData: film, service: fakeMovieService)
        viewModel.delegate = self

        viewModel.downloadPosterImage()

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }

    // MARK: - Convenience Methods
    private func filmData() -> FilmData {
        return FilmData(identifier: filmIdentifier,
                        title: filmTitle,
                        overview: filmOverview,
                        popularity: filmPopularity,
                        posterPath: filmPosterPath,
                        releaseDate: filmReleaseDate,
                        voteAverage: filmVoteAverage)
    }

    private func filmDataWithInvalidDate() -> FilmData {
        return FilmData(identifier: filmIdentifier,
                        title: filmTitle,
                        overview: filmOverview,
                        popularity: filmPopularity,
                        posterPath: filmPosterPath,
                        releaseDate: "20-05-2018",
                        voteAverage: filmVoteAverage)
    }
}

extension MovieViewModelTests: MovieViewModelDelegate {

    func posterImageUpdated(image: UIImage) {
        expectation.fulfill()
    }
}
