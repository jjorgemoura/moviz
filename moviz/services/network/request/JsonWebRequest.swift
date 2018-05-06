//
//  JsonWebRequest.swift
//  moviz
//
//  Created by Jorge Moura on 05/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

struct JsonWebRequest: Request {

    //    let security: String
    //    let headerParameters: [String: String]
    let resource: Resource
    let timeout: Int = 10

    func build() -> URLRequest {

        if var fullUrl = URLComponents(string: resource.url) {
            fullUrl.queryItems = buildQueryItems(parameters: resource.queryParameters, addDefaultParameters: true)

            if let url = fullUrl.url {
                return URLRequest(url: url)
            }
        }

        return URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular")!)
    }

    private func buildQueryItems(parameters: [String: String], addDefaultParameters: Bool = false) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()

        for parameter in parameters {
            let queryParam = URLQueryItem(name: parameter.key, value: parameter.value)
            queryItems.append(queryParam)
        }

//        if addDefaultParameters {
//            let queryParamToken = URLQueryItem(name: NetworkConstants.QueryItemParameters.apiKey,
//                                               value: NetworkConstants.QueryItemParameterValues.apiKey)
//            let queryParamLanguage = URLQueryItem(name: NetworkConstants.QueryItemParameters.language,
//                                                  value: NetworkConstants.QueryItemParameterValues.language)
//            queryItems.append(queryParamToken)
//            queryItems.append(queryParamLanguage)
//        }
        return queryItems
    }
}
