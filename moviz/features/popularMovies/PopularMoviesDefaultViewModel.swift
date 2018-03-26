//
//  PopularMoviesDefaultViewModel.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

class PopularMoviesDefaultViewModel: PopularMoviesViewModel {

    var popularMovies: [String] = [String]()

    func loadPopularMovies() {
        popularMovies = ["James Bond", "Indiana Jones", "Star Wars"]
    }
}
