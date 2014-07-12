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
        XCTAssertEqualObjects(Dollar<Any>.first([1, 2, 3, 4, 5, 6, 7])!, 1, "Return first element")
        XCTAssertNil(Dollar<Any>.first([NSObject]()), "Returns nil when array is empty")
    }

    func testSecond() {
        XCTAssertEqualObjects(Dollar<Any>.second([1, 2, 3, 4, 5, 6, 7])!, 2, "Return second element")
        XCTAssertNil(Dollar<Any>.second([NSObject]()), "Returns nil when array is empty")
    }

    func testThird() {
        XCTAssertEqualObjects(Dollar<Any>.third([1, 2, 3, 4, 5, 6, 7])!, 3, "Return third element")
        XCTAssertNil(Dollar<Any>.third([NSObject]()), "Returns nil when array is empty")
    }
   
    func testFourth() {
        XCTAssertEqualObjects(Dollar<Any>.fourth([1, 2, 3, 4, 5, 6 , 7])!, 4, "Return fourth element")
        XCTAssertNil(Dollar<Any>.fourth([NSObject]()), "Returns nil when array is empty")
    }
   
    func testFifth() {
        XCTAssertEqualObjects(Dollar<Any>.fifth([1, 2, 3, 4, 5, 6, 7])!, 5, "Return fifth element")
        XCTAssertNil(Dollar<Any>.fifth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testSixth() {
        XCTAssertEqualObjects(Dollar<Any>.sixth([1, 2, 3, 4, 5, 6, 7])!, 6, "Return sixth element")
        XCTAssertNil(Dollar<Any>.sixth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testSeventh() {
        XCTAssertEqualObjects(Dollar<Any>.seventh([1, 2, 3, 4, 5, 6, 7])!, 7, "Return seventh element")
        XCTAssertNil(Dollar<Any>.seventh([NSObject]()), "Returns nil when array is empty")
    }

    func testEighth() {
        XCTAssertEqualObjects(Dollar<Any>.eighth([1, 2, 3, 4, 5, 6, 7, 8, 9])!, 8, "Return eighth element")
        XCTAssertNil(Dollar<Any>.eighth([NSObject]()), "Returns nil when array is empty")
    }
   
    func testNinth() {
        XCTAssertEqualObjects(Dollar<Any>.ninth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 9, "Return ninth element")
        XCTAssertNil(Dollar<Any>.ninth([NSObject]()), "Returns nil when array is empty")
    }
   
    func testTenth() {
        XCTAssertEqualObjects(Dollar<Any>.tenth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 10, "Return tenth element")
        XCTAssertNil(Dollar<Any>.tenth([NSObject]()), "Returns nil when array is empty")
    }
    
    
    func testNoop() {
        XCTAssertNil(Dollar<Any>.noop(), "No op returns nothing")
    }

    func testCompact() {
        XCTAssertEqualObjects(Dollar<Any>.compact([3, nil, 4, 5]), [3, 4, 5], "Return truth array")
        XCTAssertEqualObjects(Dollar<Any>.compact([nil, nil]) as [NSObject], [], "Return truth array")
    }
/*
    func testFlatten() {
        XCTAssertEqualObjects(Dollar<AnyObject>.flatten([[3], 4, 5]) as [Int], [3, 4, 5], "Return flat array")
        XCTAssertEqualObjects(Dollar<Any>.flatten([[3], "Hello", 5]) as [NSObject], [3, "Hello", 5], "Return flat array")
        XCTAssertEqualObjects(Dollar<Any>.flatten([[[3], 4], 5]) as [Int], [3, 4, 5], "Return flat array")
    }
*/
    func testIndexOf() {
        XCTAssertEqualObjects(Dollar<Any>.indexOf(["A", "B", "C"], value: "B"), 1, "Return index of value")
        XCTAssertEqualObjects(Dollar<Any>.indexOf([3, 4, 5], value: 5), 2, "Return index of value")
        XCTAssertEqualObjects(Dollar<Any>.indexOf([3, 4, 5], value: 3), 0, "Return index of value")
        XCTAssertNil(Dollar<Any>.indexOf([3, 4, 5], value: 2), "Return index of value")
    }


    func testInitial() {
        XCTAssertEqualObjects(Dollar<Any>.initial([3, 4, 5]), [3, 4], "Return all values except for last")
        XCTAssertEqualObjects(Dollar<Any>.initial([3, 4, 5], numElements: 2), [3], "Return all values except for last")
        XCTAssertEqualObjects(Dollar<Any>.initial([3, 4, 5], numElements: 4), [], "Return all values except for last")
    }

    func testRest() {
        XCTAssertEqualObjects(Dollar<Any>.rest([3, 4, 5]), [4, 5], "Returns all value except for first")
        XCTAssertEqualObjects(Dollar<Any>.rest([3, 4, 5], numElements: 2), [5], "Returns all value except for first")
        XCTAssertEqualObjects(Dollar<Any>.rest([3, 4, 5], numElements: 4), [], "Returns all value except for first")
    }
    
    func testLast() {
        XCTAssertEqualObjects(Dollar<Any>.last([3, 4, 5])!, 5, "Returns last element in array")
        XCTAssertNil(Dollar<Any>.last([NSObject]()), "Returns nil when array is empty")
    }

    func testFindIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        XCTAssertEqualObjects(Dollar<Any>.findIndex(arr) { $0["age"] < 20 }, 2, "Returns index of element in array")
    }

    func testFindLastIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        XCTAssertEqualObjects(Dollar<Any>.findLastIndex(arr) { $0["age"] > 30 }, 1, "Returns last index of element in array")
    }

    func testLastIndexOf() {
        XCTAssertEqualObjects(Dollar<Any>.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2), 4, "Returns last index of element in array")
    }

    func testContains() {
        XCTAssertTrue(Dollar<Any>.contains([1, 2, 3, 1, 2, 3], value: 2), "Checks if array contains element")
        XCTAssertFalse(Dollar<Any>.contains([1, 2, 3, 1, 2, 3], value: 10), "Checks if array contains element")
    }
    
    /*
    Crashes with EXC_BAD_ACCESS
    func testRange() {
        XCTAssertEqualObjects(Dollar<Any>.range(4), [0, 1, 2, 3], "Generates range")
        XCTAssertEqualObjects(Dollar<Any>.range(1, endVal: 5), [1, 2, 3, 4], "Generates range")
        XCTAssertEqualObjects(Dollar<Any>.range(0, endVal: 20, incrementBy: 5), [0, 5, 10, 15], "Generates range")
        XCTAssertEqualObjects(Dollar<Any>.range(4.0), [0.0, 1.0, 2.0, 3.0], "Generates range of doubles")
        XCTAssertEqualObjects(Dollar<Any>.range(-2.0, endVal: 2.0), [-2.0, -1.0, 0.0, 1.0], "Generates range of doubles")
        XCTAssertEqualObjects(Dollar<Any>.range(-10.0, endVal: 10.0, incrementBy: 5), [-10.0, -5.0, 0.0, 5.0], "Generates range of doubles")
    }*/
    /*
    Crashes with EXC_BAD_ACCESS
    func testSequence() {
        XCTAssertEqualObjects(Dollar<Any>.sequence(0...4), [0, 1, 2, 3], "Generates array of integers")
        XCTAssertEqualObjects(Dollar<Any>.sequence(-2.0...2.0), [-2.0, -1.0, 0.0, 1.0], "Generates array of doubles")
        XCTAssertEqualObjects(Dollar<Any>.sequence((0...20).by(5)), [0, 5, 10, 15], "Generates array with offset")
        // FIXME: EXC_BAD_INSTRUCTION (code=EXC_i386_INVOP, subcode=0x0) when "abc' is used with AssertEqualObjects
        // XCTAssertEqualObjects(Dollar<Any>.sequence("abc"), ["a", "b", "c"], "Generates array of characters")
        XCTAssert(Dollar<Any>.sequence("abc") == ["a", "b", "c"], "Generates array of characters")
    }*/

    func testRemove() {
        XCTAssertEqualObjects(Dollar<Any>.remove([1, 2, 3, 4, 5, 6], iterator: { $0 == 2 || $0 == 3 }), [1, 4, 5, 6], "Remove based on callback")
    }

    func testSortedIndex() {
        XCTAssertEqual(Dollar<Any>.sortedIndex([3, 4, 6, 10], value: 5), 2, "Index to insert element at in a sorted array")
        XCTAssertEqual(Dollar<Any>.sortedIndex([10, 20, 30, 50], value: 40), 3, "Index to insert element at in a sorted array")
    }
    
    func testWithout() {
        XCTAssertEqualObjects(Dollar<Any>.without([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqualObjects(Dollar<Any>.without([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqualObjects(Dollar<Any>.without([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }

    func testPull() {
        XCTAssertEqualObjects(Dollar<Any>.pull([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqualObjects(Dollar<Any>.pull([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqualObjects(Dollar<Any>.pull([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }

    func testZip() {
        XCTAssertEqualObjects(Dollar<Any>.zip(["fred", "barney"], [30, 40], [true, false]) as [NSObject], [["fred", 30, true], ["barney", 40, false]], "Zip up arrays")
    }

    func testZipObject() {
        XCTAssertEqualObjects(Dollar<Any>.zipObject(["fred", "barney"], values: [30, 40]) as [String: Int], ["fred": 30, "barney": 40], "Zip up array to object")
    }

    func testIntersection() {
        XCTAssertEqualObjects(Dollar<Any>.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2], "Intersection of arrays")
    }

    func testDifference() {
        XCTAssertEqualObjects(Dollar<Any>.difference([1, 2, 3, 4, 5], [5, 2, 10]), [1, 3, 4], "Difference of arrays")
        XCTAssertEqualObjects(Dollar<Any>.difference([1, 1, 1, 2, 2], [], [3]), [1, 1, 1, 2, 2], "Difference of arrays")
        XCTAssertEqualObjects(Dollar<Any>.difference([1, 1, 1, 2, 2], [1, 1], [3]), [2, 2], "Difference of arrays")
        XCTAssertEqualObjects(Dollar<Any>.difference([1, 1, 1, 2, 2], [1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqualObjects(Dollar<Any>.difference([1, 1, 1, 2, 2], [1, 1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqualObjects(Dollar<Any>.difference([1, 1, 1, 2, 2], []), [1, 1, 1, 2, 2], "Difference of arrays")
    }

    func testUniq() {
        XCTAssertEqualObjects(Dollar<Any>.uniq([1, 2, 1, 3, 1]), [1, 2, 3], "Uniq of arrays")
    }

    func testUnion() {
        XCTAssertEqualObjects(Dollar<Any>.union([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2, 3, 4, 5], "Union of arrays")
    }

    func testXOR() {
        XCTAssertEqualObjects(Dollar<Any>.xor([1, 2, 3], [5, 2, 1, 4]), [3, 4, 5], "Xor of arrays")
    }

    func testAt() {
        XCTAssertEqualObjects(Dollar<Any>.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4), ["ant", "cat", "egg"], "At of arrays")
    }

    func testEvery() {
        XCTAssertTrue(Dollar<Any>.every([1, 2, 3, 4]) { $0 < 20 }, "All elements in collection are true")
        XCTAssertFalse(Dollar<Any>.every([1, 2, 3, 4]) { $0 == 1 }, "All elements in collection are true")
    }

    func testFind() {
        XCTAssertEqualObjects(Dollar<Any>.find([1, 2, 3, 4], iterator: { $0 == 2 }), 2, "Return element when object is found")
        //XCTAssertEqualObjects(Dollar<Any>.find([1, 2, 3, 4], iterator: { $0 == 10 }), nil, "Return nil when object not found")
    }

    func testMax() {
        XCTAssert(Dollar<Any>.max([1, 2, 3, 4, 2, 1]) == 4, "Returns maximum element")
    }

    func testMin() {
        XCTAssert(Dollar<Any>.min([2, 1, 2, 3, 4]) == 1, "Returns minumum element")
    }
    
    func testSample() {
        let arr = [2, 1, 2, 3, 4]
        XCTAssertTrue(Dollar<Any>.contains(arr, value: Dollar<Any>.sample(arr)), "Returns sample which is an element from the array")
    }
    
    func testPluck() {
        let arr = [["age": 20], ["age": 30], ["age": 40]]
        XCTAssertEqualObjects(Dollar<Any>.pluck(arr, value: "age"), [20, 30, 40], "Returns values from the object where they key is the value")
    }

    func testFrequencies() {
        XCTAssertEqualObjects(Dollar<Any>.frequencies(["a", "a", "b", "c", "a", "b"]), ["a": 3, "b": 2, "c": 1], "Returns correct frequency dictionary")
        XCTAssertEqualObjects(Dollar<Any>.frequencies([1,2,3,4,5]) { $0 % 2 == 0 }, [false: 3, true: 2], "Returns correct frequency dictionary from cond")
    }

    func testKeys() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqualObjects(Dollar<Any>.keys(dict), ["Dog", "Cat"], "Returns correct array with keys")
    }

    func testValues() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqualObjects(Dollar<Any>.values(dict), [1, 2], "Returns correct array with values")
    }
    
    func testMerge() {
        let dict  = ["Dog": 1, "Cat": 2]
        let dict2 = ["Cow": 3]
        let dict3 = ["Sheep": 4]
        XCTAssertEqualObjects(Dollar<Any>.merge(dictionaries: dict, dict2, dict3), ["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4], "Returns correct merged dictionary")

        let arr  = [1, 5]
        let arr2 = [2, 4]
        let arr3 = [5, 6]
        XCTAssertEqualObjects(Dollar<Any>.merge(arrays: arr, arr2, arr3), [1, 5, 2, 4, 5, 6], "Returns correct merged array")
    }

    func testPick() {
        let dict = ["Dog": 1, "Cat": 2, "Cow": 3]
        XCTAssertEqualObjects(Dollar<Any>.pick(dict, keys: "Dog", "Cow"), ["Dog": 1, "Cow": 3], "Returns correct picked dictionary")
    }
    
    func testOmit() {
        let dict = ["Dog": 1, "Cat": 2, "Cow": 3]
        XCTAssertEqualObjects(Dollar<Any>.omit(dict, keys: "Dog"), ["Cat": 2, "Cow": 3], "Returns correct omited dictionary")
    }

    func testTap() {
        var beatle = CarExample(name: "Fusca")
        Dollar<Any>.tap(beatle, { $0.name = "Beatle"}).color = "Blue"

        XCTAssertEqualObjects(beatle.name, "Beatle", "Set the car name")
        XCTAssertEqualObjects(beatle.color, "Blue", "Set the car color")
    }
    
    /*
    //Won't index correctly. Try breaking it apart into seperate cases.
    func testChaining() {
        var chain = Dollar<Any>(array: [1, 2, 3])
        XCTAssertEqual(chain.first().invokeAll() as Int, 1, "Returns first element which ends the chain")

        chain = Dollar<Any>(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqualObjects(chain.flatten().initial(2).value().invokeAll() as [Int], [1, 2, 3], "Returns flatten array from chaining")

        chain = Dollar<Any>(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqual(chain.initial().flatten().first().invokeAll() as Int, 1, "Returns flatten array from chaining")

        chain = Dollar<Any>(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqualObjects(chain.flatten().map({ (elem) in elem as Int * 10 }).value().invokeAll() as [Int], [10, 20, 30, 40, 50], "Returns mapped values")

        XCTAssertEqual(chain.first().invokeAll() as Int, 10, "Returns first element from mapped value")
        
        
        var elements: [Int] = []
        chain.each { elements += $0 as Int }.invokeAll()
        XCTAssertEqualObjects(elements as [Int], [10, 20, 30, 40, 50], "Goes through each element in the array")

        XCTAssertTrue(chain.all { ( $0 as Int) < 100 }.invokeAll(), "All elements are less than 100")
        /*XCTAssertFalse(chain.all { (Dollar0 as Int) < 40 }.invokeAll(), "All elements are not less than 40")*/
        XCTAssertTrue(chain.any { ($0 as Int) < 40 }.invokeAll(), "At least one element is less than 40")

        elements = []
        chain.slice(0, end: 3).each({ elements += $0 as Int}).invokeAll()
        XCTAssertEqualObjects(elements as [Int], [10, 20, 30], "Chained seld")

    }*/
    
    func testPartial() {
        let partialFunc = Dollar<Any>.partial({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello")
        XCTAssertEqual(partialFunc("World", "Swift"), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testBind() {
        let helloWorldFunc = Dollar<Any>.bind({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello", "World", "Swift")
        XCTAssertEqual(helloWorldFunc(), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testTimes() {
        let fun = Dollar<Any>.bind({ (names: String...) -> String in
            let people = Dollar<Any>.join(names, separator: " from ")
            return "Hello \(people)"
            }, "Ankur", "Swift")
        XCTAssertEqualObjects(Dollar<Any>.times(3, function: fun) as [String], ["Hello Ankur from Swift", "Hello Ankur from Swift", "Hello Ankur from Swift"], "Call a function 3 times")
    }

    func testAfter() {
        var saves = ["profile", "settings"]
        let asyncSave = { (function: () -> ()?) in
            function()
        }
        var isDone = false
        var completeCallback = Dollar<Any>.after(saves.count) {
            isDone = true
        }
        for elem in saves {
            asyncSave(completeCallback)
        }
       XCTAssertTrue(isDone, "Should be done")
    }
    /*
    BAD_ACCESS
    func testPartition() {
        var array = [1, 2, 3, 4, 5]
        
        XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 2), [[1, 2], [3, 4]], "Partition uses n for step if not supplied.")
        XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 2, step: 1), [[1, 2], [2, 3], [3, 4], [4, 5]], "Partition allows specifying a custom step.")
        XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 2, step: 1, pad: nil), [[1, 2], [2, 3], [3, 4], [4, 5], [5]], "Partition with nil pad allows the last partition to be less than n length")
        XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 4, step: 1, pad: nil), [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5]], "Partition with nil pad stops at the first partition less than n length.")
        XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 2, step: 1, pad: [6,7,8]), [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]], "Partition pads the last partition to the right length.")
        XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 4, step: 3, pad: [6]), [[1, 2, 3, 4], [4, 5, 6]], "Partition doesn't add more elements than pad has.")
        XCTAssertEqualObjects(Dollar<Any>.partition([1, 2, 3, 4, 5], n: 2, pad: [6]), [[1, 2], [3, 4], [5, 6]], "Partition with pad and no step uses n as step.")
        XCTAssertEqualObjects(Dollar<Any>.partition([1, 2, 3, 4, 5, 6], n: 2, step: 4), [[1, 2], [5, 6]], "Partition step length works.")
       XCTAssertEqualObjects(Dollar<Any>.partition(array, n: 10), [[]], "Partition without pad returns [[]] if n is longer than array.")
    }*/
    
    func testPartitionAll() {
        var array = [1, 2, 3, 4, 5]
        
        XCTAssertEqualObjects(Dollar<Any>.partitionAll(array, n: 2, step: 1), [[1, 2], [2, 3], [3, 4], [4, 5], [5]], "PartitionAll includes partitions less than n.")
        XCTAssertEqualObjects(Dollar<Any>.partitionAll(array, n: 2), [[1, 2], [3, 4], [5]], "PartitionAll uses n as the step when not supplied.")
        XCTAssertEqualObjects(Dollar<Any>.partitionAll(array, n:4, step: 1), [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5], [4, 5], [5]], "PartitionAll does not stop at the first partition less than n length.")
    }
    
    func testPartitionBy() {
        XCTAssertEqualObjects(Dollar<Any>.partitionBy([1, 2, 3, 4, 5]) { $0 > 10 }, [[1, 2, 3, 4, 5]], "PartitionBy doesn't try to split unnecessarily.")
        XCTAssertEqualObjects(Dollar<Any>.partitionBy([1, 2, 4, 3, 5, 6]) { $0 % 2 == 0 }, [[1], [2, 4], [3, 5], [6]], "PartitionBy splits appropriately on Bool.")
        XCTAssertEqualObjects(Dollar<Any>.partitionBy([1, 7, 3, 6, 10, 12]) { $0 % 3 }, [[1, 7], [3, 6], [10], [12]], "PartitionBy can split on functions other than Bool.")
    }
    
    func testMap() {
        XCTAssertEqualObjects(Dollar<Any>.map([1, 2, 3, 4, 5]) { $0 * 2 }, [2, 4, 6, 8, 10], "Map function should double values in the array")
    }
    
    /*
    //UInt8 is not a subtype
    func testReduce() {
        XCTAssertEqual(Dollar.reduce([1, 2, 3, 4, 5], initial: 0) { Dollar0 + Dollar1 }, 15, "Reduce function should sum elements in the array")
    }*/

    func testSlice() {
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 0, end: 2), [1, 2], "Slice subarray 0..2")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 0), [1, 2, 3, 4, 5], "Slice at 0 is whole array")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 3), [4, 5], "Slice with start goes till end")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 8), [], "Slice out of bounds is empty")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 8, end: 10), [], "Slice out of bounds is empty")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 8 , end: 2), [], "Slice with end < start is empty")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 3, end: 3), [], "Slice at x and x is empty")
        XCTAssertEqualObjects(Dollar<Any>.slice([1,2,3,4,5], start: 2, end: 5), [3,4,5], "Slice at x and x is subarray")
    }

    func testFib() {
        var times = 0
        let fibMemo = Dollar<Any>.memoize { (fib: (Int -> Int), val: Int) -> Int in
            times += 1
            return val == 1 || val == 0 ? 1 : fib(val - 1) + fib(val - 2)
        }
        let x = fibMemo(5)
        XCTAssertEqualObjects(times, 6, "Function called 6 times")
        times = 0
        let y = fibMemo(5)
        XCTAssertEqualObjects(times, 0, "Function called 0 times due to memoize")

        times = 0
        let z = fibMemo(6)
        XCTAssertEqualObjects(times, 1, "Function called 1 times due to memoize")
    }
    
   
    func testId() {
        XCTAssertEqual(Dollar<Any>.id(1), 1, "Id should return the argument it gets passed")
    }
    /*
    /**
    *  Lazy Evaluation Section
    */
    
    /**
    *  Lazy evaluation of chained methods
    *  Test done through Dollar layer of iterator, iterator doesn't undergo testing
    */
    func testLazyChainedMethods(){
        //Create iterator
        let iterator:Dollar.Iterator = Dollar.lazy.map([[[[1],2],3],4,[5,[6,[7]]]], function: { return (Dollar0 as Int) + 1 })

        var resultBool:Bool
        var resultInt:Int?
        var resultArray:[Int]
        
        //Chain Methods
        iterator.Dollar.flatten().map{ (element:AnyObject) in
                return (element as Int) + 1;
            }.any{
                return (Dollar0 as Int) < 2;
            }.all{
                return (Dollar0 as Int) > 1;
            }.initial(2).first().second().third().eighth().value();
        
        //Step through each chained method
        while(iterator.Dollar.countSteps() != 0){
            
            let stepsConsumeChain = (iterator.Dollar.countSteps() == iterator.Dollar.countChain());
            XCTAssertTrue(stepsConsumeChain,                     "When stepping, chain is consumed.");
            XCTAssertEqualObjects(iterator.Dollar.lazyIndex, 0,      "Index never changes when stepping");
            
            switch(iterator.Dollar.countChain()){
            
            case 10:
                resultArray = iterator.Dollar.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [1,2,3,4,5,6,7], "Array flattened");
                break;
                
            case 9:
                resultArray = iterator.Dollar.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6,7,8], "Array mapped: increment by 1");
                break;
            
            case 8:
                resultBool = iterator.Dollar.step() as Bool;
                XCTAssertFalse(resultBool,                      "No element less than 2");
                break;
                
            case 7:
                resultBool = iterator.Dollar.step() as Bool;
                XCTAssertTrue(resultBool,                       "All elements are greater than 1");
                break;
                
            case 6:
                resultArray = iterator.Dollar.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6], "Last 2 elements removed");
                break;
                
            case 5:
                resultInt = iterator.Dollar.step() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "First object in array");
                break;
                
            case 4:
                resultInt = iterator.Dollar.step() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "Second object in array");
                break;
                
            case 3:
                resultInt = iterator.Dollar.step() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "Third object in array");
                break;
                
            case 2:
                resultInt = iterator.Dollar.step() as? Int;
                XCTAssertNil(resultInt,                         "Eighth object in array");
                break;
                
            case 1:
                resultArray = iterator.Dollar.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6], "Final array of chained methods");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch statement is not exhaustive");
            }
        }
        
        //Chain's been consumed
        XCTAssertChainConsumed(iterator);
    }
    
    /**
    *  Forced evaluation of chained methods
    *  Test done through Dollar layer of iterator, iterator doesn't undergo testing
    */
    func testForcedEvaluationOfChain(){
        //Create iterator
        let iterator:Dollar.Iterator = Dollar.lazy.map([[[[1],2],3],4,[5,[6,[7]]]], function: { return (Dollar0 as Int) + 1 });
        
        //Chain methods
        iterator.Dollar.flatten().map{ (element:AnyObject) in
                return (element as Int) + 1;
            }.any{
                return (Dollar0 as Int) < 2;
            }.all{
                return (Dollar0 as Int) > 1;
            }.initial(2).first().second().third().eighth().value();
        
        //Force evaluation
        var resultArray:[Int] = iterator.Dollar.invokeAll() as [Int];
        
        XCTAssertEqualObjects(resultArray,                      [2,3,4,5,6], "Entire chain is evaluated immediately");
        
        //Chain's been consumed
        XCTAssertChainConsumed(iterator);
        
        
        
    }
    
    func XCTAssertChainConsumed(iterator:Dollar.Iterator){
        //All chained methods have been evaluated
        XCTAssertFalse(iterator.Dollar.hasStep(),                    "No more steps available");
        XCTAssertFalse(iterator.Dollar.hasChain(),                   "Chain has been consumed");
        XCTAssertFalse(iterator.Dollar.hasStepBackward(),            "Chain has been consumed");
        var resultAny: AnyObject? = iterator.Dollar.step() as? AnyObject
        XCTAssertNil(resultAny,                                 "Retuns nil when nothing's left to evaluate");
    }
    
    /**
    *  Lazy cycling of chained methods
    *  Test done through Dollar layer of iterator, iterator doesn't undergo testing
    */
    
    func testWalkThroughChain(){
        //Create iterator
        let iterator:Dollar.Iterator = Dollar.lazy.map([[[[1],2],3],4,[5,[6,[7]]]], function: { return (Dollar0 as Int) + 1 });
        
        var resultArray:[Int]
        var resultInt:Int?
        var resultAny:AnyObject
        //Chain methods
        iterator.Dollar.flatten().map{ (element:AnyObject) in
            return (element as Int) + 1;
            }.first().second().third().value();
        
        //Evaluate first two methods
        resultArray = iterator.Dollar.step() as [Int];
        XCTAssertEqualObjects(resultArray,                      [1,2,3,4,5,6,7], "Array flattened");
        resultArray = iterator.Dollar.step() as [Int];
        XCTAssertEqualObjects(resultArray,                      [2,3,4,5,6,7,8], "Array mapped: increment by 1");
        
        //Check number of steps in chain
        XCTAssertEqualObjects(iterator.Dollar.countChain(),          4, "Steps waiting to be evaluated");
        
        //Walk through rest of chain
        for walk in 0...100{
            XCTAssertTrue(iterator.Dollar.hasChain(),                "Will always have chain if walking");
            
            switch(walk%4){
            case 0:
                resultInt = iterator.Dollar.walk() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "First object in array");
                break;
                
            case 1:
                resultInt = iterator.Dollar.walk() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "Second object in array");
                break;
                
            case 2:
                resultInt = iterator.Dollar.walk() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "Third object in array");
                break;
                
            case 3:
                resultArray = iterator.Dollar.walk() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6,7,8], "Value of array");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        //Go back to beginning of chain
        iterator.Dollar.resetChain();
        
        //Walk backwards through chain
        for walk in 0...100{
            XCTAssertTrue(iterator.Dollar.hasChain(),                "Will always have chain if walking");
            
            switch(walk%4){
            case 3:
                resultInt = iterator.Dollar.walkBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "First object in array");
                break;
                
            case 2:
                resultInt = iterator.Dollar.walkBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "Second object in array");
                break;
                
            case 1:
                resultInt = iterator.Dollar.walkBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "Third object in array");
                break;
                
            case 0:
                resultArray = iterator.Dollar.walkBackward() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6,7,8], "Value of array");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        //Check number of steps in chain
        XCTAssertEqualObjects(iterator.Dollar.countChain(),          4, "Number of steps to be evaluated hasn't changed");
        
        //Force evaluation of rest of chain
        var result = iterator.Dollar.invokeAll() as [Int];
        XCTAssertEqualObjects(resultArray,                      [2,3,4,5,6,7,8], "Result of consuming chain");
        
        //Chain's been consumed
        XCTAssertChainConsumed(iterator);
    }
    
    /**
    *  Lazy evaluation of iterator
    */
    func testLazyMapping(){
        //Create iterator
        let initialArray = [1,2,3,4]
        let iterator:Dollar.Iterator = Dollar.lazy.map(initialArray, function: { return (Dollar0 as Int) + 1 });
        
        var resultArray:[Int]
        var resultInt:Int?
        var resultBool:Bool
        
        
        while(iterator.countNext() != 0){
            
            XCTAssertTrue(iterator.hasNext(),                   "Objects left to evaluate");
            
            switch(iterator.index){
            case 0:
                resultInt = iterator.next() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "1 added to first object");
                break;
                
            case 1:
                resultInt = iterator.next() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "1 added to second object");
                break;
                
            case 2:
                resultInt = iterator.next() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "1 added to third element");
                break;
                
            case 3:
                resultInt = iterator.next() as? Int;
                XCTAssertEqualObjects(resultInt,                5, "1 added to fourth element");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        XCTAssertFalse(iterator.hasNext(),                      "No elements left to evaluate");
        resultInt = iterator.next() as? Int;
        XCTAssertNil(resultInt,                                 "Returns nil when no more objects left to evaluate");
        
        XCTAssertTrue(iterator.hasPrevious(),                   "Previous objects in collection can be evaluated");
        
        while(iterator.countPrevious() != 0){
            
            switch(iterator.index){
            case 1:
                resultInt = iterator.previous() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "1 added to first object");
                break;
            case 2:
                resultInt = iterator.previous() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "1 added to second object");
                break;
            case 3:
                resultInt = iterator.previous() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "1 added to third element");
                break;
            case 4:
                resultInt = iterator.previous() as? Int;
                XCTAssertEqualObjects(resultInt,                5, "1 added to fourth element");
                break;
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        XCTAssertFalse(iterator.hasPrevious(),                  "No elements left to evaluate");
        resultInt = iterator.previous() as? Int;
        XCTAssertNil(resultInt,                                 "Returns nil when no more objects left to evaluate");
        
        resultArray = iterator.Dollar.resultArray as [Int]
        XCTAssertEqualObjects(resultArray, initialArray,        "Lazy mapping doesn't change collection values");
    }
    
    /**
    *  Lazy cycling of iterator
    */
    func testLazyCycling(){
        let initialArray = [1,2,3,4]
        let iterator:Dollar.Iterator = Dollar.lazy.map(initialArray, function: { return (Dollar0 as Int) + 1 });
        
        var resultArray:[Int]
        var resultInt:Int?
        var resultBool:Bool
        
        for next in 0...100{
            switch(next%4){
            case 0:
                resultInt = iterator.cycle() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "1 added to first object");
                break;
                
            case 1:
                resultInt = iterator.cycle() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "1 added to second object");
                break;
                
            case 2:
                resultInt = iterator.cycle() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "1 added to third element");
                break;
                
            case 3:
                resultInt = iterator.cycle() as? Int;
                XCTAssertEqualObjects(resultInt,                5, "1 added to fourth element");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        iterator.endIterator();
        XCTAssertFalse(iterator.hasNext(),                      "At end of collection");
        XCTAssertTrue(iterator.hasPrevious(),                   "Still able to go backwards");
        
        for next in 0...100{
            switch(next%4){
            case 3:
                resultInt = iterator.cycleBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "1 added to first object");
                break;
                
            case 2:
                resultInt = iterator.cycleBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "1 added to second object");
                break;
                
            case 1:
                resultInt = iterator.cycleBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "1 added to third element");
                break;
            
            case 0:
                resultInt = iterator.cycleBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                5, "1 added to fourth element");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        resultArray = iterator.Dollar.resultArray as [Int]
        XCTAssertEqualObjects(resultArray, initialArray,        "Lazy mapping doesn't change collection values");
    }*/
}
