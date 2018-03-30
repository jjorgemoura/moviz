//
//  AppCoordinatorTests.swift
//  movizTests
//
//  Created by Jorge Moura on 29/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class AppCoordinatorTests: XCTestCase {

    func testCoordinatorStartMethodCallsPopularMoviesCoordinator() {
        let window = UIWindow()
        let appCoordinator = AppCoordinator(window: window)

        appCoordinator.start()

        XCTAssertTrue(window.rootViewController?.childViewControllers.first is PopularMoviesViewController)
    }
}
