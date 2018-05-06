//
//  NetworkHTTPDispatcher.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

public enum NetworkDispatcherError: Error {
    case deviceOffline
    case serviceUnavailable
    case unknown
    case nonHTTPResponse(response: URLResponse)
    case invalidUrl
}

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
                single(.error(NetworkDispatcherError.invalidUrl))
            }
            return Disposables.create()
        }
            .flatMap { [weak self] urlRequest -> Single<(HTTPURLResponse, Data)> in
                guard let strongSelf = self else {
                    return Single.error(NetworkDispatcherError.unknown)
                }
                return strongSelf.rxResponse(with: urlRequest, originatingRequest: request)
            }
    }

    private func rxResponse(with urlRequest: URLRequest, originatingRequest: Request) -> Single<(HTTPURLResponse, Data)> {
        return Single.create { single in

            let task = self.urlSession.dataTask(with: urlRequest) { data, response, error in

                guard let response = response, let data = data else {
                    let observableError: Error = NetworkDispatcherError.unknown
                    //                    if let error = error {
                    //                        switch (error as NSError).code {
                    //                        case kHTTPURLOffline,
                    //                             kHTTPURLConnectionFailure:
                    //                            observableError = NetworkDispatcherError.deviceOffline
                    //                        default:
                    //                            observableError = error
                    //                        }
                    //                    } else {
                    //                        observableError = NetworkDispatcherError.unknown
                    //                    }
                    single(.error(observableError))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    single(.error(NetworkDispatcherError.nonHTTPResponse(response: response)))
                    return
                }

                if httpResponse.statusCode == 503 {
                    single(.error(NetworkDispatcherError.serviceUnavailable))
                    return
                }

                single(.success((httpResponse, data)))
            }

            task.resume()
            return Disposables.create(with: task.cancel)
        }
    }
}
