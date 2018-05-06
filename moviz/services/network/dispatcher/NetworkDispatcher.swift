//
//  NetworkDispatcher.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

protocol NetworkDispatcher {

    func dispatch(request: Request) -> Single<(HTTPURLResponse, Data)>
}
