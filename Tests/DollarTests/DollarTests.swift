//
//  DollarTests.swift
//  DollarTests
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import XCTest
@testable import Dollar

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

class DollarTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPermutation() {
        let result = $.permutation(["a", "b", "c"])
        XCTAssertEqual(result, ["abc", "acb", "bac", "bca", "cab", "cba"])
    }

    func testFirst() {
        if let result = $.first([1, 2, 3, 4]) {
            XCTAssertEqual(result, 1, "Return first element")
        }
        XCTAssertNil($.first([Int]()), "Returns nil when array is empty")
    }

    func testSecond() {
        if let result = $.second([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
            XCTAssertEqual(result, 2, "Return second element")
        }
        XCTAssertNil($.second([Int]()), "Returns nil when array is empty")
    }

    func testThird() {
        if let result = $.third([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
            XCTAssertEqual(result, 3, "Return third element")
        }
        XCTAssertNil($.third([Int]()), "Returns nil when array is empty")
    }

    func testNoop() {
        $.noop()
    }

    func testCompact() {
        XCTAssert($.compact([3, nil, 4, 5]) == [3, 4, 5], "Return truth array")
        XCTAssertEqual($.compact([nil, nil]) as [NSObject], [], "Return truth array")
    }

    func testEach() {
        var arr: [Int] = []
        let result = $.each([1, 3, 4, 5], callback: { arr.append($0 * 2) })
        XCTAssert(result == [1, 3, 4, 5], "Return the array itself")
        XCTAssert(arr == [2, 6, 8, 10], "Return array with doubled numbers")
    }

    func testEachWhen() {
        var arr: [Int] = []
        let result = $.each([1, 3, 4, 5], when: { return $0 < 4 }, callback: { arr.append($0 * 2) })
        XCTAssert(result == [1, 3, 4, 5], "Return the array itself")
        XCTAssert(arr == [2, 6], "Return array with doubled numbers")
    }

    func testEqual() {
        XCTAssert($.equal(Optional("hello"), Optional("hello")), "optionalString and otherOptionalString should be equal.")
        XCTAssertFalse($.equal(Optional("hello"), Optional("goodbye")), "optionalString and thirdOptionalString should not be equal.")
        XCTAssert($.equal(nil as String?, nil as String?), "Nil optionals should be equal.")
    }

    func testFlatten() {
//        XCTAssertEqual($.flatten([[3], 4, 5]), [3, 4, 5], "Return flat array")
//        XCTAssertEqual($.flatten([[[3], 4], 5] as [NSObject]), [3, 4, 5], "Return flat array")
    }

    func testShuffle() {
        XCTAssertEqual($.shuffle([1]), [1], "Return shuffled array")
        XCTAssertEqual($.shuffle([1, 2, 3]).count, 3, "Return shuffled array")
        XCTAssertEqual($.shuffle([Int]()), [], "Return empty array")
    }

    func testIndexOf() {
        XCTAssertEqual($.indexOf(["A", "B", "C"], value: "B")!, 1, "Return index of value")
        XCTAssertEqual($.indexOf([3, 4, 5], value: 5)!, 2, "Return index of value")
        XCTAssertEqual($.indexOf([3, 4, 5], value: 3)!, 0, "Return index of value")
        XCTAssertNil($.indexOf([3, 4, 5], value: 2), "Return index of value")
    }

    func testInitial() {
        XCTAssertEqual($.initial([3, 4, 5]), [3, 4], "Return all values except for last")
        XCTAssertEqual($.initial([3, 4, 5], numElements: 2), [3], "Return first element")
        XCTAssertEqual($.initial([3, 4, 5], numElements: 4), [], "Returns no elements")
        XCTAssertEqual($.initial([3, 4, 5], numElements: -1), [], "Return no elements")
    }

    func testRest() {
        XCTAssertEqual($.rest([3, 4, 5]), [4, 5], "Returns all value except for first")
        XCTAssertEqual($.rest([3, 4, 5], numElements: 2), [5], "Returns all value except for first two")
        XCTAssertEqual($.rest([3, 4, 5], numElements: 4), [], "Returns no elements")
        XCTAssertEqual($.rest([3, 4, 5], numElements: -1), [], "Returns no elements")
    }

    func testLast() {
        if let result = $.last([3, 4, 5]) {
            XCTAssertEqual(result, 5, "Returns last element in array")
        }
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
        XCTAssertEqual($.range(4), [0, 1, 2, 3], "Generates range")
        XCTAssertEqual($.range(from: 1, to: 5), [1, 2, 3, 4], "Generates range")
        XCTAssertEqual($.range(from: 0, to: 20, incrementBy: 5), [0, 5, 10, 15], "Generates range")
        XCTAssertEqual($.range(4.0), [0.0, 1.0, 2.0, 3.0], "Generates range of doubles")
        XCTAssertEqual($.range(from: -2.0, to: 2.0), [-2.0, -1.0, 0.0, 1.0], "Generates range of doubles")
        XCTAssertEqual($.range(from: -10.0, to: 10.0, incrementBy: 5), [-10.0, -5.0, 0.0, 5.0], "Generates range of doubles")
        XCTAssertEqual($.range(from: 1, through: 5), [1, 2, 3, 4, 5], "Increments by 1 and includes 5")
        XCTAssertEqual($.range(from: 0, through: 20, incrementBy: 5), [0, 5, 10, 15, 20], "Includes 20")
        XCTAssertEqual($.range(from: -10.0, through: 10.0, incrementBy: 5), [-10.0, -5.0, 0.0, 5.0, 10.0], "Includes 10.0")
    }

    func testSequence() {
        XCTAssertEqual($.sequence("abc".characters), ["a", "b", "c"], "Generates array of characters")
    }

    func testRemove() {
        XCTAssertEqual($.remove([1, 2, 3, 4, 5, 6], callback: { $0 == 2 || $0 == 3 }), [1, 4, 5, 6], "Remove based on callback")
    }

    func testRemoveElement() {
        XCTAssertEqual($.remove(["ant", "bat", "cat", "dog", "egg"], value: "cat"), ["ant", "bat", "dog", "egg"], "Array after removing element")

        XCTAssertEqual($.remove(["ant", "bat", "cat", "dog", "egg"], value: "fish"), ["ant", "bat", "cat", "dog", "egg"], "Array after removing element that does not exist")

    }

    func testSortedIndex() {
        XCTAssertEqual($.sortedIndex([3, 4, 6, 10], value: 5), 2, "Index to insert element at in a sorted array")
        XCTAssertEqual($.sortedIndex([10, 20, 30, 50], value: 40), 3, "Index to insert element at in a sorted array")
    }

    func testWithout() {
        XCTAssertEqual($.without([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqual($.without([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqual($.without([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }

    func testPull() {
        XCTAssertEqual($.pull([3, 4, 5, 3, 5], values: 3, 5), [4], "Removes elements passed after the array")
        XCTAssertEqual($.pull([3, 4, 5, 3, 5], values: 4), [3, 5, 3, 5], "Removes elements passed after the array")
        XCTAssertEqual($.pull([3, 4, 5, 3, 5], values: 3, 4, 5), [], "Removes elements passed after the array")
    }

    func testZip() {
        let zipped = $.zip(["fred", "barney"], [30, 40], [true, false])
        XCTAssertEqual(zipped[0][0] as! String, "fred", "Zip up arrays")
        XCTAssertEqual(zipped[0][1] as! Int, 30, "Zip up arrays")
        XCTAssertEqual(zipped[0][2] as! Bool, true, "Zip up arrays")
        XCTAssertEqual(zipped[1][0] as! String, "barney", "Zip up arrays")
        XCTAssertEqual(zipped[1][1] as! Int, 40, "Zip up arrays")
        XCTAssertEqual(zipped[1][2] as! Bool, false, "Zip up arrays")
    }

    func testZipObject() {
        XCTAssertTrue($.zipObject(["fred", "barney"], values: [30, 40]) as [String: Int] == ["fred": 30, "barney": 40], "Zip up array to object")
    }

    func testIntersection() {
        XCTAssertEqual($.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]).sorted(by: {$0<$1}), [1, 2], "Intersection of arrays")
    }

    func testDifference() {
        XCTAssertEqual($.difference([1, 2, 3, 4, 5], [5, 2, 10]), [1, 3, 4], "Difference of arrays")
        XCTAssertEqual($.difference([1, 1, 1, 2, 2], [], [3]), [1, 1, 1, 2, 2], "Difference of arrays")
        XCTAssertEqual($.difference([4, 1, 1, 1, 2, 2], [1, 1], [3]), [4, 2, 2], "Difference of arrays")
        XCTAssertEqual($.difference([1, 1, 1, 2, 2], [1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqual($.difference([1, 1, 1, 2, 2], [1, 1, 1], [1, 2, 2]), [], "Difference of arrays")
        XCTAssertEqual($.difference([1, 1, 1, 2, 2], []), [1, 1, 1, 2, 2], "Difference of arrays")
    }

    func testUniq() {
        XCTAssertEqual($.uniq([1, 2, 1, 3, 1]), [1, 2, 3], "Uniq of arrays")
        XCTAssertEqual($.uniq([1, 2.5, 3, 1.5, 2, 3.5], by: {floor($0)}), [1, 2.5, 3], "Uniq numbers by condition")
    }

    func testUnion() {
        XCTAssertEqual($.union([1, 2, 3], [5, 2, 1, 4], [2, 1]), [1, 2, 3, 5, 4], "Union of arrays")
    }

    func testXOR() {
        XCTAssertEqual($.xor([1, 2, 3], [5, 2, 1, 4]).sorted {$0<$1}, [3, 4, 5], "Xor of arrays")
    }

    func testTranspose() {
        var matrix = $.transpose([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(matrix[0], [1, 4], "Tranpose of matrix")
        XCTAssertEqual(matrix[1], [2, 5], "Tranpose of matrix")
        XCTAssertEqual(matrix[2], [3, 6], "Tranpose of matrix")
    }

    func testAt() {
        XCTAssertEqual($.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4), ["ant", "cat", "egg"], "At of arrays")
    }

    func testEvery() {
        XCTAssertTrue($.every([1, 2, 3, 4]) { $0 < 20 }, "All elements in collection are true")
        XCTAssertFalse($.every([1, 2, 3, 4]) { $0 == 1 }, "All elements in collection are true")
    }


    func testFind() {
        XCTAssertEqual($.find([1, 2, 3, 4], callback: { $0 == 2 })!, 2, "Return element when object is found")
        XCTAssertNil($.find([1, 2, 3, 4], callback: { $0 == 10 }), "Return nil when object not found")
    }

    func testMax() {
        XCTAssert($.max([1, 2, 3, 4, 2, 1]) == 4, "Returns maximum element")
        XCTAssertNil($.max([Int]()), "Returns nil when array is empty")
    }

    func testMin() {
        XCTAssert($.min([2, 1, 2, 3, 4]) == 1, "Returns minumum element")
        XCTAssertNil($.min([Int]()), "Returns nil when array is empty")
    }

    func testSample() {
        let arr = [2, 1, 2, 3, 4]
        XCTAssertTrue($.contains(arr, value: $.sample(arr)), "Returns sample which is an element from the array")
    }

    func testPluck() {
        let arr = [["age": 20], ["age": 30], ["age": 40]]
        XCTAssertEqual($.pluck(arr, value: "age"), [20, 30, 40], "Returns values from the object where they key is the value")
    }

    func testFrequencies() {
        XCTAssertTrue($.frequencies(["a", "a", "b", "c", "a", "b"]) == ["a": 3, "b": 2, "c": 1], "Returns correct frequency dictionary")
        XCTAssertTrue($.frequencies([1, 2, 3, 4, 5]) { $0 % 2 == 0 } == [false: 3, true: 2], "Returns correct frequency dictionary from cond")
    }

    func testKeys() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqual($.keys(dict).sorted(by: {$0<$1}), ["Cat", "Dog"], "Returns correct array with keys")
    }

    func testValues() {
        let dict = ["Dog": 1, "Cat": 2]
        XCTAssertEqual($.values(dict).sorted(by: {$0<$1}), [1, 2], "Returns correct array with values")
    }

    func testMerge() {
        let dict  = ["Dog": 1, "Cat": 2]
        let dict2 = ["Cow": 3]
        let dict3 = ["Sheep": 4]
        XCTAssertTrue($.merge(dict, dict2, dict3) == ["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4], "Returns correct merged dictionary")

        let arr  = [1, 5]
        let arr2 = [2, 4]
        let arr3 = [5, 6]
        XCTAssertEqual($.merge(arr, arr2, arr3), [1, 5, 2, 4, 5, 6], "Returns correct merged array")
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
        let beatle = CarExample(name: "Fusca")
        $.tap(beatle, function: {$0.name = "Beatle"}).color = "Blue"

        XCTAssertEqual(beatle.name!, "Beatle", "Set the car name")
        XCTAssertEqual(beatle.color!, "Blue", "Set the car color")
    }

    func testChaining() {
        var chain = $.chain([1, 2, 3])
        XCTAssertEqual(chain.first()!, 1, "Returns first element which ends the chain")
        XCTAssertEqual(chain.second()!, 2, "Returns second element which ends the chain")
        XCTAssertEqual(chain.third()!, 3, "Returns third element which ends the chain")

        chain = $.chain([10, 20, 30, 40, 50])
        var elements: [Int] = []
        _ = chain.each { elements.append($0 as Int) }
        _ = chain.value
        XCTAssertEqual(elements, [10, 20, 30, 40, 50], "Goes through each element in the array")

        XCTAssertTrue(chain.all({ ($0 as Int) < 100 }), "All elements are less than 100")

        chain = $.chain([10, 20, 30, 40, 50])
        XCTAssertFalse(chain.all({ ($0 as Int) < 40 }), "All elements are not less than 40")

        chain = $.chain([10, 20, 30, 40, 50])
        XCTAssertTrue(chain.any({ ($0 as Int) < 40 }), "At least one element is less than 40")

        chain = $.chain([10, 20, 30, 40, 50])
        elements = [Int]()
        _ = chain.slice(0, end: 3).each { elements.append($0 as Int) }
        _ = chain.value
        XCTAssertEqual(elements, [10, 20, 30], "Chained seld")


        let testarr = [[[1, 2]], 3, [[4], 5]] as [Any]

        let chainA = $.chain(testarr)
        XCTAssertEqual(chainA.flatten().initial(2).value as! [Int], [1, 2, 3], "Returns flatten array from chaining")

        let chainB = $.chain(testarr)
        XCTAssertEqual(chainB.initial().flatten().first()! as! Int, 1, "Returns flatten array from chaining")

        _ = $.chain(testarr)
//        XCTAssertEqual(chainC.flatten().map({ (elem) in elem as Int * 10 }).value, [10, 20, 30, 40, 50], "Returns mapped values")
//        XCTAssertEqual(chainC.flatten().map({ (elem) in elem as Int * 10 }).first()!, 100, "Returns first element from mapped value")
    }

    func testPartial() {
        let partialFunc = $.partial({(T: String...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello")
        XCTAssertEqual(partialFunc("World", "Swift"), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testBind() {
        let helloWorldFunc = $.bind({(T: String...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello", "World", "Swift")
        XCTAssertEqual(helloWorldFunc(), "Hello World from Swift", "Returns curry function that is evaluated")
    }

    func testBind1() {
//        let helloWorldFunc = $.bind({ $0 + " World" }, "Hello")
//        XCTAssertEqual(helloWorldFunc(), "Hello World", "Returns bind function that is evaluated")
    }

    func testBind2() {
//        let helloWorldFunc = $.bind({ $0 + $1 + " World" }, "Hello ", "Great")
//        XCTAssertEqual(helloWorldFunc(), "Hello Great World", "Returns bind function that is evaluated")
    }

    func testTimes() {
        let fun = $.bind({ (names: String...) -> String in
            let people = $.join(names, separator: " from ")
            return "Hello \(people)"
            }, "Ankur", "Swift")
        XCTAssertEqual($.times(3, function: fun) as [String], ["Hello Ankur from Swift", "Hello Ankur from Swift", "Hello Ankur from Swift"], "Call a function 3 times")
    }

    func testAfter() {
        let saves = ["profile", "settings"]
        let asyncSave = { (function: () -> ()?) in
            function()
        }
        var isDone = false
        let completeCallback = $.after(saves.count) {
            isDone = true
        }
        for _ in saves {
            asyncSave(completeCallback)
        }
        XCTAssertTrue(isDone, "Should be done")
    }


    func testPartition() {
        let array = [1, 2, 3, 4, 5]

        
        var partition = $.partition(array, n: 2)
        XCTAssertEqual(partition[0], [1, 2], "Partition uses n for step if not supplied.")
        XCTAssertEqual(partition[1], [3, 4], "Partition uses n for step if not supplied.")
        
        partition = $.partition(array, n: 2, step: 1)
        XCTAssertEqual(partition[0], [1, 2], "Partition allows specifying a custom step.")
        XCTAssertEqual(partition[1], [2, 3], "Partition allows specifying a custom step.")
        XCTAssertEqual(partition[2], [3, 4], "Partition allows specifying a custom step.")
        XCTAssertEqual(partition[3], [4, 5], "Partition allows specifying a custom step.")
        
        partition = $.partition(array, n: 2, step: 1, pad: nil)
        XCTAssertEqual(partition[0], [1, 2], "Partition with nil pad allows the last partition to be less than n length")
        XCTAssertEqual(partition[1], [2, 3], "Partition with nil pad allows the last partition to be less than n length")
        XCTAssertEqual(partition[2], [3, 4], "Partition with nil pad allows the last partition to be less than n length")
        XCTAssertEqual(partition[3], [4, 5], "Partition with nil pad allows the last partition to be less than n length")
        XCTAssertEqual(partition[4], [5], "Partition with nil pad allows the last partition to be less than n length")
        
        partition = $.partition(array, n: 4, step: 1, pad: nil)
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "Partition with nil pad stops at the first partition less than n length.")
        XCTAssertEqual(partition[1], [2, 3, 4, 5], "Partition with nil pad stops at the first partition less than n length.")
        XCTAssertEqual(partition[2], [3, 4, 5], "Partition with nil pad stops at the first partition less than n length.")
        
        partition = $.partition(array, n: 2, step: 1, pad: [6, 7, 8])
        XCTAssertEqual(partition[0], [1, 2], "Partition pads the last partition to the right length.")
        XCTAssertEqual(partition[1], [2, 3], "Partition pads the last partition to the right length.")
        XCTAssertEqual(partition[2], [3, 4], "Partition pads the last partition to the right length.")
        XCTAssertEqual(partition[3], [4, 5], "Partition pads the last partition to the right length.")
        XCTAssertEqual(partition[4], [5, 6], "Partition pads the last partition to the right length.")
        
        partition = $.partition(array, n: 4, step: 3, pad: [6])
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "Partition doesn't add more elements than pad has.")
        XCTAssertEqual(partition[1], [4, 5, 6], "Partition doesn't add more elements than pad has.")
        
        partition = $.partition(array, n: 4, step: nil, pad: [6, 7])
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "Partition with nil step can add pad elements normally, but can't add more elements than pad has.")
        XCTAssertEqual(partition[1], [5, 6, 7], "Partition with nil step can add pad elements normally, but can't add more elements than pad has.")
        
        
        partition = $.partition(array, n: 4, step: nil, pad: [6, 7])
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "Partition with nil step can add pad elements normally, but can't add more elements than pad has.")
        XCTAssertEqual(partition[1], [5, 6, 7], "Partition with nil step can add pad elements normally, but can't add more elements than pad has.")
        
        partition = $.partition(array, n: 4, step: nil, pad: [6, 7, 8, 9])
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "Partition with nil step can add pad elements normally.")
        XCTAssertEqual(partition[1], [5, 6, 7, 8], "Partition with nil step can add pad elements normally.")
        
        partition = $.partition(array, n: 4, step: nil, pad: nil)
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "Partition with nil step and nil pad can add pad elements normally.")
        XCTAssertEqual(partition[1], [5], "Partition with nil step and nil pad can add pad elements normally.")
        
        partition = $.partition([1, 2, 3, 4, 5], n: 2, pad: [6])
        XCTAssertEqual(partition[0], [1, 2], "Partition with pad and no step uses n as step.")
        XCTAssertEqual(partition[1], [3, 4], "Partition with pad and no step uses n as step.")
        XCTAssertEqual(partition[2], [5, 6], "Partition with pad and no step uses n as step.")
        
        partition = $.partition([1, 2, 3, 4, 5, 6], n: 2, step: 4)
        XCTAssertEqual(partition[0], [1, 2], "Partition step length works.")
        XCTAssertEqual(partition[1], [5, 6], "Partition step length works.")
        
        partition = $.partition(array, n: 10)
        XCTAssertEqual(partition[0], [], "Partition without pad returns [[]] if n is longer than array.")
    }

    func testPartitionAll() {
        let array = [1, 2, 3, 4, 5]

        var partition = $.partitionAll(array, n: 2, step: 1)
        XCTAssertEqual(partition[0], [1, 2], "PartitionAll includes partitions less than n.")
        XCTAssertEqual(partition[1], [2, 3], "PartitionAll includes partitions less than n.")
        XCTAssertEqual(partition[2], [3, 4], "PartitionAll includes partitions less than n.")
        XCTAssertEqual(partition[3], [4, 5], "PartitionAll includes partitions less than n.")
        XCTAssertEqual(partition[4], [5], "PartitionAll includes partitions less than n.")
        
        partition = $.partitionAll(array, n: 2)
        XCTAssertEqual(partition[0], [1, 2], "PartitionAll uses n as the step when not supplied.")
        XCTAssertEqual(partition[1], [3, 4], "PartitionAll uses n as the step when not supplied.")
        XCTAssertEqual(partition[2], [5], "PartitionAll uses n as the step when not supplied.")
        
        partition = $.partitionAll(array, n:4, step: 1)
        XCTAssertEqual(partition[0], [1, 2, 3, 4], "PartitionAll does not stop at the first partition less than n length.")
        XCTAssertEqual(partition[1], [2, 3, 4, 5], "PartitionAll does not stop at the first partition less than n length.")
        XCTAssertEqual(partition[2], [3, 4, 5], "PartitionAll does not stop at the first partition less than n length.")
        XCTAssertEqual(partition[3], [4, 5], "PartitionAll does not stop at the first partition less than n length.")
        XCTAssertEqual(partition[4], [5], "PartitionAll does not stop at the first partition less than n length.")
    }

    func testPartitionBy() {
        var partition = $.partitionBy([1, 2, 3, 4, 5]) { $0 > 10 }
        XCTAssertEqual(partition[0], [1, 2, 3, 4, 5], "PartitionBy doesn't try to split unnecessarily.")
        
        partition = $.partitionBy([1, 2, 4, 3, 5, 6]) { $0 % 2 == 0 }
        XCTAssertEqual(partition[0], [1], "PartitionBy splits appropriately on Bool.")
        XCTAssertEqual(partition[1], [2, 4], "PartitionBy splits appropriately on Bool.")
        XCTAssertEqual(partition[2], [3, 5], "PartitionBy splits appropriately on Bool.")
        XCTAssertEqual(partition[3], [6], "PartitionBy splits appropriately on Bool.")
        
        partition = $.partitionBy([1, 7, 3, 6, 10, 12]) { $0 % 3 }
        XCTAssertEqual(partition[0], [1, 7], "PartitionBy can split on functions other than Bool.")
        XCTAssertEqual(partition[1], [3, 6], "PartitionBy can split on functions other than Bool.")
        XCTAssertEqual(partition[2], [10], "PartitionBy can split on functions other than Bool.")
        XCTAssertEqual(partition[3], [12], "PartitionBy can split on functions other than Bool.")
    }

    func testMap() {
        XCTAssertEqual($.map([1, 2, 3, 4, 5]) { $0 * 2 }, [2, 4, 6, 8, 10], "Map function should double values in the array")
    }

    func testFlatMap() {
        XCTAssertEqual($.flatMap([1, 2, 3]) { [$0, $0] }, [1, 1, 2, 2, 3, 3], "FlatMap should double every item in the array and concatenate them.")
        let expected: String? = "swift"
        let actual = $.flatMap(URL(string: "https://apple.com/swift/")) { $0.lastPathComponent }
        XCTAssert($.equal(actual, expected), "FlatMap on optionals should run the function and produce a single-level optional containing the last path component of the url.")
    }

    func testReduce() {
        XCTAssertEqual($.reduce([1, 2, 3, 4, 5], initial: 0) { $0 + $1 } as Int, 15, "Reduce function should sum elements in the array")
    }


    func testSlice() {
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 0, end: 2), [1, 2], "Slice subarray 0..2")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 0), [1, 2, 3, 4, 5], "Slice at 0 is whole array")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 3), [4, 5], "Slice with start goes till end")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 8), [], "Slice out of bounds is empty")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 8, end: 10), [], "Slice out of bounds is empty")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 8, end: 2), [], "Slice with end < start is empty")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 3, end: 3), [], "Slice at x and x is empty")
        XCTAssertEqual($.slice([1, 2, 3, 4, 5], start: 2, end: 5), [3, 4, 5], "Slice at x and x is subarray")
    }

    func testFib() {
        var times = 0
        let fibMemo = $.memoize { (fib: ((Int) -> Int), val: Int) -> Int in
            times += 1
            return val == 1 || val == 0 ? 1 : fib(val - 1) + fib(val - 2)
        }
        _ = fibMemo(5)
        XCTAssertEqual(times, 6, "Function called 6 times")
        times = 0
        _ = fibMemo(5)
        XCTAssertEqual(times, 0, "Function called 0 times due to memoize")

        times = 0
        _ = fibMemo(6)
        XCTAssertEqual(times, 1, "Function called 1 times due to memoize")
    }

    func testId() {
        XCTAssertEqual($.id(1), 1, "Id should return the argument it gets passed")
    }

    func testComposeVariadic() {
        let double = { (params: Int...) -> [Int] in
            return $.map(params) { $0 * 2 }
        }
        let subtractTen = { (params: Int...) -> [Int] in
            return $.map(params) { $0 - 10 }
        }
        let doubleSubtractTen = $.compose(double, subtractTen)
        XCTAssertEqual(doubleSubtractTen(5, 6, 7), [0, 2, 4], "Should double value and then subtract 10")
    }

    func testComposeArray() {
        let double = { (params: [Int]) -> [Int] in
            return $.map(params) { $0 * 2 }
        }
        let subtractTen = { (params: [Int]) -> [Int] in
            return $.map(params) { $0 - 10 }
        }
        let doubleSubtractTen = $.compose(double, subtractTen)
        XCTAssertEqual(doubleSubtractTen([5, 6, 7]), [0, 2, 4], "Should double value and then subtract 10")
    }

    func testChunk() {
        var chunks = $.chunk([1, 2, 3, 4], size: 2)
        XCTAssertEqual(chunks[0], [1, 2], "Should chunk with elements in groups of 2")
        XCTAssertEqual(chunks[1], [3, 4], "Should chunk with elements in groups of 2")
        
        chunks = $.chunk([1, 2, 3, 4], size: 3)
        XCTAssertEqual(chunks[0], [1, 2, 3], "Should chunk with elements in groups of 2")
        XCTAssertEqual(chunks[1], [4], "Should chunk with elements in groups of 2")
    }

    func testFill() {
        var arr = Array<Int>(repeating: 1, count: 5)
        XCTAssertEqual($.fill(&arr, withElem: 42), [42, 42, 42, 42, 42], "Should fill array with 42")

        _ = $.fill(&arr, withElem: 1, startIndex: 1, endIndex: 3)
        XCTAssertEqual($.fill(&arr, withElem: 1, startIndex: 1, endIndex: 3), [42, 1, 1, 1, 42], "Should fill array with 1")
    }

    func testPullAt() {
        XCTAssertEqual($.pullAt([10, 20, 30, 40, 50], indices: 1, 2, 3), [10, 50], "Remove elements at index")
    }

    func testSize() {
        XCTAssertEqual($.size([10, 20, 30, 40, 50]), 5, "Returns size")
    }

    func testFetch() {
        XCTAssertEqual($.fetch([10, 20, 30, 40, 50], 1), 20, "Returns 20")
        XCTAssertEqual($.fetch([10, 20, 30, 40, 50], 100, orElse: 100), 100, "Returns 100")
    }
    func testGroupBy() {
        let oddEven = $.groupBy([1, 2, 3, 4], callback: {$0 % 2})
        XCTAssertEqual(oddEven[0]!, [2, 4], "Returns dictionary grouped by remainders of two")
        XCTAssertEqual(oddEven[1]!, [1, 3], "Returns dictionary grouped by remainders of two")

        let wordCount = $.groupBy(["strings", "with", "different", "lengths"], callback: {$0.characters.count})
        XCTAssertEqual(wordCount[7]!, ["strings", "lengths"], "Returns dictionary with string lengths as keys")
        XCTAssertEqual(wordCount[9]!, ["different"], "Returns dictionary with string lengths as keys")
        XCTAssertEqual(wordCount[4]!, ["with"], "Returns dictionary with string lengths as keys")
    }
    func testRandom() {
        let upperBoundary = 10
        for _ in 1...1000 {
            let rand = $.random(upperBoundary)
            // This was done so that if this failed, there wouldn't be 1000+ failures, there would just be 1.
            // Making it easier to debug.
            if (rand < 0 || rand >= upperBoundary) {
                XCTAssert(rand > 0 && rand < 10, "random failed to generate a number within boundaries")
                break
            }
        }
    }
}
