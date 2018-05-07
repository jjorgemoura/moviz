//
//  RemoteHost.swift
//  moviz
//
//  Created by Jorge Moura on 05/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

protocol RemoteHost {

    var baseURL: String { get }
    var mandatoryQueryParameters: [String: String] { get }
}
