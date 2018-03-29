//
//  PopularMoviesDefaultViewModel.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

protocol PopularMoviesViewModelDelegate: class {

    func dataUpdated()
}

class PopularMoviesDefaultViewModel: PopularMoviesViewModel {

    let service: MoviesService
    var popularMovies: [MovieViewModel] = [MovieViewModel]()
    let title = "Popular Movies"
    weak var delegate: PopularMoviesViewModelDelegate?

    init(service: MoviesService = MoviesWebService()) {
        self.service = service
    }

    func loadPopularMovies() {

        service.retrievePopularMovies(index: 1) { [weak self] popularMoviesList in
            DispatchQueue.main.async {
                self?.popularMovies = popularMoviesList.results.map { MovieViewModel.build(filmData: $0) }
                self?.delegate?.dataUpdated()
            }
        }
    }
}
