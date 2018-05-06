//
//  FilmPosterWebService.swift
//  moviz
//
//  Created by Jorge Moura on 06/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

class FilmPosterWebService: FilmPosterService {

    private enum Path {
        static let movie: String = "movie"
        static let popular: String = "popular"
    }

    private let networkService: NetworkService
    private let remoteHost: RemoteHost

    // MARK: - Initializers
    init(networkService: NetworkService = NetworkWebService(), remoteHost: RemoteHost = ImageServiceRemoteHost()) {
        self.networkService = networkService
        self.remoteHost = remoteHost
    }

    func loadPosterImage(url: String) -> Single<Data> {
        let resource = Resource.buildGet(for: url, on: remoteHost)
        let request = JsonWebRequest(resource: resource)

        return networkService.performCall(for: request)
    }
}
