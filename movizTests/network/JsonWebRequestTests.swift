//
//  JsonWebRequestTests.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class JsonWebRequestTests: XCTestCase {

    func testBuildMethod() {
        let queryParameters = ["paramAKey": "paramAValue"]
        let resource = Resource(method: .get, url: "www.tests.com/movies", queryParameters: queryParameters, body: nil)

        let request = JsonWebRequest(resource: resource)

        let urlRequest = request.build()

        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, "www.tests.com/movies?paramAKey=paramAValue")
    }
}
