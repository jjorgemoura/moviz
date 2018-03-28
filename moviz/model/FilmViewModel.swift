//
//  Film.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

protocol FilmViewModelDelegate: class {

    func posterImageUpdated(image: UIImage)
}

class FilmViewModel {

    let identifier: Int
    let title: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let isFavourite: Bool = false
    var image: UIImage?

    private let service: MoviesService = MoviesWebService()
    weak var delegate: FilmViewModelDelegate?

    static func build(filmData: FilmData) -> FilmViewModel {
        return FilmViewModel(film: filmData)
    }

    init(film: FilmData) {
        self.identifier = film.identifier
        self.title = film.title
        self.overview = film.overview
        self.popularity = film.popularity
        self.posterPath = film.posterPath
        self.releaseDate = film.releaseDate
        self.voteAverage = film.voteAverage
    }

    func downloadPosterImage() {
        service.loadPosterImage(url: posterPath) { [weak self] posterImage in
            DispatchQueue.main.async {
                self?.image = posterImage
                self?.delegate?.posterImageUpdated(image: posterImage)
            }
        }
    }
}
