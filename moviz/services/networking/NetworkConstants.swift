//
//  NetworkConstants.swift
//  moviz
//
//  Created by Jorge Moura on 29/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

struct NetworkConstants {

    struct Domain {
        static let baseURL = "https://api.themoviedb.org/3/"
        static let imageServiceBaseURL = "http://image.tmdb.org/t/p/w500"
    }

    struct QueryItemParameters {
        static let apiKey = "api_key"
        static let language = "language"
    }

    struct QueryItemParameterValues {
        static let apiKey = "REPLACE WITH REAL API KEY"
        static let language = "en-US"
    }
}
