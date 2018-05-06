//
//  RestRemoteHost.swift
//  moviz
//
//  Created by Jorge Moura on 05/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

class RestRemoteHost: RemoteHost {

    private struct QueryItemParameters {
        static let apiKey = "api_key"
        static let language = "language"
    }

    private struct QueryItemParameterValues {
        static let apiKey = ""
        static let language = "en-US"
    }

    var baseURL: String = "https://api.themoviedb.org/3/"

    var mandatoryQueryParameters: [String: String] = {
        [QueryItemParameters.apiKey: QueryItemParameterValues.apiKey,
         QueryItemParameters.language: QueryItemParameterValues.language]
    }()
}
