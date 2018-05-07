//
//  NetworkHTTPDispatcherTests.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest
import RxSwift
import RxBlocking

class NetworkHTTPDispatcherTests: XCTestCase {

    func testDispatch() {
        let urlSession = FakeURLSession()
        urlSession.dataToReturn = Data()
        urlSession.returnNoData = false
        let request: Request = JsonWebRequest(resource: Resource(method: .get, url: "www.tests.com/movies", queryParameters: [:], body: nil))

        let networkDispatcher = NetworkHTTPDispatcher(urlSession: urlSession)
        let responseData = try! networkDispatcher.dispatch(request: request).toBlocking().single()

        XCTAssertNotNil(responseData.0)
        XCTAssertNotNil(responseData.1)
    }

    func testDispatchReturnErrorWithNoData() {
        let urlSession = FakeURLSession()
        urlSession.returnNoData = true
        urlSession.errorToReturn = NetworkError.unknown(message: "TestError")
        let request: Request = JsonWebRequest(resource: Resource(method: .get, url: "www.tests.com/movies", queryParameters: [:], body: nil))

        let networkDispatcher = NetworkHTTPDispatcher(urlSession: urlSession)
        do {
            _ = try networkDispatcher.dispatch(request: request).toBlocking().single()
            XCTFail()
        } catch {
            if case NetworkError.unknown(message: _) = error {
                XCTAssertTrue(true)
            }
        }
    }
}
