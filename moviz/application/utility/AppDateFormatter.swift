//
//  DateFormatter.swift
//  moviz
//
//  Created by Jorge Moura on 29/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation

class AppDateFormatter {

    static let apiFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    static let uiFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
}
