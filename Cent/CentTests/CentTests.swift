//
//  CentTests.swift
//  CentTests
//
//  Created by Ankur Patel on 10/16/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import XCTest

class CentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSubscript() {
        XCTAssertEqual("Dollar and Cent"[0...5], "Dollar", "Return substring")
        XCTAssertEqual("Dollar and Cent"[7..<10], "and", "Return substring")
    }

    func testRegex() {
        XCTAssertEqual("Dollar and Cent" =~ "and", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "and Cent$", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "\\sand\\s", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "and Cent\\s+", false, "Should pattern match with regex string")
    }
    
    func testEach() {
        var arr: [String] = []
        XCTAssertEqual(["A", "B", "C"].each({ arr.append($0) }), ["A", "B", "C"], "Return array itself")
        XCTAssertEqual(Swift.join("", arr), "ABC", "Return string concatenated")
    }
    
    func testEqual() {
        XCTAssert(Optional("hello") == Optional("hello"), "optionalString and otherOptionalString should be equal.")
        XCTAssert(Optional("hello") != Optional("goodbye"), "optionalString and thirdOptionalString should not be equal.")
        XCTAssert(nil as String? == nil as String?, "Nil optionals should be equal.")
    }
}
