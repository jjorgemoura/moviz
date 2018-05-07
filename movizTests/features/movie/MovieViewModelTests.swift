//
//  MovieViewModelTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest
import RxSwift

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
    private var fakeMovieService: FilmPosterService!

    override func setUp() {
        super.setUp()
        fakeMovieService = FakeFilmPosterService()
    }

    func testBuildViewModelFromStaticMethodBuildIdentifier() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.identifier, filmIdentifier)
    }

    func testBuildViewModelFromStaticMethodBuildTitle() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.title, filmTitle)
    }

    func testBuildViewModelFromStaticMethodBuildOverview() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.overview, filmOverview)
    }

    func testBuildViewModelFromStaticMethodBuildPopularity() {
       let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.popularity, filmPopularity)
    }

    func testBuildViewModelFromStaticMethodBuildPath() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.posterPath, filmPosterPath)
    }

    func testBuildViewModelFromStaticMethodBuildReleaseDate() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.releaseDate, filmReleaseDateFormatted)
    }

    func testBuildViewModelFromStaticMethodBuildWrongReleaseDate() {
        let viewModel = MovieViewModel(film: filmDataWithInvalidDate(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.releaseDate, "")
    }

    func testBuildViewModelFromStaticMethodBuildVoteRate() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        XCTAssertEqual(viewModel.voteAverage, filmVoteAverageFormatted)
    }

    func testViewModelDownloadPosterImage() {
        let viewModel = MovieViewModel(film: filmData(), service: fakeMovieService, appSchedulers: TestingAppSchedulers())

        viewModel.downloadPosterImage()

        XCTAssertNotNil(viewModel.image)
    }

    // MARK: - Convenience Methods
    private func filmData() -> MovieData {
        return MovieData(identifier: filmIdentifier,
                        title: filmTitle,
                        overview: filmOverview,
                        popularity: filmPopularity,
                        posterPath: filmPosterPath,
                        releaseDate: filmReleaseDate,
                        voteAverage: filmVoteAverage)
    }

    private func filmDataWithInvalidDate() -> MovieData {
        return MovieData(identifier: filmIdentifier,
                        title: filmTitle,
                        overview: filmOverview,
                        popularity: filmPopularity,
                        posterPath: filmPosterPath,
                        releaseDate: "20-05-2018",
                        voteAverage: filmVoteAverage)
    }
}
