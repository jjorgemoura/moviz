//
//  NetworkDefaultRequester.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

class NetworkDefaultRequester: NetworkRequester {

    static let baseURL: String = "https://api.themoviedb.org/3/"

    func buildRequest(for endpointURL: String, parameters: [String: String] = [:]) -> URLRequest? {
        let completeURL = NetworkDefaultRequester.baseURL.appending(endpointURL)

        if var fullUrl = URLComponents(string: completeURL) {
            fullUrl.queryItems = buildQueryItems(parameters: parameters, addDefaultParameters: true)

            if let url = fullUrl.url {
                return URLRequest(url: url)
            }
        }
        return nil
    }

    func request(for url: String) -> URLRequest? {
        if let url = URL(string: url) {
            return URLRequest(url: url)
        }
        return nil
    }

    private func buildQueryItems(parameters: [String: String], addDefaultParameters: Bool = false) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()

        for parameter in parameters {
            let queryParam = URLQueryItem(name: parameter.key, value: parameter.value)
            queryItems.append(queryParam)
        }

        if addDefaultParameters {
            let queryParamToken = URLQueryItem(name: "api_key", value: "bda9cb42c33e96c3a12bc16bc4b10554")
            let queryParamLanguage = URLQueryItem(name: "language", value: "en-US")
            queryItems.append(queryParamToken)
            queryItems.append(queryParamLanguage)
        }
        return queryItems
    }
}
