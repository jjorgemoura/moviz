//
//  FakeURLSession.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

class FakeURLSession: URLSession {

    var request: URLRequest!
    var returnNoData = false
    var responseBuilt: HTTPURLResponse?
    var dataToReturn: Data?
    var errorToReturn: Error?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.request = request
        if returnNoData {
            responseBuilt = nil
        } else {
            responseBuilt = HTTPURLResponse(url: URL(string: "https://www.test.com/")!, statusCode: 200, httpVersion: "", headerFields: [: ])
        }

        let sessionDataTask = FakeURLSessionDataTask(response: responseBuilt, completionHandler: completionHandler)
        sessionDataTask.fakeError = errorToReturn
        sessionDataTask.fakeData = dataToReturn
        return sessionDataTask
    }
}

class FakeURLSessionDataTask: URLSessionDataTask {

    private let fakeResponse: HTTPURLResponse?
    private let completionHandler: (Data?, URLResponse?, Error?) -> Void
    var fakeData: Data?
    var fakeError: Error?

    init(response: HTTPURLResponse?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.fakeResponse = response
        self.completionHandler = completionHandler
    }

    override func resume() {
        completionHandler(fakeData, fakeResponse, fakeError)
    }

    override func cancel() { }
}
