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
    
    /**
        Array Test Cases
    */
    
    func testArrayEach() {
        var arr: [String] = []
        let result = ["A", "B", "C"].each({ arr.append($0) })
        XCTAssertEqual(result, ["A", "B", "C"], "Return array itself")
        XCTAssertEqual(arr.joinWithSeparator(""), "ABC", "Return string concatenated")
    }
    
    func testArrayEachWhen() {
        var arr: [String] = []
        let result = ["A", "B", "C"].each(when: { return $0 <= "B"}, callback: { arr.append($0) });
        XCTAssertEqual(result, ["A", "B", "C"], "Return array itself")
        XCTAssertEqual(arr.joinWithSeparator(""), "AB", "Return string concatenated")
    }

    func testArrayCycle() {
        var result = ""
        [1, 2, 3].cycle(2) {
            print($0, separator: "", terminator: "", toStream: &result)
        }
        XCTAssertEqual("123123", result, "testCycle: Should return cycled pattern")
    }
    
    func testArrayEvery(){
        let result = ["angry", "hungry"].every { (a: String) -> (Bool) in
            a.hasSuffix("gry")
        }
        XCTAssertEqual(result, true, "testEvery: Should return true")
    }
    
    func testArrayIndexOf() {
        let array = ["foo", "spam", "bar", "eggs"]
        XCTAssertEqual(array.indexOf("spam"), 1, "Should return correct index")
    }
    
    func testArrayIndexOfReturnNill() {
        XCTAssertNil(["foo", "spam", "bar", "eggs"].indexOf("NONE"), "Should return nill when element not found")
    }

    func testArrayFetch(){
        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        XCTAssertNil(arr.fetch(100),"Should return nill")
        XCTAssertEqual(arr.fetch(100, orElse: 42), 42, "Should return orElse value")
        XCTAssertEqual(arr.fetch(-1), 8, "Should return last element")
    }
    
    func testArrayFindIndex(){
        let ind: Int? = ["foo", "bar", "spam", "eggs"].findIndex {
            $0.length == 4
        }
        XCTAssertEqual(2, ind!,"Should return correct index")
    }
    
    func testArrayFindLastIndex() {
        let ind: Int? = ["foo", "bar", "spam", "eggs"].findLastIndex {
            $0.length == 4
        }
        XCTAssertEqual(3, ind!,"Should return correct index")
    }
    
    func testArrayFirst() {
        XCTAssertEqual("foo", ["foo", "bar"].first(), "Should return first element")
    }
    
    func testArrayFlatten() {
        let unFlattened = ["foo", ["bar"], [["spam"]], [[["eggs"]]] ]
        let flattened = unFlattened.flatten()
        XCTAssertEqual(["foo", "bar", "spam", "eggs"], flattened, "Should return flattened array")
    }
    
    func testArrayGet(){
        let element = ["foo", "bar"].get(0)
        XCTAssertEqual("foo",element!, "Should return index element 0")
    
        let nothing = ["foo", "bar"].get(1000)
        XCTAssertNil(nothing, "Should return nill")
    }
    
    func testArrayInitial(){
        XCTAssertEqual(["foo", "bar", "spam"].initial(),["foo", "bar"], "Should return all but last")
        XCTAssertEqual(["foo", "bar", "spam"].initial(2),["foo"], "Should return all but last 2 elements")
    }

    func testArrayLast(){
        XCTAssertEqual(["foo", "bar"].last(),"bar", "Should return last element")
    }
    
    func testArrayRest(){
        XCTAssertEqual(["foo", "bar", "spam"].rest(2),["spam"], "Should return all but first 2 element")
        XCTAssertEqual(["foo", "bar", "spam"].rest(),["bar", "spam"], "Should return all but first element")
    }
    
    func testArrayMin(){
        XCTAssertEqual([1, 0, 2, 3].min(),0, "Should return minimum")
    }
    
    func testArrayMax(){
        XCTAssertEqual([1, 3, 0, 2].max(), 3, "Should return maximum")
    }
    
    func testArrayRemove() {
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
  
    func testArrayReduceWithIndex() {
        let str = ["A", "B", "C", "D", "E"].reduceWithIndex("") { (result, index, element) -> String in
          result + element + "\(index)"
        }
        XCTAssertEqual(str, "A0B1C2D3E4", "Should reduce array to element followed by the index of the element")
    }
    
    /**
        String Test Cases
    */
    
    func testSubscript() {
        XCTAssertEqual("Dollar and Cent"[0...5], "Dollar", "Return substring")
        XCTAssertEqual("Dollar and Cent"[7..<10], "and", "Return substring")
    }
  
    func testStringToWords() {
        let str = "The Dukes... ruined my life... over a bet? For how much?"
        let words = ["The", "Dukes", "ruined", "my", "life", "over", "a", "bet", "For", "how", "much"]
        XCTAssertEqual(str.words(), words, "Should split the string into words ignoring puncuation")
    }
  
    func testCompoundWordStringsToWords() {
        let str = "DollarAndCent dollar-and-cent"
        let words = ["Dollar", "And", "Cent", "dollar", "and", "cent"]
        XCTAssertEqual(str.words(), words, "Should split compound strings into words")
    }
  
    func testStringDeburr() {
        let str = "My Göd! Thé Dûkęs àrè gôïng tò cõrnėr the entīre frózen ôrange jūice mårket!"
        let match = "My God! The Dukes are going to corner the entire frozen orange juice market!"
        XCTAssertEqual(str.deburr(), match, "Should remove string of all accents and diacritics")
    }
  
    func contextCases(context: (testStrings: [String]) -> Void) {
        let testStrs = [
            "I will give you <50> bucks",
            "In Philàdèlphia, it is wõrth 50 bucks.",
            "--1-dollar__",
            "I believe we paid < 35000",
            "\tMerryNEWYear! 😊",
            "\nThis is *the* sports-watch of the '80s."
        ]
        context(testStrings: testStrs)
    }
  
    func testCamelCase() {
        contextCases { (testStrings) -> Void in
            let camelCased = testStrings.map({ (str) -> String in
                str.camelCase
            })
            let matches = [
                "iWillGiveYou50Bucks",
                "inPhiladelphiaItIsWorth50Bucks",
                "1Dollar",
                "iBelieveWePaid35000",
                "merryNewYear",
                "thisIsTheSportsWatchOfThe80S"
            ]
            XCTAssertEqual(camelCased, matches, "Should correctly camel case each string")
        }
    }
  
    func testKebabCase() {
        contextCases { (testStrings) -> Void in
            let kebabCase = testStrings.map({ (str) -> String in
                str.kebabCase
            })
            let matches = [
                "i-will-give-you-50-bucks",
                "in-philadelphia-it-is-worth-50-bucks",
                "1-dollar",
                "i-believe-we-paid-35000",
                "merry-new-year",
                "this-is-the-sports-watch-of-the-80s"
            ]
            XCTAssertEqual(kebabCase, matches, "Should correctly kebab case each string")
        }
    }
  
    func testSnakeCase() {
        contextCases { (testStrings) -> Void in
            let snakeCase = testStrings.map({ (str) -> String in
                str.snakeCase
            })
            let matches = [
                "i_will_give_you_50_bucks",
                "in_philadelphia_it_is_worth_50_bucks",
                "1_dollar",
                "i_believe_we_paid_35000",
                "merry_new_year",
                "this_is_the_sports_watch_of_the_80s"
            ]
            XCTAssertEqual(snakeCase, matches, "Should correctly snake case each string")
        }
    }
  
    func testStartCase() {
        contextCases { (testStrings) -> Void in
            let startCase = testStrings.map({ (str) -> String in
                str.startCase
            })
            let matches = [
                "I Will Give You 50 Bucks",
                "In Philadelphia It Is Worth 50 Bucks",
                "1 Dollar",
                "I Believe We Paid 35000",
                "Merry New Year",
                "This Is The Sports Watch Of The 80S"
            ]
            XCTAssertEqual(startCase, matches, "Should correctly start case each string")
        }
    }
  
    /**
        Regex Test Cases
    */
  
    func testRegex() {
        XCTAssertEqual("Dollar and Cent" =~ "and", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "and Cent$", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "\\sand\\s", true, "Should pattern match with regex string")
        XCTAssertEqual("Dollar and Cent" =~ "and Cent\\s+", false, "Should pattern match with regex string")
    }
    
    /**
        Int Test Cases
    */
    
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
    
    /**
        Dictionary Test Cases
    */

    func testDictionaryMerge() {
        let eastCoastStateCapitals = ["New York": "Albany", "Maryland":"Annapolis", "Connecticut":"Hartford" ]
        let westCoastStateCapitals = ["California": "Sacremento", "Washington":"Olympia"]
        var usStateCapitals: Dictionary<String, String> = [:]
        usStateCapitals.merge(eastCoastStateCapitals, westCoastStateCapitals)
        XCTAssertEqual(usStateCapitals, ["New York": "Albany", "Maryland":"Annapolis", "Connecticut":"Hartford" ,"California": "Sacremento", "Washington":"Olympia"])
    }
    
    func testArrayDifference() {
        let arr = ["B", "A", "C", "E", "D"]
        XCTAssertEqual(arr - ["C"], ["B", "A", "E", "D"], "Test removes C")
        XCTAssertEqual(arr - ["E", "C"], ["B", "A", "D"], "Test removes C and E")
    }
}
