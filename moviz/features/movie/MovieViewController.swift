//
//  MovieViewController.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var viewModel: FilmViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let posterImage = viewModel?.image, let movieView = view as? MovieView {
            movieView.showPoster(image: posterImage)
        }
    }
}
