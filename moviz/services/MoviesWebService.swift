//
//  File.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import UIKit

class MoviesWebService: MoviesService {

    private enum Path {
        static let movie: String = "movie"
        static let popular: String = "popular"
    }

    let networkService: NetworkService
    let networkRequester: NetworkRequester

    init(networkService: NetworkService = NetworkWebService(), networkRequester: NetworkRequester = NetworkDefaultRequester()) {
        self.networkService = networkService
        self.networkRequester = networkRequester
    }

    func retrievePopularMovies(index: Int, completion: @escaping (PopularMoviesData) -> Void) {
        guard index >= 0 else {
            return
        }

        guard let request = networkRequester.request(endpointURL: path(forIndex: index)) else {
            print("BAD REQUEST URL")
            return
        }

        networkService.performGet(request: request) { networkResult in
            switch networkResult {
            case NetworkResult.ok(let data):
                self.parse(data: data, completion: completion)
            default:
                print("ERROR")
            }
        }
    }

    func loadPosterImage(url: String, completion: @escaping (UIImage) -> Void) {
        print(url)
        let fullUrl = "http://image.tmdb.org/t/p/w500" + url
        guard let request = networkRequester.completeRequest(endpointURL: fullUrl) else {
            print("BAD REQUEST URL")
            return
        }

        networkService.performGet(request: request) { networkResult in
            switch networkResult {
            case NetworkResult.ok(let data):

                print(data)
                let posterImage111 = UIImage(data: data, scale: 1.0)

                if let posterImage = UIImage(data: data, scale: 1.0) {
                    completion(posterImage)
                }
            default:
                print("ERROR")
            }
        }
    }

    private func parse(data: Data, completion: (PopularMoviesData) -> Void) {
        do {
            let result = try JSONDecoder().decode(PopularMoviesData.self, from: data)
            completion(result)
        } catch {
            print("Error : ", error)
        }
    }

    private func path(forIndex index: Int) -> String {
        return Path.movie.appending("/").appending(Path.popular)
    }
}
