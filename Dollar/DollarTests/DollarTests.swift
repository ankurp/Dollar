//
//  DollarTests.swift
//  DollarTests
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import XCTest
import Dollar

extension XCTestCase {
    
    func XCTAssertEqualArrays<S, T>(first: [S], _ second: [T], _ test: String) {
        let diff: NSMutableArray = NSMutableArray(array: first._bridgeToObjectiveC())
        diff.removeObjectsInArray(second._bridgeToObjectiveC())
        XCTAssertTrue(diff.count == 0, test)
    }
    
    func XCTAssertNotEqualArrays <S, T> (first: [S], _ second: [T]) {
        XCTAssertNotEqual(first._bridgeToObjectiveC(), second._bridgeToObjectiveC())
    }
    
    func XCTAssertEqualDictionaries <S, T> (first: [S:T], _ second: [S:T]) {
        XCTAssertEqual(first._bridgeToObjectiveC(), second._bridgeToObjectiveC())
    }
    
}

class DollarTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFirst() {
        XCTAssertEqual($.first([1, 2, 3, 4])!, 1, "Return first element")
        XCTAssertNil($.first([NSObject]()), "Returns nil when array is empty")
    }

    func testSecond() {
        XCTAssertEqual($.second([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 2, "Return second element")
        XCTAssertNil($.second([NSObject]()), "Returns nil when array is empty")
    }
    
    func testThird() {
        XCTAssertEqual($.third([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 3, "Return third element")
        XCTAssertNil($.third([NSObject]()), "Returns nil when array is empty")
    }
    
    func testFourth() {
        XCTAssertEqual($.fourth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 4, "Return fourth element")
        XCTAssertNil($.fourth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testFifth() {
        XCTAssertEqual($.fifth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 5, "Return fifth element")
        XCTAssertNil($.fifth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testSixth() {
        XCTAssertEqual($.sixth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 6, "Return sixth element")
        XCTAssertNil($.sixth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testSeventh() {
        XCTAssertEqual($.seventh([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 7, "Return seventh element")
        XCTAssertNil($.seventh([NSObject]()), "Returns nil when array is empty")
    }
    
    func testEighth() {
        XCTAssertEqual($.eighth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 8, "Return eighth element")
        XCTAssertNil($.eighth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testNinth() {
        XCTAssertEqual($.ninth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 9, "Return ninth element")
        XCTAssertNil($.ninth([NSObject]()), "Returns nil when array is empty")
    }
    
    func testTenth() {
        XCTAssertEqual($.tenth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])!, 10, "Return tenth element")
        XCTAssertNil($.tenth([NSObject]()), "Returns nil when array is empty")
    }

    func testNoop() {
        XCTAssertNil($.noop(), "No op returns nothing")
    }

    func testCompact() {
        XCTAssert($.compact([3, nil, 4, 5]) == [3, 4, 5], "Return truth array")
        XCTAssertEqualArrays($.compact([nil, nil]) as [NSObject], [], "Return truth array")
    }

    func testFlatten() {
        XCTAssertEqualArrays($.flatten([[3], 4, 5]), [3, 4, 5], "Return flat array")
        XCTAssertEqualArrays($.flatten([[3], "Hello", 5]), [3, "Hello", 5], "Return flat array")
        XCTAssertEqualArrays($.flatten([[[3], 4], 5]), [3, 4, 5], "Return flat array")
    }
    
    func testShuffle() {
        XCTAssertEqualArrays($.shuffle([1]), [1], "Return shuffled array")
        XCTAssertEqual($.shuffle([1, 2, 3]).count, 3, "Return shuffled array")
    }

    func testIndexOf() {
        XCTAssertEqual($.indexOf(["A", "B", "C"], value: "B")!, 1, "Return index of value")
        XCTAssertEqual($.indexOf([3, 4, 5], value: 5)!, 2, "Return index of value")
        XCTAssertEqual($.indexOf([3, 4, 5], value: 3)!, 0, "Return index of value")
        XCTAssertNil($.indexOf([3, 4, 5], value: 2), "Return index of value")
    }

    func testInitial() {
        XCTAssertEqualArrays($.initial([3, 4, 5]), [3, 4], "Return all values except for last")
        XCTAssertEqualArrays($.initial([3, 4, 5], numElements: 2), [3], "Return all values except for last")
        XCTAssertEqualArrays($.initial([3, 4, 5], numElements: 4), [], "Return all values except for last")
    }

    func testRest() {
        XCTAssertEqualArrays($.rest([3, 4, 5]), [4, 5], "Returns all value except for first")
        XCTAssertEqualArrays($.rest([3, 4, 5], numElements: 2), [5], "Returns all value except for first")
        XCTAssertEqualArrays($.rest([3, 4, 5], numElements: 4), [], "Returns all value except for first")
    }

    func testLast() {
        XCTAssertEqual($.last([3, 4, 5])!, 5, "Returns last element in array")
        XCTAssertNil($.last([NSObject]()), "Returns nil when array is empty")
    }

    func testFindIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        XCTAssertEqual($.findIndex(arr) { $0["age"] < 20 }!, 2, "Returns index of element in array")
    }

    func testFindLastIndex() {
        let arr = [["age": 36], ["age": 40], ["age": 1]]
        XCTAssertEqual($.findLastIndex(arr) { $0["age"] > 30 }!, 1, "Returns last index of element in array")
    }

    func testLastIndexOf() {
        XCTAssertEqual($.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2)!, 4, "Returns last index of element in array")
    }

    func testContains() {
        XCTAssertTrue($.contains([1, 2, 3, 1, 2, 3], value: 2), "Checks if array contains element")
        XCTAssertFalse($.contains([1, 2, 3, 1, 2, 3], value: 10), "Checks if array contains element")
    }

    func testRange() {
        XCTAssertEqualArrays($.range(4), [0, 1, 2, 3], "Generates range")
        XCTAssertEqualArrays($.range(1, endVal: 5), [1, 2, 3, 4], "Generates range")
        XCTAssertEqualArrays($.range(0, endVal: 20, incrementBy: 5), [0, 5, 10, 15], "Generates range")
        XCTAssertEqualArrays($.range(4.0), [0.0, 1.0, 2.0, 3.0], "Generates range of doubles")
        XCTAssertEqualArrays($.range(-2.0, endVal: 2.0), [-2.0, -1.0, 0.0, 1.0], "Generates range of doubles")
        XCTAssertEqualArrays($.range(-10.0, endVal: 10.0, incrementBy: 5), [-10.0, -5.0, 0.0, 5.0], "Generates range of doubles")
    }

    func testSequence() {
//        XCTAssertEqualArrays($.sequence(0...4), [0, 1, 2, 3, 4], "Generates array of integers")
//        XCTAssertEqualArrays($.sequence(-2.0...2.0), [-2.0, -1.0, 0.0, 1.0, 2.0], "Generates array of doubles")
//        XCTAssertEqualArrays($.sequence((0...20).by(5)), [0, 5, 10, 15], "Generates array with offset")
        XCTAssertEqualArrays($.sequence("abc"), ["a", "b", "c"], "Generates array of characters")
    }

    func testRemove() {
        XCTAssertEqualArrays($.remove([1, 2, 3, 4, 5, 6], iterator: { $0 == 2 || $0 == 3 }), [1, 4, 5, 6], "Remove based on callback")
    }

    func testSortedIndex() {
        XCTAssertEqual($.sortedIndex([3, 4, 6, 10], value: 5), 2, "Index to insert element at in a sorted array")
        XCTAssertEqual($.sortedIndex([10, 20, 30, 50], value: 40), 3, "Index to insert element at in a sorted array")
    }

    func testWithout() {
        XCTAssertEqualArrays($.without([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqualArrays($.without([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqualArrays($.without([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }

    func testPull() {
        XCTAssertEqualArrays($.pull([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqualArrays($.pull([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqualArrays($.pull([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }

    func testZip() {
        XCTAssertTrue($.zip(["fred", "barney"], [30, 40], [true, false]) as [NSObject] == [["fred", 30, true], ["barney", 40, false]], "Zip up arrays")
    }

    func testZipObject() {
        XCTAssertTrue($.zipObject(["fred", "barney"], values: [30, 40]) as [String: Int] == ["fred": 30, "barney": 40], "Zip up array to object")
    }

    func testIntersection() {
        XCTAssertEqualArrays($.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2], "Intersection of arrays")
    }

    func testDifference() {
        XCTAssertEqualArrays($.difference([1, 2, 3, 4, 5], [5, 2, 10]), [1, 3, 4], "Difference of arrays")
        XCTAssertEqualArrays($.difference([1, 1, 1, 2, 2], [], [3]), [1, 1, 1, 2, 2], "Difference of arrays")
        XCTAssertEqualArrays($.difference([1, 1, 1, 2, 2], [1, 1], [3]), [2, 2], "Difference of arrays")
        XCTAssertEqualArrays($.difference([1, 1, 1, 2, 2], [1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqualArrays($.difference([1, 1, 1, 2, 2], [1, 1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqualArrays($.difference([1, 1, 1, 2, 2], []), [1, 1, 1, 2, 2], "Difference of arrays")
    }

    func testUniq() {
        XCTAssertEqualArrays($.uniq([1, 2, 1, 3, 1]), [1, 2, 3], "Uniq of arrays")
    }

    func testUnion() {
        XCTAssertEqualArrays($.union([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2, 3, 4, 5], "Union of arrays")
    }

    func testXOR() {
        XCTAssertEqualArrays($.xor([1, 2, 3], [5, 2, 1, 4]), [3, 4, 5], "Xor of arrays")
    }

    func testAt() {
        XCTAssertEqualArrays($.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4), ["ant", "cat", "egg"], "At of arrays")
    }

    func testEvery() {
        XCTAssertTrue($.every([1, 2, 3, 4]) { $0 < 20 }, "All elements in collection are true")
        XCTAssertFalse($.every([1, 2, 3, 4]) { $0 == 1 }, "All elements in collection are true")
    }

    func testFind() {
        XCTAssertEqual($.find([1, 2, 3, 4], iterator: { $0 == 2 })!, 2, "Return element when object is found")
        XCTAssertNil($.find([1, 2, 3, 4], iterator: { $0 == 10 }) as Int?, "Return nil when object not found")
    }

    func testMax() {
        XCTAssert($.max([1, 2, 3, 4, 2, 1]) == 4, "Returns maximum element")
    }

    func testMin() {
        XCTAssert($.min([2, 1, 2, 3, 4]) == 1, "Returns minumum element")
    }

    func testSample() {
        let arr = [2, 1, 2, 3, 4]
        XCTAssertTrue($.contains(arr, value: $.sample(arr)), "Returns sample which is an element from the array")
    }

    func testPluck() {
        let arr = [["age": 20], ["age": 30], ["age": 40]]
        XCTAssertEqualArrays($.pluck(arr, value: "age"), [20, 30, 40], "Returns values from the object where they key is the value")
    }

    func testFrequencies() {
        XCTAssertTrue($.frequencies(["a", "a", "b", "c", "a", "b"]) == ["a": 3, "b": 2, "c": 1], "Returns correct frequency dictionary")
//        XCTAssertTrue($.frequencies([1,2,3,4,5]) { $0 % 2 == 0 } == [false: 3, true: 2], "Returns correct frequency dictionary from cond")
    }

    func testKeys() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqualArrays($.keys(dict), ["Dog", "Cat"], "Returns correct array with keys")
    }

    func testValues() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqualArrays($.values(dict), [1, 2], "Returns correct array with values")
    }
    
    func testMerge() {
        let dict  = ["Dog": 1, "Cat": 2]
        let dict2 = ["Cow": 3]
        let dict3 = ["Sheep": 4]
        XCTAssertTrue($.merge(dictionaries: dict, dict2, dict3) == ["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4], "Returns correct merged dictionary")

        let arr  = [1, 5]
        let arr2 = [2, 4]
        let arr3 = [5, 6]
        XCTAssertEqualArrays($.merge(arrays: arr, arr2, arr3), [1, 5, 2, 4, 5, 6], "Returns correct merged array")
    }

    func testPick() {
        let dict = ["Dog": 1, "Cat": 2, "Cow": 3]
        XCTAssertTrue($.pick(dict, keys: "Dog", "Cow") == ["Dog": 1, "Cow": 3], "Returns correct picked dictionary")
    }

    func testOmit() {
        let dict = ["Dog": 1, "Cat": 2, "Cow": 3]
        XCTAssertTrue($.omit(dict, keys: "Dog") == ["Cat": 2, "Cow": 3], "Returns correct omited dictionary")
    }

    func testTap() {
        var beatle = CarExample(name: "Fusca")
        $.tap(beatle, {$0.name = "Beatle"}).color = "Blue"

        XCTAssertEqual(beatle.name!, "Beatle", "Set the car name")
        XCTAssertEqual(beatle.color!, "Blue", "Set the car color")
    }

    func testChaining() {
        var chain = $(array: [1, 2, 3])
        XCTAssertEqual(chain.first().value()! as Int, 1, "Returns first element which ends the chain")

        chain = $(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqualArrays(chain.flatten().initial(2).value()! as [Int], [1, 2, 3], "Returns flatten array from chaining")

        chain = $(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqual(chain.initial().flatten().first().value()! as Int, 1, "Returns flatten array from chaining")

        chain = $(array: [[1, 2], 3, [[4], 5]])
        XCTAssertEqualArrays(chain.flatten().map({ (elem) in elem as Int * 10 }).value()! as [Int], [10, 20, 30, 40, 50], "Returns mapped values")

        XCTAssertEqual(chain.flatten().map({ (elem) in elem as Int * 10 }).first().value()! as Int, 100, "Returns first element from mapped value")

        chain = $(array: [10, 20, 30, 40, 50])
        var elements: [Int] = []
        chain.each { elements.append($0 as Int) }
        chain.value()
        XCTAssertEqualArrays(elements as [Int], [10, 20, 30, 40, 50], "Goes through each element in the array")

//        XCTAssertTrue(chain.all({ $0 < 100 }).value()!, "All elements are less than 100")
//        XCTAssertFalse(chain.all({ $0 < 40 }).value()!, "All elements are not less than 40")
//        XCTAssertTrue(chain.any({ $0 < 40 }).value()!, "At least one element is less than 40")

//        elements = []
//        chain.slice(0, end: 3).each({ elements += $0 as Int})
//        XCTAssertTrue(elements == [10, 20, 30], "Chained seld")

    }

    func testPartial() {
        let partialFunc = $.partial({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello")
        XCTAssertEqual(partialFunc("World", "Swift"), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testBind() {
        let helloWorldFunc = $.bind({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello", "World", "Swift")
        XCTAssertEqual(helloWorldFunc(), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testTimes() {
        let fun = $.bind({ (names: String...) -> String in
            let people = $.join(names, separator: " from ")
            return "Hello \(people)"
            }, "Ankur", "Swift")
        XCTAssertEqualArrays($.times(3, function: fun) as [String], ["Hello Ankur from Swift", "Hello Ankur from Swift", "Hello Ankur from Swift"], "Call a function 3 times")
    }

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
    
//    func testPartition() {
//        var array = [1, 2, 3, 4, 5]
//        
//        XCTAssertTrue($.partition(array, n: 2) == [[1, 2], [3, 4]], "Partition uses n for step if not supplied.")
////        XCTAssertTrue($.partition(array, n: 2, step: 1) == [[1, 2], [2, 3], [3, 4], [4, 5]], "Partition allows specifying a custom step.")
//        XCTAssertTrue($.partition(array, n: 2, step: 1, pad: nil) == [[1, 2], [2, 3], [3, 4], [4, 5], [5]], "Partition with nil pad allows the last partition to be less than n length")
//        XCTAssertTrue($.partition(array, n: 4, step: 1, pad: nil) == [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5]], "Partition with nil pad stops at the first partition less than n length.")
//        XCTAssertTrue($.partition(array, n: 2, step: 1, pad: [6,7,8]) == [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]], "Partition pads the last partition to the right length.")
//        XCTAssertTrue($.partition(array, n: 4, step: 3, pad: [6]) == [[1, 2, 3, 4], [4, 5, 6]], "Partition doesn't add more elements than pad has.")
//        XCTAssertTrue($.partition([1, 2, 3, 4, 5], n: 2, pad: [6]) == [[1, 2], [3, 4], [5, 6]], "Partition with pad and no step uses n as step.")
////        XCTAssertTrue($.partition([1, 2, 3, 4, 5, 6], n: 2, step: 4) == [[1, 2], [5, 6]], "Partition step length works.")
//        XCTAssertTrue($.partition(array, n: 10) == [[]], "Partition without pad returns [[]] if n is longer than array.")
//    }
    
//    func testPartitionAll() {
//        var array = [1, 2, 3, 4, 5]
//        
//        XCTAssertTrue($.partitionAll(array, n: 2, step: 1) == [[1, 2], [2, 3], [3, 4], [4, 5], [5]], "PartitionAll includes partitions less than n.")
//        XCTAssertTrue($.partitionAll(array, n: 2) == [[1, 2], [3, 4], [5]], "PartitionAll uses n as the step when not supplied.")
//        XCTAssertTrue($.partitionAll(array, n:4, step: 1) == [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5], [4, 5], [5]], "PartitionAll does not stop at the first partition less than n length.")
//    }
//    
//    func testPartitionBy() {
//        XCTAssertTrue($.partitionBy([1, 2, 3, 4, 5]) { $0 > 10 } == [[1, 2, 3, 4, 5]], "PartitionBy doesn't try to split unnecessarily.")
//        XCTAssertTrue($.partitionBy([1, 2, 4, 3, 5, 6]) { $0 % 2 == 0 } == [[1], [2, 4], [3, 5], [6]], "PartitionBy splits appropriately on Bool.")
//        XCTAssertTrue($.partitionBy([1, 7, 3, 6, 10, 12]) { $0 % 3 } == [[1, 7], [3, 6], [10], [12]], "PartitionBy can split on functions other than Bool.")
//    }
//    
    func testMap() {
        XCTAssertEqualArrays($.map([1, 2, 3, 4, 5]) { $0 * 2 }, [2, 4, 6, 8, 10], "Map function should double values in the array")
    }
    
    func testReduce() {
        XCTAssertEqual($.reduce([1, 2, 3, 4, 5], initial: 0) { $0 + $1 } as Int, 15, "Reduce function should sum elements in the array")
    }

    
    func testSlice() {
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 0, end: 2), [1, 2], "Slice subarray 0..2")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 0), [1, 2, 3, 4, 5], "Slice at 0 is whole array")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 3), [4, 5], "Slice with start goes till end")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 8), [], "Slice out of bounds is empty")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 8, end: 10), [], "Slice out of bounds is empty")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 8 , end: 2), [], "Slice with end < start is empty")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 3, end: 3), [], "Slice at x and x is empty")
        XCTAssertEqualArrays($.slice([1,2,3,4,5], start: 2, end: 5), [3,4,5], "Slice at x and x is subarray")
    }
    
    func testFib() {
        var times = 0
        let fibMemo = $.memoize { (fib: (Int -> Int), val: Int) -> Int in
            times += 1
            return val == 1 || val == 0 ? 1 : fib(val - 1) + fib(val - 2)
        }
        let x = fibMemo(5)
        XCTAssertEqual(times, 6, "Function called 6 times")
        times = 0
        let y = fibMemo(5)
        XCTAssertEqual(times, 0, "Function called 0 times due to memoize")

        times = 0
        let z = fibMemo(6)
        XCTAssertEqual(times, 1, "Function called 1 times due to memoize")
    }
    
   
    func testId() {
        XCTAssertEqual($.id(1), 1, "Id should return the argument it gets passed")
    }

}
