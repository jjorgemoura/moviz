//
//  NetworkRequester.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

protocol NetworkRequester {

    func buildRequest(for endpointURL: String, parameters: [String: String]) -> URLRequest?
    func request(for url: String) -> URLRequest?
}
