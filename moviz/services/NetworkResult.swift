//
//  NetworkResult.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

enum NetworkResult {
    case ok(data: Data)
    case httpError(code: Int)
    case error(message: Error)
    case noData
}
