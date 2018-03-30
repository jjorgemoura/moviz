//
//  NetworkWebServiceTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

private class FakeURLSession: URLSession {
    
    var returnNoData = false
    var sessionDataTask = FakeURLSessionDataTask()
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    
        if returnNoData {
            completionHandler(nil, nil, nil)
        }
        
        return sessionDataTask
    }
}

private class FakeURLSessionDataTask: URLSessionDataTask {
    
    override func resume() { }
}

class NetworkWebServiceTests: XCTestCase {
    
    var expectation: XCTestExpectation!
    
    func testNoData() {
        expectation = expectation(description: "Network Service Expectation")
        let requester = NetworkDefaultRequester()
        let request = requester.buildRequest(for: "")
        
        let fakeUrlSession = FakeURLSession()
        fakeUrlSession.returnNoData = true
        
        let networkService = NetworkWebService(urlSession: fakeUrlSession)
        
        networkService.performGet(request: request!) { networkResult in
            
            switch networkResult {
            case .noData:
                self.expectation.fulfill()
            default:
                return
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
