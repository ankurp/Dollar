//
//  DollarPerformanceTests.swift
//  Dollar
//
//  Created by Ankur Patel on 11/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import XCTest
import Dollar

class DollarPerformanceTests: XCTestCase {

    func testSwiftMapPerformance() {
        let testArr = (1...1000).map { $0 }
        self.measureBlock {
            let x = Swift.map(testArr) { $0 * 2 }
        }
    }
    func testDollarMapPerformance() {
        let testArr = (1...1000).map { $0 }
        self.measureBlock {
            let x = $.map(testArr) { $0 * 2 }
        }
    }

    let testArr = (1...1000).map { $0 }
    func testSwiftMaxPerformance() {
        self.measureBlock {
            let x = Swift.maxElement(self.testArr)
        }
    }
    func testDollarMaxPerformance() {
        self.measureBlock {
            let x = $.max(self.testArr)
        }
    }

}
