//
//  NetworkWebService.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

class NetworkWebService: NetworkService {

    let networkDispatcher: NetworkDispatcher

    init(networkDispatcher: NetworkDispatcher = NetworkHTTPDispatcher()) {
        self.networkDispatcher = networkDispatcher
    }

    func performCall<T: Decodable>(for request: Request) -> Single<T> {
        return networkDispatcher.dispatch(request: request).map { response, data -> T in
            if self.isStatusCodeSuccess(response.statusCode) {
                return try JSONDecoder().decode(T.self, from: data)
            } else {
                throw NetworkError.nonSuccessCode(response: response, data: data)
            }
        }
    }

    func performCall(for request: Request) -> Single<Data> {
        return networkDispatcher.dispatch(request: request).map { response, data -> Data in
            if self.isStatusCodeSuccess(response.statusCode) {
                return data
            } else {
                throw NetworkError.nonSuccessCode(response: response, data: data)
            }
        }
    }

    private func isStatusCodeSuccess(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
}
