//
//  UnitTests.swift
//  UnitTests
//
//  Created by Richard Smith on 2020-09-27.
//

import XCTest

@testable import Matrix

#warning("Information regarding why the tests aren't working.")
class UnitTests: XCTestCase {
    func testInputValidator() {
        let inputValidator = InputValidator()

        inputValidator.validateInputtedCommands(inputtedCommands: nil) { (commands, correctInput) in
            XCTAssertNil(commands)
            XCTAssertFalse(correctInput)
        }
    }
}
