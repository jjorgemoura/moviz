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
    }

    struct QueryItemParameters {
        static let apiKey = "api_key"
        static let language = "language"
    }

    struct QueryItemParameterValues {
//        static let apiKey = "REPLACE WITH REAL API KEY"
        static let apiKey = "bda9cb42c33e96c3a12bc16bc4b10554"
        static let language = "en-US"
    }
}
