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

    private var movieViewController: MovieViewController = MovieViewController()
    private var filmViewModel: FilmViewModel
    weak var delegate: MovieCoordinatorDelegate?
    let navigationController: UINavigationController

    init(navigationController: UINavigationController, filmViewModel: FilmViewModel) {
        self.navigationController = navigationController
        self.filmViewModel = filmViewModel
    }

    func start() {
            movieViewController.viewModel = filmViewModel
            movieViewController.delegate = self
            navigationController.pushViewController(movieViewController, animated: true)
    }
}

extension MovieCoordinator: MovieViewControllerDelegate {

    func backButtonTapped() {
        navigationController.popViewController(animated: true)
//        movieViewController = nil
        delegate?.dismiss()
    }
}
