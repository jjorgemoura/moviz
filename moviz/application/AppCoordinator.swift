//
//  AppCoordinator.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator, Rootable {

    private let navigationController = UINavigationController()
    private var popularMoviesCoordinator: PopularMoviesCoordinator?
    let window: UIWindow

    // MARK: - Initializers
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = navigationController
        popularMoviesCoordinator = PopularMoviesCoordinator(navigationController: navigationController)
        popularMoviesCoordinator?.start()
    }
}
