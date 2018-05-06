//
//  NetworkHTTPDispatcher.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

class NetworkHTTPDispatcher: NetworkDispatcher {

    let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func dispatch(request: Request) -> Single<(HTTPURLResponse, Data)> {
        return Single<URLRequest>.create { single in
            if let urlRequest = request.build() {
                single(.success(urlRequest))
            } else {
                single(.error(NetworkError.invalidUrl))
            }
            return Disposables.create()
        }
            .flatMap { [weak self] urlRequest -> Single<(HTTPURLResponse, Data)> in
                guard let strongSelf = self else {
                    return Single.error(NetworkError.unknown(message: "Network call was aborted!"))
                }
                return strongSelf.rxResponse(with: urlRequest, originatingRequest: request)
            }
    }

    private func rxResponse(with urlRequest: URLRequest, originatingRequest: Request) -> Single<(HTTPURLResponse, Data)> {
        return Single.create { single in
            let task = self.urlSession.dataTask(with: urlRequest) { data, response, error in

                guard let response = response, let data = data else {
                    if let error = error {
                        single(.error(NetworkError.unknown(message: error.localizedDescription)))
                    }
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    single(.error(NetworkError.nonHTTPResponse(response: response)))
                    return
                }

                if httpResponse.statusCode == 503 {
                    single(.error(NetworkError.serviceUnavailable))
                    return
                }

                single(.success((httpResponse, data)))
            }

            task.resume()
            return Disposables.create(with: task.cancel)
        }
    }
}
