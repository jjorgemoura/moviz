//
//  PopularMoviesCoordinator.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class PopularMoviesCoordinator: Coordinator, Navigationable {

    private var popularMoviesViewController: PopularMoviesViewController = PopularMoviesViewController()
    private var popularMoviesViewModel: PopularMoviesViewModel = PopularMoviesDefaultViewModel()
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        popularMoviesViewController.viewModel = popularMoviesViewModel
        popularMoviesViewModel.delegate = popularMoviesViewController
        navigationController.pushViewController(popularMoviesViewController, animated: true)
    }
}
