//
//  Request.swift
//  moviz
//
//  Created by Jorge Moura on 04/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

protocol Request {

    func build() -> URLRequest?
}
