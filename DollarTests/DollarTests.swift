//
//  DollarTests.swift
//  DollarTests
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import XCTest

class DollarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFirst() {
        XCTAssert($.first([1, 2, 3, 4]) as Double == 1, "Return first element")
        XCTAssert($.first([]) as NSNull == NSNull(), "Return first element")
    }
    
    func testNoop() {
        XCTAssert($.noop() as NSNull == NSNull(), "No op returns nothing")
    }
    
    func testCompact() {
        XCTAssert($.compact([3, 4, 5]) as Int[] == [3, 4, 5], "Return truth array")
    }
    
    func testFlatten() {
        XCTAssert($.flatten([[3], 4, 5], isShallow: false) as Int[] == [3, 4, 5], "Return flat array")
    }
    
    func testIndexOf() {
        XCTAssert($.indexOf([[3], 4, 5], value: 4) as Int == 1, "Return index of value")
    }
    
    func testInitial() {
        XCTAssert($.initial([3, 4, 5]) as Int[] == [3, 4], "Return all values except for last")
    }
    
    func testIntersection() {
        XCTAssert($.intersection([3, 4, 5], [3, 4]) as Int[] == [3, 4], "Returns intersection")
    }
    
    func testLast() {
        XCTAssert($.last([3, 4, 5]) as Int == 5, "Returns last element in array")
    }
    
}
