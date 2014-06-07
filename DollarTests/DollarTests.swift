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
        XCTAssert($.compact([3, nil, 4, 5]) as NSObject[] == [3, 4, 5], "Return truth array")
        XCTAssert($.compact([nil, nil]) as NSObject[] == [], "Return truth array")
    }
    
    func testFlatten() {
        XCTAssert($.flatten([[3], 4, 5]) as Int[] == [3, 4, 5], "Return flat array")
        XCTAssert($.flatten([[3], "Hello", 5]) as NSObject[] == [3, "Hello", 5], "Return flat array")
        XCTAssert($.flatten([[[3], 4], 5]) as Int[] == [3, 4, 5], "Return flat array")
    }
    
    func testIndexOf() {
        XCTAssert($.indexOf(["A", "B", "C"], value: "B") == 1, "Return index of value")
        XCTAssert($.indexOf([3, 4, 5], value: 5) == 2, "Return index of value")
        XCTAssert($.indexOf([3, 4, 5], value: 3) == 0, "Return index of value")
        XCTAssert($.indexOf([3, 4, 5], value: 2) == nil, "Return index of value")
    }

    func testInitial() {
        XCTAssert($.initial([3, 4, 5]) as Int[] == [3, 4], "Return all values except for last")
        XCTAssert($.initial([3, 4, 5], numElements: 2) as Int[] == [3], "Return all values except for last")
    }
    
    func testRest() {
        XCTAssert($.rest([3, 4, 5]) as Int[] == [4, 5], "Returns intersection")
        XCTAssert($.rest([3, 4, 5], numElements: 2) as Int[] == [5], "Returns intersection")
    }
    
    func testLast() {
        XCTAssert($.last([3, 4, 5]) as Int == 5, "Returns last element in array")
    }
    
}
