//
//  AppSchedulers.swift
//  moviz
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import RxSwift

public protocol AppSchedulers {

    var main: ImmediateSchedulerType { get }
    var background: ImmediateSchedulerType { get }
}
