//
//  MovieViewController.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

protocol MovieViewControllerDelegate: class {

    func backButtonTapped()
}

class MovieViewController: UIViewController {

    var viewModel: FilmViewModel?
    weak var delegate: MovieViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(MovieViewController.back(sender:)))
        navigationItem.leftBarButtonItem = backButton

        if let posterImage = viewModel?.image, let movieView = view as? MovieView {
            movieView.showPoster(image: posterImage)
        }
    }

    @objc
    func back(sender: UIBarButtonItem) {
        delegate?.backButtonTapped()
    }

    deinit {
        print("MovieViewController -> deinit")
    }
}
