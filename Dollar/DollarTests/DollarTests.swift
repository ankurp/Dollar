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
        XCTAssertEqualObjects($.first([1, 2, 3, 4, 5, 6, 7])!, 1, "Return first element")
        XCTAssertNil($.first([NSObject]()), "Returns nil when array is empty")
    }

    func testSecond() {
        XCTAssertEqualObjects($.second([1, 2, 3, 4, 5, 6, 7])!, 2, "Return second element")
        XCTAssertNil($.second([NSObject]()), "Returns nil when array is empty")
    }

    func testThird() {
        XCTAssertEqualObjects($.third([1, 2, 3, 4, 5, 6, 7])!, 3, "Return third element")
        XCTAssertNil($.third([NSObject]()), "Returns nil when array is empty")
    }
   
    func testFourth() {
        XCTAssertEqualObjects($.fourth([1, 2, 3, 4, 5, 6 , 7])!, 4, "Return fourth element")
        XCTAssertNil($.fourth([NSObject]()), "Returns nil when array is empty")
    }
   
    func testFifth() {
        XCTAssertEqualObjects($.fifth([1, 2, 3, 4, 5, 6, 7])!, 5, "Return fifth element")
        XCTAssertNil($.fifth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testSixth() {
        XCTAssertEqualObjects($.sixth([1, 2, 3, 4, 5, 6, 7])!, 6, "Return sixth element")
        XCTAssertNil($.sixth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testSeventh() {
        XCTAssertEqualObjects($.seventh([1, 2, 3, 4, 5, 6, 7])!, 7, "Return seventh element")
        XCTAssertNil($.seventh([NSObject]()), "Returns nil when array is empty")
    }
    /*
    Won't index
    func testEighth() {
        XCTAssertEqualObjects($.eighth([1, 2, 3, 4, 5, 6, 7, 8, 9])!, 8, "Return eighth element")
        XCTAssertNil($.eighth([NSObject]()), "Returns nil when array is empty")
    }
   
    func testNinth() {
        let result = $.ninth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!
        XCTAssertEqualObjects(result, 9, "Return ninth element")
        XCTAssertNil($.ninth([NSObject]()), "Returns nil when array is empty")
    }
   
    func testTenth() {
        XCTAssertEqualObjects($.tenth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 10, "Return tenth element")
        XCTAssertNil($.tenth([NSObject]()), "Returns nil when array is empty")
    }
    */
    
    
    func testNoop() {
        XCTAssertNil($.noop(), "No op returns nothing")
    }

    func testCompact() {
        XCTAssertEqualObjects($.compact([3, nil, 4, 5]), [3, 4, 5], "Return truth array")
        XCTAssertEqualObjects($.compact([nil, nil]) as [NSObject], [], "Return truth array")
    }

    func testFlatten() {
        XCTAssertEqualObjects($.flatten([[3], 4, 5]) as [Int], [3, 4, 5], "Return flat array")
        XCTAssertEqualObjects($.flatten([[3], "Hello", 5]) as [NSObject], [3, "Hello", 5], "Return flat array")
        XCTAssertEqualObjects($.flatten([[[3], 4], 5]) as [Int], [3, 4, 5], "Return flat array")
    }

    func testIndexOf() {
        XCTAssertEqualObjects($.indexOf(["A", "B", "C"], value: "B"), 1, "Return index of value")
        XCTAssertEqualObjects($.indexOf([3, 4, 5], value: 5), 2, "Return index of value")
        XCTAssertEqualObjects($.indexOf([3, 4, 5], value: 3), 0, "Return index of value")
        XCTAssertNil($.indexOf([3, 4, 5], value: 2), "Return index of value")
    }

    /*
    Fails
    func testInitial() {
        XCTAssertEqualObjects($.initial([3, 4, 5]), [3, 4], "Return all values except for last")
        XCTAssertEqualObjects($.initial([3, 4, 5], numElements: 2), [3], "Return all values except for last")
        XCTAssertEqualObjects($.initial([3, 4, 5], numElements: 4), [], "Return all values except for last")
    }
    */
    /*
    Fails with index out of range
    func testRest() {
        XCTAssertEqualObjects($.rest([3, 4, 5]), [4, 5], "Returns all value except for first")
        XCTAssertEqualObjects($.rest([3, 4, 5], numElements: 2), [5], "Returns all value except for first")
        XCTAssertEqualObjects($.rest([3, 4, 5], numElements: 4), [], "Returns all value except for first")
    }
    */
    
    func testLast() {
        XCTAssertEqualObjects($.last([3, 4, 5])!, 5, "Returns last element in array")
        XCTAssertNil($.last([NSObject]()), "Returns nil when array is empty")
    }

    func testFindIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        XCTAssertEqualObjects($.findIndex(arr) { $0["age"] < 20 }, 2, "Returns index of element in array")
    }

    func testFindLastIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        XCTAssertEqualObjects($.findLastIndex(arr) { $0["age"] > 30 }, 1, "Returns last index of element in array")
    }

    func testLastIndexOf() {
        XCTAssertEqualObjects($.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2), 4, "Returns last index of element in array")
    }

    func testContains() {
        XCTAssertTrue($.contains([1, 2, 3, 1, 2, 3], value: 2), "Checks if array contains element")
        XCTAssertFalse($.contains([1, 2, 3, 1, 2, 3], value: 10), "Checks if array contains element")
    }
    
    /*
    Crashes with EXC_BAD_ACCESS
    func testRange() {
        XCTAssertEqualObjects($.range(4), [0, 1, 2, 3], "Generates range")
        XCTAssertEqualObjects($.range(1, endVal: 5), [1, 2, 3, 4], "Generates range")
        XCTAssertEqualObjects($.range(0, endVal: 20, incrementBy: 5), [0, 5, 10, 15], "Generates range")
        XCTAssertEqualObjects($.range(4.0), [0.0, 1.0, 2.0, 3.0], "Generates range of doubles")
        XCTAssertEqualObjects($.range(-2.0, endVal: 2.0), [-2.0, -1.0, 0.0, 1.0], "Generates range of doubles")
        XCTAssertEqualObjects($.range(-10.0, endVal: 10.0, incrementBy: 5), [-10.0, -5.0, 0.0, 5.0], "Generates range of doubles")
    }*/
    /*
    Crashes with EXC_BAD_ACCESS
    func testSequence() {
        XCTAssertEqualObjects($.sequence(0...4), [0, 1, 2, 3], "Generates array of integers")
        XCTAssertEqualObjects($.sequence(-2.0...2.0), [-2.0, -1.0, 0.0, 1.0], "Generates array of doubles")
        XCTAssertEqualObjects($.sequence((0...20).by(5)), [0, 5, 10, 15], "Generates array with offset")
        // FIXME: EXC_BAD_INSTRUCTION (code=EXC_i386_INVOP, subcode=0x0) when "abc' is used with AssertEqualObjects
        // XCTAssertEqualObjects($.sequence("abc"), ["a", "b", "c"], "Generates array of characters")
        XCTAssert($.sequence("abc") == ["a", "b", "c"], "Generates array of characters")
    }*/

    func testRemove() {
        XCTAssertEqualObjects($.remove([1, 2, 3, 4, 5, 6], iterator: { $0 == 2 || $0 == 3 }), [1, 4, 5, 6], "Remove based on callback")
    }

    func testSortedIndex() {
        XCTAssertEqual($.sortedIndex([3, 4, 6, 10], value: 5), 2, "Index to insert element at in a sorted array")
        XCTAssertEqual($.sortedIndex([10, 20, 30, 50], value: 40), 3, "Index to insert element at in a sorted array")
    }

    /*
    Crashes with SIGABRT
    func testWithout() {
        XCTAssertEqualObjects($.without([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqualObjects($.without([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqualObjects($.without([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }*/

    /*
    Failed to index
    func testPull() {
        XCTAssertEqualObjects($.pull([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqualObjects($.pull([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqualObjects($.pull([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }*/

    func testZip() {
        //XCTAssertEqualObjects($.zip(["fred", "barney"], [30, 40], [true, false]) as [NSObject], [["fred", 30, true], ["barney", 40, false]], "Zip up arrays")
    }

    func testZipObject() {
        XCTAssertEqualObjects($.zipObject(["fred", "barney"], values: [30, 40]) as [String: Int], ["fred": 30, "barney": 40], "Zip up array to object")
    }

    /*
    Crashes with Out of range rest()
    func testIntersection() {
        XCTAssertEqualObjects($.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2], "Intersection of arrays")
    }
    */
    /*
    Crashes out of range rest()
    func testDifference() {
        XCTAssertEqualObjects($.difference([1, 2, 3, 4, 5], [5, 2, 10]), [1, 3, 4], "Difference of arrays")
        XCTAssertEqualObjects($.difference([1, 1, 1, 2, 2], [], [3]), [1, 1, 1, 2, 2], "Difference of arrays")
        XCTAssertEqualObjects($.difference([1, 1, 1, 2, 2], [1, 1], [3]), [2, 2], "Difference of arrays")
        XCTAssertEqualObjects($.difference([1, 1, 1, 2, 2], [1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqualObjects($.difference([1, 1, 1, 2, 2], [1, 1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqualObjects($.difference([1, 1, 1, 2, 2], []), [1, 1, 1, 2, 2], "Difference of arrays")
    }*/

    func testUniq() {
        XCTAssertEqualObjects($.uniq([1, 2, 1, 3, 1]), [1, 2, 3], "Uniq of arrays")
    }

    func testUnion() {
        XCTAssertEqualObjects($.union([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2, 3, 4, 5], "Union of arrays")
    }

    func testXOR() {
        XCTAssertEqualObjects($.xor([1, 2, 3], [5, 2, 1, 4]), [3, 4, 5], "Xor of arrays")
    }

    func testAt() {
        XCTAssertEqualObjects($.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4), ["ant", "cat", "egg"], "At of arrays")
    }

    func testEvery() {
        XCTAssertTrue($.every([1, 2, 3, 4]) { $0 < 20 }, "All elements in collection are true")
        XCTAssertFalse($.every([1, 2, 3, 4]) { $0 == 1 }, "All elements in collection are true")
    }

    func testFind() {
        XCTAssertEqualObjects($.find([1, 2, 3, 4], iterator: { $0 == 2 }), 2, "Return element when object is found")
        //XCTAssertEqualObjects($.find([1, 2, 3, 4], iterator: { $0 == 10 }), nil, "Return nil when object not found")
    }

    func testMax() {
        XCTAssert($.max([1, 2, 3, 4, 2, 1]) == 4, "Returns maximum element")
    }

    func testMin() {
        XCTAssert($.min([2, 1, 2, 3, 4]) == 1, "Returns minumum element")
    }

    /*
    No sample()
    func testSample() {
        let arr = [2, 1, 2, 3, 4]
        XCTAssertTrue($.contains(arr, value: $.sample(arr)), "Returns sample which is an element from the array")
    }*/

    func testPluck() {
        let arr = [["age": 20], ["age": 30], ["age": 40]]
        XCTAssertEqualObjects($.pluck(arr, value: "age"), [20, 30, 40], "Returns values from the object where they key is the value")
    }

    func testFrequencies() {
        XCTAssertEqualObjects($.frequencies(["a", "a", "b", "c", "a", "b"]), ["a": 3, "b": 2, "c": 1], "Returns correct frequency dictionary")
        XCTAssertEqualObjects($.frequencies([1,2,3,4,5]) { $0 % 2 == 0 }, [false: 3, true: 2], "Returns correct frequency dictionary from cond")
    }

    func testKeys() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqualObjects($.keys(dict), ["Dog", "Cat"], "Returns correct array with keys")
    }

    func testValues() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqualObjects($.values(dict), [1, 2], "Returns correct array with values")
    }
    
    func testMerge() {
        let dict  = ["Dog": 1, "Cat": 2]
        let dict2 = ["Cow": 3]
        let dict3 = ["Sheep": 4]
        XCTAssertEqualObjects($.merge(dictionaries: dict, dict2, dict3), ["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4], "Returns correct merged dictionary")

        let arr  = [1, 5]
        let arr2 = [2, 4]
        let arr3 = [5, 6]
        XCTAssertEqualObjects($.merge(arrays: arr, arr2, arr3), [1, 5, 2, 4, 5, 6], "Returns correct merged array")
    }

    func testPick() {
        let dict = ["Dog": 1, "Cat": 2, "Cow": 3]
        XCTAssertEqualObjects($.pick(dict, keys: "Dog", "Cow"), ["Dog": 1, "Cow": 3], "Returns correct picked dictionary")
    }
    
    func testOmit() {
        let dict = ["Dog": 1, "Cat": 2, "Cow": 3]
        XCTAssertEqualObjects($.omit(dict, keys: "Dog"), ["Cat": 2, "Cow": 3], "Returns correct omited dictionary")
    }

    func testTap() {
        var beatle = CarExample(name: "Fusca")
        $.tap(beatle, {$0.name = "Beatle"}).color = "Blue"

        XCTAssertEqualObjects(beatle.name, "Beatle", "Set the car name")
        XCTAssertEqualObjects(beatle.color, "Blue", "Set the car color")
    }
    
    /*
    Won't index correctly. Try breaking it apart into seperate cases.
    func testChaining() {
        var chain = $(array: [1, 2, 3])
        XCTAssertEqual(chain.first().invokeAll() as Int, 1, "Returns first element which ends the chain")

        chain = $(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqualObjects(chain.flatten().initial(2).value().invokeAll() as [Int], [1, 2, 3], "Returns flatten array from chaining")

        chain = $(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqual(chain.initial().flatten().first().invokeAll() as Int, 1, "Returns flatten array from chaining")

        chain = $(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqualObjects(chain.flatten().map({ (elem) in elem as Int * 10 }).value().invokeAll() as [Int], [10, 20, 30, 40, 50], "Returns mapped values")

        XCTAssertEqual(chain.first().invokeAll() as Int, 10, "Returns first element from mapped value")
        
        
        var elements: [Int] = []
        chain.each { elements += $0 as Int }.invokeAll()
        XCTAssertEqualObjects(elements as [Int], [10, 20, 30, 40, 50], "Goes through each element in the array")

        XCTAssertTrue(chain.all { ( $0 as Int) < 100 }.invokeAll(), "All elements are less than 100")
        XCTAssertFalse(chain.all { ($0 as Int) < 40 }.invokeAll(), "All elements are not less than 40")
        XCTAssertTrue(chain.any { ($0 as Int) < 40 }.invokeAll(), "At least one element is less than 40")

        elements = []
        chain.slice(0, end: 3).each({ elements += $0 as Int}).invokeAll()
        XCTAssertEqualObjects(elements as [Int], [10, 20, 30], "Chained seld")

    }
    */
    func testPartial() {
        let partialFunc = $.partial({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello")
        XCTAssertEqual(partialFunc("World", "Swift"), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testBind() {
        let helloWorldFunc = $.bind({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello", "World", "Swift")
        XCTAssertEqual(helloWorldFunc(), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    /*
    Fails
    func testTimes() {
        let fun = $.bind({ (names: String...) -> String in
            let people = $.join(names, separator: " from ")
            return "Hello \(people)"
            }, "Ankur", "Swift")
        XCTAssertEqualObjects($.times(3, function: fun) as [String], ["Hello Ankur from Swift", "Hello Ankur from Swift", "Hello Ankur from Swift"], "Call a function 3 times")
    }*/

    func testAfter() {
        var saves = ["profile", "settings"]
        let asyncSave = { (function: () -> ()?) in
            function()
        }
        var isDone = false
        var completeCallback = $.after(saves.count) {
            isDone = true
        }
        for elem in saves {
            asyncSave(completeCallback)
        }
        XCTAssertTrue(isDone, "Should be done")
    }
    /*
    EXC_BAD_ACCESS
    func testPartition() {
        var array = [1, 2, 3, 4, 5]
        
        XCTAssertEqualObjects($.partition(array, n: 2), [[1, 2], [3, 4]], "Partition uses n for step if not supplied.")
        XCTAssertEqualObjects($.partition(array, n: 2, step: 1), [[1, 2], [2, 3], [3, 4], [4, 5]], "Partition allows specifying a custom step.")
        XCTAssertEqualObjects($.partition(array, n: 2, step: 1, pad: nil), [[1, 2], [2, 3], [3, 4], [4, 5], [5]], "Partition with nil pad allows the last partition to be less than n length")
        XCTAssertEqualObjects($.partition(array, n: 4, step: 1, pad: nil), [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5]], "Partition with nil pad stops at the first partition less than n length.")
        XCTAssertEqualObjects($.partition(array, n: 2, step: 1, pad: [6,7,8]), [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]], "Partition pads the last partition to the right length.")
        XCTAssertEqualObjects($.partition(array, n: 4, step: 3, pad: [6]), [[1, 2, 3, 4], [4, 5, 6]], "Partition doesn't add more elements than pad has.")
        XCTAssertEqualObjects($.partition([1, 2, 3, 4, 5], n: 2, pad: [6]), [[1, 2], [3, 4], [5, 6]], "Partition with pad and no step uses n as step.")
        XCTAssertEqualObjects($.partition([1, 2, 3, 4, 5, 6], n: 2, step: 4), [[1, 2], [5, 6]], "Partition step length works.")
        XCTAssertEqualObjects($.partition(array, n: 10), [[]], "Partition without pad returns [[]] if n is longer than array.")
    }*/
    /*
    BAD_ACCESS
    func testPartitionAll() {
        var array = [1, 2, 3, 4, 5]
        
        XCTAssertEqualObjects($.partitionAll(array, n: 2, step: 1), [[1, 2], [2, 3], [3, 4], [4, 5], [5]], "PartitionAll includes partitions less than n.")
        XCTAssertEqualObjects($.partitionAll(array, n: 2), [[1, 2], [3, 4], [5]], "PartitionAll uses n as the step when not supplied.")
        XCTAssertEqualObjects($.partitionAll(array, n:4, step: 1), [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5], [4, 5], [5]], "PartitionAll does not stop at the first partition less than n length.")
    }*/
    
    func testPartitionBy() {
        XCTAssertEqualObjects($.partitionBy([1, 2, 3, 4, 5]) { $0 > 10 }, [[1, 2, 3, 4, 5]], "PartitionBy doesn't try to split unnecessarily.")
        XCTAssertEqualObjects($.partitionBy([1, 2, 4, 3, 5, 6]) { $0 % 2 == 0 }, [[1], [2, 4], [3, 5], [6]], "PartitionBy splits appropriately on Bool.")
        XCTAssertEqualObjects($.partitionBy([1, 7, 3, 6, 10, 12]) { $0 % 3 }, [[1, 7], [3, 6], [10], [12]], "PartitionBy can split on functions other than Bool.")
    }
    
    func testMap() {
        XCTAssertEqualObjects($.map([1, 2, 3, 4, 5]) { $0 * 2 }, [2, 4, 6, 8, 10], "Map function should double values in the array")
    }
    
    /*
    UIn8 not a subtype of @auto_closure()
    func testReduce() {
        XCTAssertEqual($.reduce([1, 2, 3, 4, 5], initial: 0) { $0 + $1 }, 15, "Reduce function should sum elements in the array")
    }
    */
    
    /*
    Bad_Access
    func testSlice() {
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 0, end: 2), [1, 2], "Slice subarray 0..2")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 0), [1, 2, 3, 4, 5], "Slice at 0 is whole array")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 3), [4, 5], "Slice with start goes till end")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 8), [], "Slice out of bounds is empty")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 8, end: 10), [], "Slice out of bounds is empty")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 8 , end: 2), [], "Slice with end < start is empty")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 3, end: 3), [], "Slice at x and x is empty")
        XCTAssertEqualObjects($.slice([1,2,3,4,5], start: 2, end: 5), [3,4,5], "Slice at x and x is subarray")
    }*/

    func testFib() {
        var times = 0
        let fibMemo = $.memoize { (fib: (Int -> Int), val: Int) -> Int in
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
        XCTAssertEqual($.id(1), 1, "Id should return the argument it gets passed")
    }

    /**
    *  Lazy Evaluation Section
    */
    
    /**
    *  Lazy evaluation of chained methods
    *  Test done through $ layer of iterator, iterator doesn't undergo testing
    */
    func testLazyChainedMethods(){
        //Create iterator
        let iterator:$.Iterator = $.lazy.map([[[[1],2],3],4,[5,[6,[7]]]], function: { return ($0 as Int) + 1 })

        var resultBool:Bool
        var resultInt:Int?
        var resultArray:[Int]
        
        //Chain Methods
        iterator.$.flatten().map{ (element:AnyObject) in
                return (element as Int) + 1;
            }.any{
                return ($0 as Int) < 2;
            }.all{
                return ($0 as Int) > 1;
            }.initial(2).first().second().third().eighth().value();
        
        //Step through each chained method
        while(iterator.$.countSteps() != 0){
            
            let stepsConsumeChain = (iterator.$.countSteps() == iterator.$.countChain());
            XCTAssertTrue(stepsConsumeChain,                     "When stepping, chain is consumed.");
            XCTAssertEqualObjects(iterator.$.lazyIndex, 0,      "Index never changes when stepping");
            
            switch(iterator.$.countChain()){
            
            case 10:
                resultArray = iterator.$.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [1,2,3,4,5,6,7], "Array flattened");
                break;
                
            case 9:
                resultArray = iterator.$.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6,7,8], "Array mapped: increment by 1");
                break;
            
            case 8:
                resultBool = iterator.$.step() as Bool;
                XCTAssertFalse(resultBool,                      "No element less than 2");
                break;
                
            case 7:
                resultBool = iterator.$.step() as Bool;
                XCTAssertTrue(resultBool,                       "All elements are greater than 1");
                break;
                
            case 6:
                resultArray = iterator.$.step() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6], "Last 2 elements removed");
                break;
                
            case 5:
                resultInt = iterator.$.step() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "First object in array");
                break;
                
            case 4:
                resultInt = iterator.$.step() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "Second object in array");
                break;
                
            case 3:
                resultInt = iterator.$.step() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "Third object in array");
                break;
                
            case 2:
                resultInt = iterator.$.step() as? Int;
                XCTAssertNil(resultInt,                         "Eighth object in array");
                break;
                
            case 1:
                resultArray = iterator.$.step() as [Int];
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
    *  Test done through $ layer of iterator, iterator doesn't undergo testing
    */
    func testForcedEvaluationOfChain(){
        //Create iterator
        let iterator:$.Iterator = $.lazy.map([[[[1],2],3],4,[5,[6,[7]]]], function: { return ($0 as Int) + 1 });
        
        //Chain methods
        iterator.$.flatten().map{ (element:AnyObject) in
                return (element as Int) + 1;
            }.any{
                return ($0 as Int) < 2;
            }.all{
                return ($0 as Int) > 1;
            }.initial(2).first().second().third().eighth().value();
        
        //Force evaluation
        var resultArray:[Int] = iterator.$.invokeAll() as [Int];
        
        XCTAssertEqualObjects(resultArray,                      [2,3,4,5,6], "Entire chain is evaluated immediately");
        
        //Chain's been consumed
        XCTAssertChainConsumed(iterator);
        
        
        
    }
    
    func XCTAssertChainConsumed(iterator:Dollar.Iterator){
        //All chained methods have been evaluated
        XCTAssertFalse(iterator.$.hasStep(),                    "No more steps available");
        XCTAssertFalse(iterator.$.hasChain(),                   "Chain has been consumed");
        XCTAssertFalse(iterator.$.hasStepBackward(),            "Chain has been consumed");
        var resultAny: AnyObject? = iterator.$.step() as? AnyObject
        XCTAssertNil(resultAny,                                 "Retuns nil when nothing's left to evaluate");
    }
    
    /**
    *  Lazy cycling of chained methods
    *  Test done through $ layer of iterator, iterator doesn't undergo testing
    */
    
    func testWalkThroughChain(){
        //Create iterator
        let iterator:$.Iterator = $.lazy.map([[[[1],2],3],4,[5,[6,[7]]]], function: { return ($0 as Int) + 1 });
        
        var resultArray:[Int]
        var resultInt:Int?
        var resultAny:AnyObject
        //Chain methods
        iterator.$.flatten().map{ (element:AnyObject) in
            return (element as Int) + 1;
            }.first().second().third().value();
        
        //Evaluate first two methods
        resultArray = iterator.$.step() as [Int];
        XCTAssertEqualObjects(resultArray,                      [1,2,3,4,5,6,7], "Array flattened");
        resultArray = iterator.$.step() as [Int];
        XCTAssertEqualObjects(resultArray,                      [2,3,4,5,6,7,8], "Array mapped: increment by 1");
        
        //Check number of steps in chain
        XCTAssertEqualObjects(iterator.$.countChain(),          4, "Steps waiting to be evaluated");
        
        //Walk through rest of chain
        for walk in 0...100{
            XCTAssertTrue(iterator.$.hasChain(),                "Will always have chain if walking");
            
            switch(walk%4){
            case 0:
                resultInt = iterator.$.walk() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "First object in array");
                break;
                
            case 1:
                resultInt = iterator.$.walk() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "Second object in array");
                break;
                
            case 2:
                resultInt = iterator.$.walk() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "Third object in array");
                break;
                
            case 3:
                resultArray = iterator.$.walk() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6,7,8], "Value of array");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        //Go back to beginning of chain
        iterator.$.resetChain();
        
        //Walk backwards through chain
        for walk in 0...100{
            XCTAssertTrue(iterator.$.hasChain(),                "Will always have chain if walking");
            
            switch(walk%4){
            case 3:
                resultInt = iterator.$.walkBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                2, "First object in array");
                break;
                
            case 2:
                resultInt = iterator.$.walkBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                3, "Second object in array");
                break;
                
            case 1:
                resultInt = iterator.$.walkBackward() as? Int;
                XCTAssertEqualObjects(resultInt,                4, "Third object in array");
                break;
                
            case 0:
                resultArray = iterator.$.walkBackward() as [Int];
                XCTAssertEqualObjects(resultArray,              [2,3,4,5,6,7,8], "Value of array");
                break;
                
            default:
                XCTAssertTrue(false,                            "Switch is not exhaustive")
            }
        }
        
        //Check number of steps in chain
        XCTAssertEqualObjects(iterator.$.countChain(),          4, "Number of steps to be evaluated hasn't changed");
        
        //Force evaluation of rest of chain
        var result = iterator.$.invokeAll() as [Int];
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
        let iterator:$.Iterator = $.lazy.map(initialArray, function: { return ($0 as Int) + 1 });
        
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
        
        resultArray = iterator.$.resultArray as [Int]
        XCTAssertEqualObjects(resultArray, initialArray,        "Lazy mapping doesn't change collection values");
    }
    
    /**
    *  Lazy cycling of iterator
    */
    func testLazyCycling(){
        let initialArray = [1,2,3,4]
        let iterator:$.Iterator = $.lazy.map(initialArray, function: { return ($0 as Int) + 1 });
        
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
        
        resultArray = iterator.$.resultArray as [Int]
        XCTAssertEqualObjects(resultArray, initialArray,        "Lazy mapping doesn't change collection values");
    }
}
