//
//  ResourceTests.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class ResourceTests: XCTestCase {

    func testBuildGETMethod() {
        let remoteHost = FakeRemoteHost()
        let queryParameters = ["paramBKey": "paramBValue"]

        let resource = Resource.buildGet(for: "movies", on: remoteHost, queryParameters: queryParameters)

        XCTAssertEqual(resource.method, .get)
        XCTAssertEqual(resource.url, "www.tests.com/movies")
        XCTAssertNil(resource.body)
        XCTAssertEqual(resource.queryParameters.count, 2)
    }
}
