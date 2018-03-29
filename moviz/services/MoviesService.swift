//
//  MoviesService.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

protocol MoviesService {

    func retrievePopularMovies(index: Int, completion: @escaping (PopularMoviesData) -> Void)
    func loadPosterImage(url: String, completion: @escaping (UIImage) -> Void)
}
