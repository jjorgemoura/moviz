//
//  MovieCoordinator.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class MovieCoordinator: Coordinator, Navigationable {

    private var movieViewController: MovieViewController = MovieViewController()
//    private var popularMoviesViewModel: PopularMoviesViewModel = PopularMoviesDefaultViewModel()
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.pushViewController(movieViewController, animated: true)
    }
}
