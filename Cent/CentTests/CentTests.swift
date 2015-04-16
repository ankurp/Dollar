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
        var result = ["A", "B", "C"].each({ arr.append($0) })
        XCTAssertEqual(result, ["A", "B", "C"], "Return array itself")
        XCTAssertEqual(Swift.join("", arr), "ABC", "Return string concatenated")
    }
    
    func testEqual() {
        XCTAssert(Optional("hello") == Optional("hello"), "optionalString and otherOptionalString should be equal.")
        XCTAssert(Optional("hello") != Optional("goodbye"), "optionalString and thirdOptionalString should not be equal.")
        XCTAssert(nil as String? == nil as String?, "Nil optionals should be equal.")
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
            TestDate(unit: .CalendarUnitSecond, singleMath: 1.second, multipleMath: multiple.seconds),
            TestDate(unit: .CalendarUnitMinute, singleMath: 1.minute, multipleMath: multiple.minutes),
            TestDate(unit: .CalendarUnitHour, singleMath: 1.hour, multipleMath: multiple.hours),
            TestDate(unit: .CalendarUnitDay, singleMath: 1.day, multipleMath: multiple.days),
            TestDate(unit: .CalendarUnitWeekOfYear, singleMath: 1.week, multipleMath: multiple.weeks),
            TestDate(unit: .CalendarUnitMonth, singleMath: 1.month, multipleMath: multiple.months),
            TestDate(unit: .CalendarUnitYear, singleMath: 1.year, multipleMath: multiple.years)
        ]

        tests.each { (test) -> () in
            func equalIsh(lhs: NSDate!, #rhs: NSDate!) -> Bool {
                return round(lhs.timeIntervalSinceNow) == round(rhs.timeIntervalSinceNow)
            }

            let components = NSDateComponents()
            components.setValue(1, forComponent: test.unit)

            XCTAssert(equalIsh(test.singleMath.fromNow, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: nil)), "formNow single units are equal.")
            components.setValue(-1, forComponent: test.unit)
            XCTAssert(equalIsh(test.singleMath.ago, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: nil)), "ago single units are equal.")

            components.setValue(multiple, forComponent: test.unit)
            XCTAssert(equalIsh(test.multipleMath.fromNow, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: nil)), "formNow multiple units are equal.")
            components.setValue(-multiple, forComponent: test.unit)
            XCTAssert(equalIsh(test.multipleMath.ago, rhs: calendar.dateByAddingComponents(components, toDate: NSDate(), options: nil)), "ago multiple units are equal.")
        }
    }
}
