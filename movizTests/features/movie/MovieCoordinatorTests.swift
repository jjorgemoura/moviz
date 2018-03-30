//
//  MovieCoordinatorTests.swift
//  movizTests
//
//  Created by Jorge Moura on 29/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class MovieCoordinatorTests: XCTestCase {

    func testCoordinatorStartMethodCallsMoviesViewController() {
        let navigationController = UINavigationController()
        let movieViewModel = MovieViewModel(film: filmData())
        movieViewModel.image = UIImage(named: "testImage")
        let movieCoordinator = MovieCoordinator(navigationController: navigationController, movieViewModel: movieViewModel)

        movieCoordinator.start()
        _ = movieCoordinator.movieViewController.view

        XCTAssertTrue(navigationController.visibleViewController is MovieViewController)
    }

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
