//
//  DollarTests.swift
//  DollarTests
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import XCTest
import Dollar

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
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        let result = $.findIndex(arr) { $0["age"] < 20 }
        XCTAssert(result == 2, "Returns index of element in array")
    }
    
    func testFindLastIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        let result = $.findLastIndex(arr) { $0["age"] > 30 }
        XCTAssert(result == 1, "Returns last index of element in array")
    }
        
    func testLastIndexOf() {
        XCTAssert($.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2) == 4, "Returns last index of element in array")
    }
    
    func testContains() {
        XCTAssert($.contains([1, 2, 3, 1, 2, 3], value: 2) == true, "Checks if array contains element")
        XCTAssert($.contains([1, 2, 3, 1, 2, 3], value: 10) == false, "Checks if array contains element")
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
        XCTAssert($.zip(["fred", "barney"], [30, 40], [true, false]) as NSObject[] == [["fred", 30, true], ["barney", 40, false]], "Zip up arrays")
    }
    
    func testZipObject() {
        XCTAssert($.zipObject(["fred", "barney"], values: [30, 40]) as Dictionary<String, Int> == ["fred": 30, "barney": 40], "Zip up array to object")
    }
    
    func testIntersection() {
        XCTAssert($.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]) as Int[] == [1, 2], "Intersection of arrays")
    }
    
    func testDifference() {
        XCTAssert($.difference([1, 2, 3, 4, 5], [5, 2, 10]) as Int[] == [1, 3, 4], "Difference of arrays")
    }
    
    func testUniq() {
        XCTAssert($.uniq([1, 2, 1, 3, 1]) as Int[] == [1, 2, 3], "Uniq of arrays")
    }
    
    func testUnion() {
        XCTAssert($.union([1, 2, 3], [5, 2, 1, 4], [2, 1]) as Int[] == [1, 2, 3, 4, 5], "Union of arrays")
    }
    
    func testXOR() {
        let x = $.xor([1, 2, 3], [5, 2, 1, 4])
        XCTAssert(x as Int[] == [3, 4, 5], "Xor of arrays")
    }
    
    func testAt() {
        XCTAssert($.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4) as String[] == ["ant", "cat", "egg"], "At of arrays")
    }
    
    func testEvery() {
        XCTAssert($.every([1, 2, 3, 4], iterator: { $0 < 20 }) == true, "All elements in collection are true")
        XCTAssert($.every([1, 2, 3, 4], iterator: { $0 == 1 }) == false, "All elements in collection are true")
    }
    
    func testFind() {
        XCTAssert($.find([1, 2, 3, 4], iterator: { $0 == 2 }) == 2, "Return element when object is found")
        XCTAssert($.find([1, 2, 3, 4], iterator: { $0 == 10 }) == nil, "Return nil when object not found")
    }
    
    func testMax() {
        XCTAssert($.max([1, 2, 3, 4, 2, 1]) == 4, "Returns maximum element")
    }
    
    func testMin() {
        XCTAssert($.min([2, 1, 2, 3, 4]) == 1, "Returns minumum element")
    }
    
    func testSample() {
        let arr : Int[] = [2, 1, 2, 3, 4]
        XCTAssert($.contains(arr, value: $.sample(arr) as NSObject), "Returns sample which is an element from the array")
    }
    
    func testPluck() {
        let arr : Dictionary<String, Int>[] = [["age": 20], ["age": 30], ["age": 40]]
        XCTAssert($.pluck(arr, value: "age") == [20, 30, 40], "Returns values from the object where they key is the value")
    }
    
    func testFrequencies() {
        XCTAssert($.frequencies(["a", "a", "b", "c", "a", "b"]) == ["a": 3, "b": 2, "c": 1], "Returns correct frequency dictionary")
    }
    
}
