//
//  NetworkDefaultRequester.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

class NetworkDefaultRequester: NetworkRequester {
    
    static let baseURL = "https://api.themoviedb.org/3/"
    
    func request(endpointURL: String) -> URLRequest? {
        let completeURL = NetworkDefaultRequester.baseURL.appending(endpointURL)

        if let url = URL(string: completeURL) {
            return URLRequest(url: url)
        }
        return nil
    }
    
    func completeRequest(endpointURL: String) -> URLRequest? {
        if let url = URL(string: endpointURL) {
            return URLRequest(url: url)
        }
        return nil
    }
}
