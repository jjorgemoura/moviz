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

//        let resource = Resource(method: .get, url: "", queryParameters: [:], body: nil)
        let resource = Resource.buildGet(for: path(forIndex: 1), on: remoteHost)
        let request = JsonWebRequest(resource: resource)

        return networkService.performCall(for: request)

//        guard let request = networkRequester.buildRequest(for: path(forIndex: index), parameters: ["page": "1"]) else {
//            print("BAD REQUEST URL")
//            return
//        }
//
//        networkService.performGet(request: request) { networkResult in
//            switch networkResult {
//            case NetworkResult.ok(let data):
//                self.parse(data: data, completion: completion)
//            default:
//                print("ERROR")
//            }
//        }
    }

//    func loadPosterImage(url: String, completion: @escaping (UIImage) -> Void) {
//        let fullUrl = NetworkConstants.Domain.imageServiceBaseURL + url
//        guard let request = networkRequester.request(for: fullUrl) else {
//            print("BAD REQUEST URL")
//            return
//        }
//
//        networkService.performGet(request: request) { networkResult in
//            switch networkResult {
//            case NetworkResult.ok(let data):
//                if let posterImage = UIImage(data: data, scale: 1.0) {
//                    completion(posterImage)
//                }
//            default:
//                print("ERROR")
//            }
//        }
//    }

    // MARK: - Private methods
//    private func parse(data: Data, completion: (PopularMoviesData) -> Void) {
//        do {
//            let result = try JSONDecoder().decode(PopularMoviesData.self, from: data)
//            completion(result)
//        } catch {
//            print("Error : ", error)
//        }
//    }

    private func path(forIndex index: Int) -> String {
        return Path.movie.appending("/").appending(Path.popular)
    }
}
