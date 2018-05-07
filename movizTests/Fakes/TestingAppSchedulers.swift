//
//  TestingAppSchedulers.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import Foundation
import RxSwift

class TestingAppSchedulers: AppSchedulers {
    public let main: ImmediateSchedulerType = CurrentThreadScheduler.instance
    public let background: ImmediateSchedulerType = CurrentThreadScheduler.instance
}
