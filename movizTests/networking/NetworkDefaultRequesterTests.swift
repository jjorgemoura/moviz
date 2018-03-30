//
//  NetworkDefaultRequesterTests.swift
//  movizTests
//
//  Created by Jorge Moura on 30/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class NetworkDefaultRequesterTests: XCTestCase {
 
    let validRequest = "http://www.google.com"
    let invalidRequest = "google. .com"
    let validEndpointRequest = "films"
    
    func testBuildRequestValid() {
        let networkRequest = NetworkDefaultRequester()
        
        let urlRequest = networkRequest.buildRequest(for: validEndpointRequest)
        
        XCTAssertTrue((urlRequest?.url?.absoluteString.contains(validEndpointRequest))!)
    }
    
    func testBuildRequestInvalid() {
        let networkRequest = NetworkDefaultRequester()
        
        let urlRequest = networkRequest.buildRequest(for: "  ")
        
        XCTAssertNil(urlRequest)
    }
    
    func testRequestValid() {
        let networkRequest = NetworkDefaultRequester()
        
        let urlRequest = networkRequest.request(for: validRequest)
        
        XCTAssertEqual(urlRequest?.url?.absoluteString, validRequest)
    }
    
    func testRequestInvalid() {
        let networkRequest = NetworkDefaultRequester()
        
        let urlRequest = networkRequest.request(for: invalidRequest)
        
        XCTAssertNil(urlRequest)
    }
}
