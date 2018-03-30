//
//  NetworkWebService.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

class NetworkWebService: NetworkService {

    func performGet(request: URLRequest, completion: @escaping (NetworkResult) -> Void) {

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let responseError = error {
                completion(.error(message: responseError))
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.httpError(code: httpResponse.statusCode))
                return
            }
            guard let data = data else {
                completion(.noData)
                return
            }

            completion(.ok(data: data))
        }
        task.resume()
    }
}
