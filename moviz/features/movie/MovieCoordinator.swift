//
//  MovieCoordinator.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

protocol MovieCoordinatorDelegate: class {
    func dismiss()
}

class MovieCoordinator: Coordinator, Navigationable {

    var movieViewController = MovieViewController()
    private var movieViewModel: MovieViewModel
    let navigationController: UINavigationController
    weak var delegate: MovieCoordinatorDelegate?

    // MARK: - Initializers
    init(navigationController: UINavigationController, movieViewModel: MovieViewModel) {
        self.navigationController = navigationController
        self.movieViewModel = movieViewModel
    }

    func start() {
        movieViewController.viewModel = movieViewModel
        movieViewController.delegate = self
        navigationController.pushViewController(movieViewController, animated: true)
    }
}

extension MovieCoordinator: MovieViewControllerDelegate {

    func backButtonTapped() {
        navigationController.popViewController(animated: true)
        delegate?.dismiss()
    }
}
