//
//  AppCoordinator.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator, Rootable {

    let window: UIWindow
    private let navigationController: UINavigationController = UINavigationController()
    private var popularMoviesCoordinator: PopularMoviesCoordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = navigationController
        popularMoviesCoordinator = PopularMoviesCoordinator(navigationController: navigationController)
        popularMoviesCoordinator?.start()
    }
}
