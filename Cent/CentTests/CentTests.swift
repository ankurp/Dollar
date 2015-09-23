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
        let result = ["A", "B", "C"].each({ arr.append($0) })
        XCTAssertEqual(result, ["A", "B", "C"], "Return array itself")
        XCTAssertEqual(arr.joinWithSeparator(""), "ABC", "Return string concatenated")
    }

    func testCycle() {
        var result = ""
        [1, 2, 3].cycle(2) {
            print($0, separator: "", terminator: "", toStream: &result)
        }
        XCTAssertEqual("123123", result, "testCycle: Should return cycled pattern")
    }
    
    func testEvery(){
        let result = ["angry", "hungry"].every { (a: String) -> (Bool) in
            a.hasSuffix("gry")
        }
        XCTAssertEqual(result, true, "testEvery: Should return true")
    }
    
    func testIndexOf() {
        let array = ["foo", "spam", "bar", "eggs"]
        XCTAssertEqual(array.indexOf("spam"), 1, "Should return correct index")
    }
    
    func testIndexOfReturnNillWhenNotFound() {
        XCTAssertNil(["foo", "spam", "bar", "eggs"].indexOf("NONE"), "Should return nill when element not found")
    }

    func testFetch(){
        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        XCTAssertNil(arr.fetch(100),"Should return nill")
        XCTAssertEqual(arr.fetch(100, orElse: 42), 42, "Should return orElse value")
        XCTAssertEqual(arr.fetch(-1), 8, "Should return last element")
    }
    
    func testDateMath() {
        struct TestDate {
            let unit: NSCalendarUnit
            let singleMath: Int.CalendarMath
            let multipleMath: Int.CalendarMath
        }

        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let multiple = 2

        let tests = [
            TestDate(unit: .Second, singleMath: 1.second, multipleMath: multiple.seconds),
            TestDate(unit: .Minute, singleMath: 1.minute, multipleMath: multiple.minutes),
            TestDate(unit: .Hour, singleMath: 1.hour, multipleMath: multiple.hours),
            TestDate(unit: .Day, singleMath: 1.day, multipleMath: multiple.days),
            TestDate(unit: .WeekOfYear, singleMath: 1.week, multipleMath: multiple.weeks),
            TestDate(unit: .Month, singleMath: 1.month, multipleMath: multiple.months),
            TestDate(unit: .Year, singleMath: 1.year, multipleMath: multiple.years)
        ]

        tests.each { (test) -> () in
            func equalIsh(lhs: NSDate!, rhs: NSDate!) -> Bool {
                return round(lhs.timeIntervalSinceNow) == round(rhs.timeIntervalSinceNow)
            }

            let components = NSDateComponents()
            components.setValue(1, forComponent: test.unit)

            XCTAssert(equalIsh(test.singleMath.fromNow, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: [])), "formNow single units are equal.")
            components.setValue(-1, forComponent: test.unit)
            XCTAssert(equalIsh(test.singleMath.ago, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: [])), "ago single units are equal.")

            components.setValue(multiple, forComponent: test.unit)
            XCTAssert(equalIsh(test.multipleMath.fromNow, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: [])), "formNow multiple units are equal.")
            components.setValue(-multiple, forComponent: test.unit)
            XCTAssert(equalIsh(test.multipleMath.ago, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: [])), "ago multiple units are equal.")
        }
    }
    
    func testRemoveArray() {
        var arr = ["A", "B", "C", "D", "E"]
        arr.remove("B")
        XCTAssertEqual(arr, ["A", "C", "D", "E"], "Test remove")
        
        arr.remove("Z")
        XCTAssertEqual(arr, ["A", "C", "D", "E"], "Remove element that does not exist")
    }
    
    func testArrayContains() {
        let arr = ["A", "B", "C", "D", "E"]
        XCTAssert(arr.contains("C"), "Test if array contains C")
        XCTAssertFalse(arr.contains("Z"), "Test of failure")
    }
}
