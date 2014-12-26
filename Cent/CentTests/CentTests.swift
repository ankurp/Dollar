//
//  CentTests.swift
//  CentTests
//
//  Created by Ankur Patel on 10/16/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import UIKit
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
        
        let sub = "Dollar and Cent"[" [a-z]{3,} "]!
        XCTAssertEqual(sub, " and ", "Return substring based on regex")
    }

    func testRegex() {
        XCTAssertEqual("Dollar and Cent" =~ "and", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "and Cent$", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "\\sand\\s", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "and Cent\\s+", false, "Should pattern match with regex string")
    }
}
