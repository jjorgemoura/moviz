//
//  ProductionAppSchedulers.swift
//  moviz
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

class ProductionAppSchedulers: AppSchedulers {
    public let main: ImmediateSchedulerType = MainScheduler.instance
    public let background: ImmediateSchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)
}
