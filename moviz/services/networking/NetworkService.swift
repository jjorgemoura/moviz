//
//  NetworkService.swift
//  moviz
//
//  Created by Jorge Moura on 27/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

protocol NetworkService {

    func performGet(request: URLRequest, completion: @escaping (NetworkResult) -> Void)
}
