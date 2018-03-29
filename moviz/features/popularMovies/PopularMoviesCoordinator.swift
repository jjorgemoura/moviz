//
//  PopularMoviesCoordinator.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class PopularMoviesCoordinator: Coordinator, Navigationable {

    private var movieCoordinator: MovieCoordinator?
    private var popularMoviesViewController: PopularMoviesViewController = PopularMoviesViewController()
    private var popularMoviesViewModel: PopularMoviesViewModel = PopularMoviesDefaultViewModel()
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        popularMoviesViewController.viewModel = popularMoviesViewModel
        popularMoviesViewController.delegate = self
        popularMoviesViewModel.delegate = popularMoviesViewController
        navigationController.pushViewController(popularMoviesViewController, animated: true)
    }
}

extension PopularMoviesCoordinator: PopularMoviesViewControllerDelegate {
    func didSelect(_ item: MovieViewModel) {
        movieCoordinator = MovieCoordinator(navigationController: navigationController, movieViewModel: item)
        movieCoordinator?.delegate = self
        movieCoordinator?.start()
    }
}

extension PopularMoviesCoordinator: MovieCoordinatorDelegate {
    func dismiss() {
        movieCoordinator = nil
    }
}
