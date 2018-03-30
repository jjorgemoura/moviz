//
//  AppDateFormatterTests.swift
//  movizTests
//
//  Created by Jorge Moura on 29/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import XCTest

class AppDateFormatterTests: XCTestCase {

    let validApiDate = "2018-03-29"
    let validFormattedUIDate = "March 29, 2018"

    func testParsingAPIDateFormatterWithValidDate() {

        let formattedApiDate = AppDateFormatter.apiFormatter.date(from: validApiDate)
        let formattedUIDate = AppDateFormatter.uiFormatter.string(from: formattedApiDate!)

        XCTAssertEqual(formattedUIDate, validFormattedUIDate)
    }
}
