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
//    func imageDownloaded()
}

class PopularMoviesDefaultViewModel: PopularMoviesViewModel {

    let service: MoviesService
    var popularMovies: [FilmViewModel] = [FilmViewModel]()
    let title: String = "Popular Movies"
    weak var delegate: PopularMoviesViewModelDelegate?

    init(service: MoviesService = MoviesWebService()) {
        self.service = service
    }

    func loadPopularMovies() {

        service.retrievePopularMovies(index: 1) { [weak self] popularMoviesList in
            DispatchQueue.main.async {
                self?.popularMovies = popularMoviesList.results.map { FilmViewModel.build(filmData: $0) }
                self?.delegate?.dataUpdated()
            }
        }
    }

//    func loadPosterImage(with url: String) {
//        service.loadPosterImage(url: url) { [weak self] posterImage in
//            DispatchQueue.main.async {
////                self?.popularMovies = popularMoviesList.results.map { Film.build(filmData: $0) }
//                
////                self?.delegate?.imageDownloaded()
//            }
//        }
//    }
}
