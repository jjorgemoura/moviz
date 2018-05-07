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
    private let appSchedulers: AppSchedulers
    private var currentIndex: Int
    let service: MoviesService
    let title = "Popular Movies"
    var errorObservable: PublishSubject<String> = PublishSubject<String>()
    var popularMovies: [MovieViewModel] = [MovieViewModel]()

    weak var delegate: PopularMoviesViewModelDelegate?

    // MARK: - Initializers
    init(service: MoviesService = MoviesWebService(), appSchedulers: AppSchedulers = ProductionAppSchedulers()) {
        self.service = service
        self.appSchedulers = appSchedulers
        self.currentIndex = 1
    }

    func loadPopularMovies() {
        service.retrievePopularMovies(index: currentIndex)
            .subscribeOn(appSchedulers.background)
            .observeOn(appSchedulers.main)
            .subscribe(onSuccess: { popularMovies in
                let newMovies = popularMovies.results.map { MovieViewModel.build(filmData: $0) }
                self.popularMovies.append(contentsOf: newMovies)
                self.delegate?.dataUpdated()
            }, onError: { error in
                print(error)
                self.errorObservable.onNext(error.localizedDescription)
            })
            .disposed(by: bag)
    }

    func prepareDataFor(index: Int) {
        if popularMovies.count - index < 5 {
            currentIndex += 1
            loadPopularMovies()
        }
    }
}
