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
    private var filmViewModel: FilmViewModel
    let navigationController: UINavigationController

    init(navigationController: UINavigationController, filmViewModel: FilmViewModel) {
        self.navigationController = navigationController
        self.filmViewModel = filmViewModel
    }

    func start() {
        movieViewController.viewModel = filmViewModel
        navigationController.pushViewController(movieViewController, animated: true)
    }
}
