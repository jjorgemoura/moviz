//
//  FakeNetworkDispatcher.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest
import RxSwift

class FakeNetworkDispatcher: NetworkDispatcher {
    var httpResponse = HTTPURLResponse(url: URL(string: "https://www.test.com/")!, statusCode: 200, httpVersion: "", headerFields: [: ])
    var dataEncoded: Data?

    func dispatch(request: Request) -> Single<(HTTPURLResponse, Data)> {
        let response = (httpResponse!, dataEncoded!)
        return Single.just(response)
    }
}
