//
//  File.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

enum MoviesServiceError: Error {
    case invalidCall
}

class MoviesWebService: MoviesService {

    private enum Path {
        static let movie: String = "movie"
        static let popular: String = "popular"
    }

    private enum QueryParametersKey {
        static let page: String = "page"
    }

    private let networkService: NetworkService
    private let remoteHost: RemoteHost

    // MARK: - Initializers
    init(networkService: NetworkService = NetworkWebService(), remoteHost: RemoteHost = RestRemoteHost()) {
        self.networkService = networkService
        self.remoteHost = remoteHost
    }

    func retrievePopularMovies(index: Int) -> Single<PopularMoviesData> {
        guard index >= 0 else {
            return Single.error(MoviesServiceError.invalidCall)
        }

        let resource = Resource.buildGet(for: path(), on: remoteHost, queryParameters: queryParameters(pageIndex: index))
        let request = JsonWebRequest(resource: resource)

        return networkService.performCall(for: request)
    }

    // MARK: - Private methods
    private func path() -> String {
        return Path.movie.appending("/").appending(Path.popular)
    }

    private func queryParameters(pageIndex: Int) -> [String: String] {

        return [QueryParametersKey.page: String(pageIndex)]
    }
}
