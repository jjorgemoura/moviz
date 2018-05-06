//
//  PopularMoviesViewModel.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

protocol PopularMoviesViewModel {

    var popularMovies: [MovieViewModel] { get set }
    var title: String { get }
    weak var delegate: PopularMoviesViewModelDelegate? { get set }

    func loadPopularMovies()
    func prepareDataFor(index: Int)
}
