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
        XCTAssert($.first([]) == nil, "Return first element")
    }
    
    func testNoop() {
        XCTAssert($.noop() == nil, "No op returns nothing")
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
    
    func testFindIndex() {
        
    }
    
    func testFindLastIndex() {
        
    }
    
    func testFirstIndexOf() {
        
    }
    
    func testLastIndexOf() {
        
    }
    
    func testContains() {
        
    }
    
    func testRange() {
        XCTAssert($.range(4) as Int[] == [0, 1, 2, 3], "Generates range")
        XCTAssert($.range(1, endVal: 5) as Int[] == [1, 2, 3, 4], "Generates range")
        XCTAssert($.range(0, endVal: 20, incrementBy: 5) as Int[] == [0, 5, 10, 15], "Generates range")
    }
    
    func testRemove() {
        let result = $.remove([1, 2, 3, 4, 5, 6], iterator: { $0 as Int == 2 || $0 as Int == 3 })
        XCTAssert(result as Int[] == [1, 4, 5, 6], "Remove based on callback")
    }
    
    func testSortedIndex() {
        XCTAssert($.sortedIndex([3, 4, 6, 10], value: 5) as Int == 2, "Index to insert element at in a sorted array")
        XCTAssert($.sortedIndex([10, 20, 30, 50], value: 40) as Int == 3, "Index to insert element at in a sorted array")
    }
    
    func testWithout() {
        XCTAssert($.without([3, 4, 5, 3, 5], values: 3, 5) as Int[] == [4], "Removes elements passed after the array")
        XCTAssert($.without([3, 4, 5, 3, 5], values: 4) as Int[] == [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssert($.without([3, 4, 5, 3, 5], values: 3, 4, 5) as Int[] == [], "Removes elements passed after the array")
    }
    
    func testPull() {
        XCTAssert($.pull([3, 4, 5, 3, 5], values: 3, 5) as Int[] == [4], "Removes elements passed after the array")
        XCTAssert($.pull([3, 4, 5, 3, 5], values: 4) as Int[] == [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssert($.pull([3, 4, 5, 3, 5], values: 3, 4, 5) as Int[] == [], "Removes elements passed after the array")
    }
    
    func testZip() {
        let x = $.zip(["fred", "barney"], [30, 40], [true, false])
        XCTAssert(x as NSObject[] == [["fred", 30, true], ["barney", 40, false]], "Zip up arrays")

    }
    
}
