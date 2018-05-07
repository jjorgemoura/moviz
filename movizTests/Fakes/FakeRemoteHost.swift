//
//  FakeRemoteHost.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
@testable import moviz

class FakeRemoteHost: RemoteHost {

    var baseURL: String = "www.tests.com/"
    var mandatoryQueryParameters: [String : String] = ["paramAKey": "paramAValue"]
}
