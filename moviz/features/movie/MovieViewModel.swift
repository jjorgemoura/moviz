//
//  Film.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

protocol MovieViewModelDelegate: class {

    func posterImageUpdated(image: UIImage)
}

class MovieViewModel {

    private let service: FilmPosterService
    private let bag: DisposeBag = DisposeBag()

    let identifier: Int
    let title: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let voteAverage: Int
    let isFavourite: Bool = false
    var image: UIImage?

    weak var delegate: MovieViewModelDelegate?

    // MARK: - Static method
    static func build(filmData: FilmData, service: FilmPosterService = FilmPosterWebService()) -> MovieViewModel {
        return MovieViewModel(film: filmData, service: service)
    }

    // MARK: - Initializers
    init(film: FilmData, service: FilmPosterService = FilmPosterWebService()) {
        self.service = service
        self.identifier = film.identifier
        self.title = film.title
        self.overview = film.overview
        self.popularity = film.popularity
        self.posterPath = film.posterPath

        if let formattedDate = AppDateFormatter.apiFormatter.date(from: film.releaseDate) {
            self.releaseDate = AppDateFormatter.uiFormatter.string(from: formattedDate)
        } else {
            self.releaseDate = ""
        }

        self.voteAverage = Int(film.voteAverage * 10)
    }

    func downloadPosterImage() {
        service.loadPosterImage(url: posterPath)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] imageData in
                if let posterImage = UIImage(data: imageData, scale: 1.0) {
                    self?.image = posterImage
                    self?.delegate?.posterImageUpdated(image: posterImage)
                }
        }) { error in
            print(error)
            }
            .disposed(by: bag)
    }
}
