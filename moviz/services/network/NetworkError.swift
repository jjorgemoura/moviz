//
//  NetworkError.swift
//  moviz
//
//  Created by Jorge Moura on 06/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case deviceOffline
    case serviceUnavailable
    case invalidUrl
    case nonHTTPResponse(response: URLResponse)
    case nonSuccessCode(response: HTTPURLResponse, data: Data)
    case unknown(message: String)
}
