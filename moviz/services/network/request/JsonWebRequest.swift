//
//  JsonWebRequest.swift
//  moviz
//
//  Created by Jorge Moura on 05/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

struct JsonWebRequest: Request {

    let resource: Resource
    let timeout: Int = 10

    func build() -> URLRequest? {
        if var fullUrl = URLComponents(string: resource.url) {
            fullUrl.queryItems = buildQueryItems(parameters: resource.queryParameters)

            if let url = fullUrl.url {
                return URLRequest(url: url)
            }
        }
        return nil
    }

    private func buildQueryItems(parameters: [String: String]) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        for parameter in parameters {
            let queryParam = URLQueryItem(name: parameter.key, value: parameter.value)
            queryItems.append(queryParam)
        }
        return queryItems
    }
}
