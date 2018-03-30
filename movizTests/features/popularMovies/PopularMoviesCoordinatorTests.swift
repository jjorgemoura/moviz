//
//  PopularMoviesCoordinatorTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class PopularMoviesCoordinatorTests: XCTestCase {

    func testCoordinatorStartMethodCallsPopularMoviesViewController() {
        let navigationController = UINavigationController()
        let popularMoviesCoordinator = PopularMoviesCoordinator(navigationController: navigationController)

        popularMoviesCoordinator.start()

        XCTAssertTrue(navigationController.visibleViewController is PopularMoviesViewController)
    }
}
