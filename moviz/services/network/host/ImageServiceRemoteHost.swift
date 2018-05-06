//
//  ExternalRemoteHost.swift
//  moviz
//
//  Created by Jorge Moura on 05/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

class ImageServiceRemoteHost: RemoteHost {

    var baseURL: String = "http://image.tmdb.org/t/p/w500"

    var mandatoryQueryParameters: [String: String] = [: ]
}
