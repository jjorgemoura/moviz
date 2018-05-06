//
//  PopularMoviesDefaultViewModel.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

protocol PopularMoviesViewModelDelegate: class {

    func dataUpdated()
}

class PopularMoviesDefaultViewModel: PopularMoviesViewModel {

    private let bag: DisposeBag = DisposeBag()
    var popularMovies: [MovieViewModel] = [MovieViewModel]()
    let service: MoviesService
    let title = "Popular Movies"
    weak var delegate: PopularMoviesViewModelDelegate?

    // MARK: - Initializers
    init(service: MoviesService = MoviesWebService()) {
        self.service = service
    }

    func loadPopularMovies() {

        service.retrievePopularMovies(index: 1).subscribe(onSuccess: { popularMovies in

            DispatchQueue.main.async {
                self.popularMovies = popularMovies.results.map { MovieViewModel.build(filmData: $0) }
                self.delegate?.dataUpdated()
            }

        }) { _ in
            print("ERROR")
            }
            .disposed(by: bag)
    }
}
