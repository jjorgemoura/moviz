//
//  Resource.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

struct Resource {

    let method: Method
    let url: String
    let queryParameters: [String: String]
    let body: Codable?

    static func buildGet(for endpoint: String, on host: RemoteHost, queryParameters: [String: String] = [:]) -> Resource {
        let url = host.baseURL.appending(endpoint)
        let endpointQueryParameters = queryParameters.merging(host.mandatoryQueryParameters) { current, _ -> String in current }

        return Resource(method: .get, url: url, queryParameters: endpointQueryParameters, body: nil)
    }
}
