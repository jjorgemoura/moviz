//
//  NetworkService.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

protocol NetworkService {

    func performCall<T: Decodable>(for request: Request) -> Single<T>
    func performCall(for request: Request) -> Single<Data>
}
