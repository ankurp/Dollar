//
//    ___    ___       __   ___  ________ _________
//  _|\  \__|\  \     |\  \|\  \|\  _____\\___   ___\
// |\   ____\ \  \    \ \  \ \  \ \  \__/\|___ \  \_|
// \ \  \___|\ \  \  __\ \  \ \  \ \   __\    \ \  \
//  \ \_____  \ \  \|\__\_\  \ \  \ \  \_|     \ \  \
//   \|____|\  \ \____________\ \__\ \__\       \ \__\
//     ____\_\  \|____________|\|__|\|__|        \|__|
//    |\___    __\
//    \|___|\__\_|
//         \|__|
//
//  Dollar.swift
//  $ - A functional tool-belt for Swift Language
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
#if os(Linux)
    import Dispatch
#endif

open class Dollar {
    ///  ___  ___  _______   ___       ________  _______   ________
    /// |\  \|\  \|\  ___ \ |\  \     |\   __  \|\  ___ \ |\   __  \
    /// \ \  \\\  \ \   __/|\ \  \    \ \  \|\  \ \   __/|\ \  \|\  \
    ///  \ \   __  \ \  \_|/_\ \  \    \ \   ____\ \  \_|/_\ \   _  _\
    ///   \ \  \ \  \ \  \_|\ \ \  \____\ \  \___|\ \  \_|\ \ \  \\  \|
    ///    \ \__\ \__\ \_______\ \_______\ \__\    \ \_______\ \__\\ _\
    ///     \|__|\|__|\|_______|\|_______|\|__|     \|_______|\|__|\|__|
    ///

    /// Creates a function that executes passed function only after being called n times.
    ///
    /// - parameter num: Number of times after which to call function.
    /// - parameter function: Function to be called that takes params.
    /// - returns: Function that can be called n times after which the callback function is called.
    open class func after<T, E>(_ num: Int, function: @escaping (T...) -> E) -> ((T...) -> E?) {
        var counter = num
        return { (params: T...) -> E? in
            typealias Function = ([T]) -> E
            counter -= 1
            if counter <= 0 {
                let f = unsafeBitCast(function, to: Function.self)
                return f(params)
            }
            return .none
        }
    }

    /// Creates a function that executes passed function only after being called n times.
    ///
    /// - parameter num: Number of times after which to call function.
    /// - parameter function: Function to be called that does not take any params.
    /// - returns: Function that can be called n times after which the callback function is called.
    open class func after<T>(_ num: Int, function: @escaping () -> T) -> (() -> T?) {
        let f = self.after(num) { (params: Any?...) -> T in
            return function()
        }
        return { f() }
    }

    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// - parameter array: The array to source from
    /// - parameter indexes: Get elements from these indexes
    /// - returns: New array with elements from the indexes specified.
    open class func at<T>(_ array: [T], indexes: Int...) -> [T] {
        return self.at(array, indexes: indexes)
    }

    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// - parameter array: The array to source from
    /// - parameter indexes: Get elements from these indexes
    /// - returns: New array with elements from the indexes specified.
    open class func at<T>(_ array: [T], indexes: [Int]) -> [T] {
        var result: [T] = []
        for index in indexes {
            result.append(array[index])
        }
        return result
    }

    /// Creates a function that, when called, invokes func with the binding of arguments provided.
    ///
    /// - parameter function: Function to be bound.
    /// - parameter parameters: Parameters to be passed into the function when being invoked.
    /// - returns: A new function that when called will invoked the passed function with the parameters specified.
    open class func bind<T, E>(_ function: @escaping (T...) -> E, _ parameters: T...) -> (() -> E) {
        return { () -> E in
            typealias Function = ([T]) -> E
            let f = unsafeBitCast(function, to: Function.self)
            return f(parameters)
        }
    }

    /// Creates an array of elements split into groups the length of size.
    /// If array can’t be split evenly, the final chunk will be the remaining elements.
    ///
    /// - parameter array: to chunk
    /// - parameter size: size of each chunk
    /// - returns: array elements chunked
    open class func chunk<T>(_ array: [T], size: Int = 1) -> [[T]] {
        var result = [[T]]()
        var chunk = -1
        for (index, elem) in array.enumerated() {
            if index % size == 0 {
                result.append([T]())
                chunk += 1
            }
            result[chunk].append(elem)
        }
        return result
    }

    /// Creates an array with all nil values removed.
    ///
    /// - parameter array: Array to be compacted.
    /// - returns: A new array that doesnt have any nil values.
    open class func compact<T>(_ array: [T?]) -> [T] {
        var result: [T] = []
        for elem in array {
            if let val = elem {
                result.append(val)
            }
        }
        return result
    }

    /// Compose two or more functions passing result of the first function
    /// into the next function until all the functions have been evaluated
    ///
    /// - parameter functions: - list of functions
    /// - returns: A function that can be called with variadic parameters of values
    open class func compose<T>(_ functions: ((T...) -> [T])...) -> ((T...) -> [T]) {
        typealias Function = ([T]) -> [T]
        return { (result: T...) -> [T] in
            var result = result
            for fun in functions {
                let f = unsafeBitCast(fun, to: Function.self)
                result = f(result)
            }
            return result
        }
    }

    /// Compose two or more functions passing result of the first function
    /// into the next function until all the functions have been evaluated
    ///
    /// - parameter functions: - list of functions
    /// - returns: A function that can be called with array of values
    open class func compose<T>(_ functions: (([T]) -> [T])...) -> (([T]) -> [T]) {
        return {
            var result = $0
            for fun in functions {
                result = fun(result)
            }
            return result
        }
    }

    /// Checks if a given value is present in the array.
    ///
    /// - parameter array: The array to check against.
    /// - parameter value: The value to check.
    /// - returns: Whether value is in the array.
    open class func contains<T: Equatable>(_ array: [T], value: T) -> Bool {
        return array.contains(value)
    }

    /// Create a copy of an array
    ///
    /// - parameter array: The array to copy
    /// - returns: New copy of array
    open class func copy<T>(_ array: [T]) -> [T] {
        var newArr: [T] = []
        for elem in array {
            newArr.append(elem)
        }
        return newArr
    }

    /// Cycles through the array indefinetly passing each element into the callback function
    ///
    /// - parameter array: to cycle through
    /// - parameter callback: function to call with the element
    open class func cycle<T, U>(_ array: [T], callback: (T) -> U) {
        while true {
            for elem in array {
                _ = callback(elem)
            }
        }
    }

    /// Cycles through the array n times passing each element into the callback function
    ///
    /// - parameter array: to cycle through
    /// - parameter times: Number of times to cycle through the array
    /// - parameter callback: function to call with the element
    open class func cycle<T, U>(_ array: [T], _ times: Int, callback: (T) -> U) {
        for _ in 0..<times {
            for elem in array {
                _ = callback(elem)
            }
        }
    }

    /// Delays the execution of a function by the specified DispatchTimeInterval
    ///
    /// - parameter by: interval to delay the execution of the function by
    /// - parameter queue: Queue to run the function on. Defaults to main queue
    /// - parameter function: function to execute
    open class func delay(by interval: DispatchTimeInterval, queue: DispatchQueue = .main, _ function: @escaping () -> Void) {
        queue.asyncAfter(deadline: .now() + interval, execute: function)
    }

    /// Debounce a function such that the function is only invoked once no matter how many times
    /// it is called within the delayBy interval
    ///
    /// - parameter delayBy: interval to delay the execution of the function by
    /// - parameter queue: Queue to run the function on. Defaults to main queue
    /// - parameter function: function to execute
    /// - returns: Function that is debounced and will only invoke once within the delayBy interval
    open class func debounce(delayBy: DispatchTimeInterval, queue: DispatchQueue = .main, _ function: @escaping (() -> Void)) -> () -> Void {
        var currentWorkItem: DispatchWorkItem?
        return {
            currentWorkItem?.cancel()
            currentWorkItem = DispatchWorkItem { function() }
            queue.asyncAfter(deadline: .now() + delayBy, execute: currentWorkItem!)
        }
    }

    /// Throttle a function such that the function is invoked immediately, and only once no matter
    /// how many times it is called within the limitTo interval
    ///
    /// - parameter limitTo: interval during which subsequent calls will be ignored
    /// - parameter queue: Queue to run the function on. Defaults to main queue
    /// - parameter function: function to execute
    /// - returns: Function that is throttled and will only invoke immediately and only once within the limitTo interval
    open class func throttle(limitTo: DispatchTimeInterval, queue: DispatchQueue = .main, _ function: @escaping (() -> Void)) -> () -> Void {
        var allowFunction: Bool = true
        return {
            guard allowFunction else { return }
            allowFunction = false
            function()
            queue.asyncAfter(deadline: .now() + limitTo, qos: .background) {
                allowFunction = true
            }
        }
    }

    /// Creates an array excluding all values of the provided arrays in order
    ///
    /// - parameter arrays: The arrays to difference between.
    /// - returns: The difference between the first array and all the remaining arrays from the arrays params.
    open class func differenceInOrder<T: Equatable>(_ arrays: [[T]]) -> [T] {
        return Dollar.reduce(self.rest(arrays), initial: self.first(arrays)!) { (result, arr) -> [T] in
            return result.filter() { !arr.contains($0) }
        }
    }

    /// Creates an array excluding all values of the provided arrays with or without order
    /// Without order difference is much faster and at times 100% than difference with order
    ///
    /// - parameter arrays: The arrays to difference between.
    /// - parameter inOrder: Optional Paramter which is true by default
    /// - returns: The difference between the first array and all the remaining arrays from the arrays params.
    open class func difference<T: Hashable>(_ arrays: [T]..., inOrder: Bool = true) -> [T] {
        if inOrder {
            return self.differenceInOrder(arrays)
        } else {
            var result: [T] = []
            var map: [T: Int] = [T: Int]()
            let firstArr: [T] = self.first(arrays)!
            let restArr: [[T]] = self.rest(arrays) as [[T]]
            for elem in firstArr {
                if let val = map[elem] {
                    map[elem] = val + 1
                } else {
                    map[elem] = 1
                }
            }
            for arr in restArr {
                for elem in arr {
                    map.removeValue(forKey: elem)
                }
            }
            for (key, count) in map {
                for _ in 0..<count {
                    result.append(key)
                }
            }
            return result
        }
    }

    /// Call the callback passing each element in the array
    ///
    /// - parameter array: The array to iterate over
    /// - parameter callback: function that gets called with each item in the array
    /// - returns: The array passed
    @discardableResult
    open class func each<T>(_ array: [T], callback: (T) -> ()) -> [T] {
        for elem in array {
            callback(elem)
        }
        return array
    }

    /// Call the callback passing index of the element and each element in the array
    ///
    /// - parameter array: The array to iterate over
    /// - parameter callback: function that gets called with each item in the array with its index
    /// - returns: The array passed
    @discardableResult
    open class func each<T>(_ array: [T], callback: (Int, T) -> ()) -> [T] {
        for (index, elem): (Int, T) in array.enumerated() {
            callback(index, elem)
        }
        return array
    }

    /// Call the callback on all elements that meet the when condition
    ///
    /// - parameter array: The array to check.
    /// - parameter when: Condition to check before performing callback
    /// - parameter callback: Check whether element value is true or false.
    /// - returns: The array passed
    @discardableResult
    open class func each<T>(_ array: [T], when: (T) -> Bool, callback: (T) -> ()) -> [T] {
        for elem in array where when(elem) {
            callback(elem)
        }
        return array
    }

    /// Checks if two optionals containing Equatable types are equal.
    ///
    /// - parameter value: The first optional to check.
    /// - parameter other: The second optional to check.
    /// - returns: true if the optionals contain two equal values, or both are nil; false otherwise.
    open class func equal<T: Equatable>(_ value: T?, _ other: T?) -> Bool {
        switch (value, other) {
        case (.none, .none):
            return true
        case (.none, .some(_)):
            return false
        case (.some(_), .none):
            return false
        case (.some(let unwrappedValue), .some(let otherUnwrappedValue)):
            return unwrappedValue == otherUnwrappedValue
        }
    }

    /// Checks if the given callback returns true value for all items in the array.
    ///
    /// - parameter array: The array to check.
    /// - parameter callback: Check whether element value is true or false.
    /// - returns: true if the given callback returns true value for all items in the array; false otherwise.
    open class func every<T>(_ array: [T], callback: (T) -> Bool) -> Bool {
        for elem in array {
            if !callback(elem) {
                return false
            }
        }
        return true
    }


    /// Returns Factorial of integer
    ///
    /// - parameter num: number whose factorial needs to be calculated
    /// - returns: factorial
    open class func factorial(_ num: Int) -> Int {
        guard num > 0 else { return 1 }
        return num * Dollar.factorial(num - 1)
    }

    /// Get element from an array at the given index which can be negative
    /// to find elements from the end of the array
    ///
    /// - parameter array: The array to fetch from
    /// - parameter index: Can be positive or negative to find from end of the array
    /// - parameter orElse: Default value to use if index is out of bounds
    /// - returns: Element fetched from the array or the default value passed in orElse
    open class func fetch<T>(_ array: [T], _ index: Int, orElse: T? = .none) -> T! {
        if index < 0 && -index < array.count {
            return array[array.count + index]
        } else if index < array.count {
            return array[index]
        } else {
            return orElse
        }
    }

    /// Fills elements of array with value from start up to, but not including, end.
    ///
    /// - parameter array: to fill
    /// - parameter withElem: the element to replace
    /// - parameter startIndex: start index
    /// - parameter endIndex: end index
    /// - returns: array elements chunked
    open class func fill<T>(_ array: inout [T], withElem elem: T, startIndex: Int = 0, endIndex: Int? = .none) -> [T] {
        let endIndex = endIndex ?? array.count
        for (index, _) in array.enumerated() {
            if index > endIndex { break }
            if index >= startIndex && index <= endIndex {
                array[index] = elem
            }
        }
        return array
    }

    /// Iterates over elements of an array and returning the first element
    /// that the callback returns true for.
    ///
    /// - parameter array: The array to search for the element in.
    /// - parameter callback: The callback function to tell whether element is found.
    /// - returns: Optional containing either found element or nil.
    open class func find<T>(_ array: [T], callback: (T) -> Bool) -> T? {
        for elem in array {
            let result = callback(elem)
            if result {
                return elem
            }
        }
        return .none
    }

    /// This method is like find except that it returns the index of the first element
    /// that passes the callback check.
    ///
    /// - parameter array: The array to search for the element in.
    /// - parameter callback: Function used to figure out whether element is the same.
    /// - returns: First element's index from the array found using the callback.
    open class func findIndex<T>(_ array: [T], callback: (T) -> Bool) -> Int? {
        for (index, elem): (Int, T) in array.enumerated() {
            if callback(elem) {
                return index
            }
        }
        return .none
    }

    /// This method is like findIndex except that it iterates over elements of the array
    /// from right to left.
    ///
    /// - parameter array: The array to search for the element in.
    /// - parameter callback: Function used to figure out whether element is the same.
    /// - returns: Last element's index from the array found using the callback.
    open class func findLastIndex<T>(_ array: [T], callback: (T) -> Bool) -> Int? {
        let count = array.count
        for (index, _) in array.enumerated() {
            let reverseIndex = count - (index + 1)
            let elem: T = array[reverseIndex]
            if callback(elem) {
                return reverseIndex
            }
        }
        return .none
    }

    /// Gets the first element in the array.
    ///
    /// - parameter array: The array to wrap.
    /// - returns: First element from the array.
    open class func first<T>(_ array: [T]) -> T? {
        if array.isEmpty {
            return .none
        } else {
            return array[0]
        }
    }
    /// Splits a collection into sets, grouped by the result of running each value through a callback.
    ///
    /// - parameter array: The array to group
    /// - parameter callback: Function whose response will be used as a key in the new string
    /// - returns: grouped collection
    open class func groupBy<T, U>(_ array: [T], callback: (T) -> U) -> [U: [T]] {
        var grouped = [U: [T]]()
        for element in array {
            let key = callback(element)
            if var arr = grouped[key] {
                arr.append(element)
                grouped[key] = arr
            } else {
                grouped[key] = [element]
            }
        }
        return grouped
    }
    /// Gets the second element in the array.
    ///
    /// - parameter array: The array to wrap.
    /// - returns: Second element from the array.
    open class func second<T>(_ array: [T]) -> T? {
        if array.count < 2 {
            return .none
        } else {
            return array[1]
        }
    }

    /// Gets the third element in the array.
    ///
    /// - parameter array: The array to wrap.
    /// - returns: Third element from the array.
    open class func third<T>(_ array: [T]) -> T? {
        if array.count < 3 {
            return .none
        } else {
            return array[2]
        }
    }

    /// Flattens a nested array of any depth.
    ///
    /// - parameter array: The array to flatten.
    /// - returns: Flattened array.
    open class func flatten<T>(_ array: [T]) -> [T] {
        var resultArr: [T] = []
        for elem: T in array {
            if let val = elem as? [T] {
                resultArr += self.flatten(val)
            } else {
                resultArr.append(elem)
            }
        }
        return resultArr
    }

    /// Maps a function that converts elements to a list and then concatenates them.
    ///
    /// - parameter array: The array to map.
    /// - parameter function: callback function that should return flattened values
    /// - returns: The array with the transformed values concatenated together.
    open class func flatMap<T, U>(_ array: [T], function: (T) -> ([U])) -> [U] {
        return array.map(function).reduce([], +)
    }

    /// Maps a function that converts a type to an Optional over an Optional, and then returns a single-level Optional.
    ///
    /// - parameter value: The array to map.
    /// - parameter function: callback function that should return mapped values
    /// - returns: The array with the transformed values concatenated together.
    open class func flatMap<T, U>(_ value: T?, function: (T) -> (U?)) -> U? {
        if let unwrapped = value.map(function) {
            return unwrapped
        } else {
            return .none
        }
    }

    /// Returns size of the array
    ///
    /// - parameter array: The array to size.
    /// - returns: size of the array
    open class func size<T>(_ array: [T]) -> Int {
        return array.count
    }

    /// Randomly shuffles the elements of an array.
    ///
    /// - parameter array: The array to shuffle.
    /// - returns: Shuffled array
    open class func shuffle<T>(_ array: [T]) -> [T] {
        var newArr = self.copy(array)
        // Implementation of Fisher-Yates shuffle
        // http://en.wikipedia.org/wiki/Fisher-Yates_Shuffle
        for index in 0..<array.count {
            let randIndex = self.random(index)

            if index != randIndex {
                newArr.swapAt(index, randIndex)
            }
        }
        return newArr
    }

    /// This method returns a sum of the elements in the array
    ///
    /// - parameter array: The array whose elements needs to be added
    /// - returns: Sum of the elements in the array
    open class func sum<T: Numeric>(_ array: [T]) -> T {
        return self.reduce(array, initial: 0) { $0 + $1 }
    }

    /// This method returns a dictionary of values in an array mapping to the
    /// total number of occurrences in the array.
    ///
    /// - parameter array: The array to source from.
    /// - returns: Dictionary that contains the key generated from the element passed in the function.
    open class func frequencies<T>(_ array: [T]) -> [T: Int] {
        return self.frequencies(array) { $0 }
    }

    /// This method returns a dictionary of values in an array mapping to the
    /// total number of occurrences in the array. If passed a function it returns
    /// a frequency table of the results of the given function on the arrays elements.
    ///
    /// - parameter array: The array to source from.
    /// - parameter function: The function to get value of the key for each element to group by.
    /// - returns: Dictionary that contains the key generated from the element passed in the function.
    open class func frequencies<T, U>(_ array: [T], function: (T) -> U) -> [U: Int] {
        var result = [U: Int]()
        for elem in array {
            let key = function(elem)
            if let freq = result[key] {
                result[key] = freq + 1
            } else {
                result[key] = 1
            }
        }
        return result
    }

    /// GCD function return greatest common denominator
    ///
    /// - parameter first: number
    /// - parameter second: number
    /// - returns: Greatest common denominator
    open class func gcd(_ first: Int, _ second: Int) -> Int {
        var first = first
        var second = second
        while second != 0 {
            (first, second) = (second, first % second)
        }
        return Swift.abs(first)
    }

    /// LCM function return least common multiple
    ///
    /// - parameter first: number
    /// - parameter second: number
    /// - returns: Least common multiple
    open class func lcm(_ first: Int, _ second: Int) -> Int {
        return (first / Dollar.gcd(first, second)) * second
    }

    /// The identity function. Returns the argument it is given.
    ///
    /// - parameter arg: Value to return
    /// - returns: Argument that was passed
    open class func id<T>(_ arg: T) -> T {
        return arg
    }

    /// Gets the index at which the first occurrence of value is found.
    ///
    /// - parameter array: The array to source from.
    /// - parameter value: Value whose index needs to be found.
    /// - returns: Index of the element otherwise returns nil if not found.
    open class func indexOf<T: Equatable>(_ array: [T], value: T) -> Int? {
        return self.findIndex(array) { $0 == value }
    }

    /// Gets all but the last element or last n elements of an array.
    ///
    /// - parameter array: The array to source from.
    /// - parameter numElements: The number of elements to ignore in the end.
    /// - returns: Array of initial values.
    open class func initial<T>(_ array: [T], numElements: Int = 1) -> [T] {
        var result: [T] = []
        if array.count > numElements && numElements >= 0 {
            for index in 0..<(array.count - numElements) {
                result.append(array[index])
            }
        }
        return result
    }

    /// Creates an array of unique values present in all provided arrays.
    ///
    /// - parameter arrays: The arrays to perform an intersection on.
    /// - returns: Intersection of all arrays passed.
    open class func intersection<T: Hashable>(_ arrays: [T]...) -> [T] {
        var map: [T: Int] = [T: Int]()
        for arr in arrays {
            for elem in arr {
                if let val: Int = map[elem] {
                    map[elem] = val + 1
                } else {
                    map[elem] = 1
                }
            }
        }
        var result: [T] = []
        let count = arrays.count
        for (key, value) in map {
            if value == count {
                result.append(key)
            }
        }
        return result
    }

    /// Returns true if i is in range
    ///
    /// - parameter index: to check if it is in range
    /// - parameter isIn: to check in
    /// - returns: true if it is in range otherwise false
    open class func it<T>(_ index: T, isIn range: Range<T>) -> Bool {
        return index >= range.lowerBound && index < range.upperBound
    }

    /// Joins the elements in the array to create a concatenated element of the same type.
    ///
    /// - parameter array: The array to join the elements of.
    /// - parameter separator: The separator to join the elements with.
    /// - returns: Joined element from the array of elements.
    open class func join(_ array: [String], separator: String) -> String {
        return array.joined(separator: separator)
    }

    /// Creates an array of keys given a dictionary.
    ///
    /// - parameter dictionary: The dictionary to source from.
    /// - returns: Array of keys from dictionary.
    open class func keys<T, U>(_ dictionary: [T: U]) -> [T] {
        var result: [T] = []
        for key in dictionary.keys {
            result.append(key)
        }
        return result
    }

    /// Gets the last element from the array.
    ///
    /// - parameter array: The array to source from.
    /// - returns: Last element from the array.
    open class func last<T>(_ array: [T]) -> T? {
        if array.isEmpty {
            return .none
        } else {
            return array[array.count - 1]
        }
    }

    /// Gets the index at which the last occurrence of value is found.
    ///
    /// - parameter array: The array to source from.
    /// - parameter value: The value whose last index needs to be found.
    /// - returns: Last index of element if found otherwise returns nil.
    open class func lastIndexOf<T: Equatable>(_ array: [T], value: T) -> Int? {
        return self.findLastIndex(array) { $0 == value }
    }

    /// Maps each element to new value based on the map function passed
    ///
    /// - parameter collection: The collection to source from
    /// - parameter transform: The mapping function
    /// - returns: Array of elements mapped using the map function
    open class func map<T: Collection, E>(_ collection: T, transform: (T.Iterator.Element) -> E) -> [E] {
        return collection.map(transform)
    }

    /// Maps each element to new value based on the map function passed
    ///
    /// - parameter sequence: The sequence to source from
    /// - parameter transform: The mapping function
    /// - returns: Array of elements mapped using the map function
    open class func map<T: Sequence, E>(_ sequence: T, transform: (T.Iterator.Element) -> E) -> [E] {
        return sequence.map(transform)
    }

    /// Retrieves the maximum value in an array.
    ///
    /// - parameter array: The array to source from.
    /// - returns: Maximum element in array.
    open class func max<T: Comparable>(_ array: [T]) -> T? {
        if var maxVal = array.first {
            for elem in array {
                if maxVal < elem {
                    maxVal = elem
                }
            }
            return maxVal
        }
        return .none
    }

    /// Get memoized function to improve performance
    ///
    /// - parameter function: The function to memoize.
    /// - returns: Memoized function
    open class func memoize<T: Hashable, U>(_ function: @escaping (((T) -> U), T) -> U) -> ((T) -> U) {
        var cache = [T: U]()
        var funcRef: ((T) -> U)!
        funcRef = { (param: T) -> U in
            if let cacheVal = cache[param] {
                return cacheVal
            } else {
                cache[param] = function(funcRef, param)
                return cache[param]!
            }
        }
        return funcRef
    }

    /// Merge dictionaries together, later dictionaries overiding earlier values of keys.
    ///
    /// - parameter dictionaries: The dictionaries to source from.
    /// - returns: Merged dictionary with all of its keys and values.
    open class func merge<T, U>(_ dictionaries: [T: U]...) -> [T: U] {
        var result = [T: U]()
        for dict in dictionaries {
            for (key, value) in dict {
                result[key] = value
            }
        }
        return result
    }

    /// Merge arrays together in the supplied order.
    ///
    /// - parameter arrays: The arrays to source from.
    /// - returns: Array with all values merged, including duplicates.
    open class func merge<T>(_ arrays: [T]...) -> [T] {
        var result = [T]()
        for arr in arrays {
            result += arr
        }
        return result
    }

    /// Retrieves the minimum value in an array.
    ///
    /// - parameter array: The array to source from.
    /// - returns: Minimum value from array.
    open class func min<T: Comparable>(_ array: [T]) -> T? {
        if var minVal = array.first {
            for elem in array {
                if minVal > elem {
                    minVal = elem
                }
            }
            return minVal
        }
        return .none
    }

    /// A no-operation function.
    ///
    /// - returns: nil.
    open class func noop() -> () {
    }

    /// Gets the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
    ///
    /// - returns: number of seconds as double
    open class func now() -> TimeInterval {
        return Date().timeIntervalSince1970
    }

    /// Creates a shallow clone of a dictionary excluding the specified keys.
    ///
    /// - parameter dictionary: The dictionary to source from.
    /// - parameter keys: The keys to omit from returning dictionary.
    /// - returns: Dictionary with the keys specified omitted.
    open class func omit<T, U>(_ dictionary: [T: U], keys: T...) -> [T: U] {
        var result: [T: U] = [T: U]()

        for (key, value) in dictionary {
            if !self.contains(keys, value: key) {
                result[key] = value
            }
        }
        return result
    }

    /// Get a wrapper function that executes the passed function only once
    ///
    /// - parameter function: That takes variadic arguments and return nil or some value
    /// - returns: Wrapper function that executes the passed function only once
    /// Consecutive calls will return the value returned when calling the function first time
    open class func once<T, U>(_ function: @escaping (T...) -> U) -> (T...) -> U {
        var result: U?
        let onceFunc = { (params: T...) -> U in
            typealias Function = ([T]) -> U
            if let returnVal = result {
                return returnVal
            } else {
                let f = unsafeBitCast(function, to: Function.self)
                result = f(params)
                return result!
            }
        }
        return onceFunc
    }

    /// Get a wrapper function that executes the passed function only once
    ///
    /// - parameter function: That takes variadic arguments and return nil or some value
    /// - returns: Wrapper function that executes the passed function only once
    /// Consecutive calls will return the value returned when calling the function first time
    open class func once<U>(_ function: @escaping () -> U) -> () -> U {
        var result: U?
        let onceFunc = { () -> U in
            if let returnVal = result {
                return returnVal
            } else {
                result = function()
                return result!
            }
        }
        return onceFunc
    }

    /// Creates a function that, when called, invokes func with any additional partial arguments prepended to those provided to the new function.
    ///
    /// - parameter function: to invoke
    /// - parameter parameters: to pass the function when invoked
    /// - returns: Function with partial arguments prepended
    open class func partial<T, E> (_ function: @escaping (T...) -> E, _ parameters: T...) -> ((T...) -> E) {
        return { (params: T...) -> E in
            typealias Function = ([T]) -> E
            let f = unsafeBitCast(function, to: Function.self)
            return f(parameters + params)
        }
    }

    /// Produces an array of arrays, each containing n elements, each offset by step.
    /// If the final partition is not n elements long it is dropped.
    ///
    /// - parameter array: The array to partition.
    /// - parameter n: The number of elements in each partition.
    /// - parameter step: The number of elements to progress between each partition. Set to n if not supplied.
    /// - returns: Array partitioned into n element arrays, starting step elements apart.
    open class func partition<T>(_ array: [T], n num: Int, step: Int? = .none) -> [[T]] {
        var num = num
        var step = step
        var result = [[T]]()

        if step == .none { step = num } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if num < 1 { num = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        if num > array.count { return [[]] }

        for i in self.range(from: 0, through: array.count - num, incrementBy: step!) {
            result.append(Array(array[i..<(i + num)] as ArraySlice<T>))
        }
        return result
    }

    /// Produces an array of arrays, each containing n elements, each offset by step.
    ///
    /// - parameter array: The array to partition.
    /// - parameter n: The number of elements in each partition.
    /// - parameter step: The number of elements to progress between each partition. Set to n if not supplied.
    /// - parameter pad: An array of elements to pad the last partition if it is not long enough to
    ///            contain n elements. If there are not enough pad elements
    ///            the last partition may less than n elements long.
    /// - returns: Array partitioned into n element arrays, starting step elements apart.
    open class func partition<T>(_ array: [T], n num: Int, step: Int? = .none, pad: [T]?) -> [[T]] {
        let array = array
        var num = num
        var step = step
        var result: [[T]] = []
        var need = 0

        if step == .none { step = num } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if num < 1 { num = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.

        for i in self.range(from: 0, to: array.count, incrementBy: step!) {
            var end = i + num
            if end > array.count { end = array.count }
            result.append(Array(array[i..<end] as ArraySlice<T>))
            if end != i + num { need = i + num - end; break }
        }

        if need != 0 {
            if let padding = pad {
                let end = padding.count > need ? need : padding.count
                result[result.count - 1] += Array(padding[0..<end] as ArraySlice<T>)
            }
        }
        return result
    }

    /// Produces an array of arrays, each containing n elements, each offset by step.
    ///
    /// - parameter array: The array to partition.
    /// - parameter n: The number of elements in each partition.
    /// - parameter step: The number of elements to progress between each partition. Set to n if not supplied.
    /// - returns: Array partitioned into n element arrays, starting step elements apart.
    open class func partitionAll<T>(_ array: [T], n num: Int, step: Int? = .none) -> [[T]] {
        var num = num
        var step = step
        var result = [[T]]()
        if step == .none { step = num } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if num < 1 { num = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.

        for i in self.range(from: 0, to: array.count, incrementBy: step!) {
            var end = i + num
            if end > array.count { end = array.count }
            result.append(Array(array[i..<end] as ArraySlice<T>))
        }
        return result
    }

    /// Applies function to each element in array, splitting it each time function returns a new value.
    ///
    /// - parameter array: The array to partition.
    /// - parameter function: Function which takes an element and produces an equatable result.
    /// - returns: Array partitioned in order, splitting via results of function.
    open class func partitionBy<T, U: Equatable>(_ array: [T], function: (T) -> U) -> [[T]] {
        var result = [[T]]()
        var lastValue: U? = .none

        for item in array {
            let value = function(item)

            if let lastValue = lastValue, value == lastValue {
                result[result.count-1].append(item)
            } else {
                result.append([item])
                lastValue = value
            }
        }
        return result
    }

    /// Creates a shallow clone of a dictionary composed of the specified keys.
    ///
    /// - parameter dictionary: The dictionary to source from.
    /// - parameter keys: The keys to pick values from.
    /// - returns: Dictionary with the key and values picked from the keys specified.
    open class func pick<T, U>(_ dictionary: [T: U], keys: T...) -> [T: U] {
        var result: [T: U] = [T: U]()
        for key in keys {
            result[key] = dictionary[key]
        }
        return result
    }

    /// Retrieves the value of a specified property from all elements in the array.
    ///
    /// - parameter array: The array to source from.
    /// - parameter value: The property on object to pull out value from.
    /// - returns: Array of values from array of objects with property of value.
    open class func pluck<T, E>(_ array: [[T: E]], value: T) -> [E] {
        var result: [E] = []
        for obj in array {
            if let val = obj[value] {
                result.append(val)
            }
        }
        return result
    }

    /// Removes all provided values from the given array.
    ///
    /// - parameter array: The array to source from.
    /// - parameter values: values to remove from the array
    /// - returns: Array with values pulled out.
    open class func pull<T: Equatable>(_ array: [T], values: T...) -> [T] {
        return self.pull(array, values: values)
    }

    /// Removes all provided values from the given array.
    ///
    /// - parameter array: The array to source from.
    /// - parameter values: The values to remove.
    /// - returns: Array with values pulled out.
    open class func pull<T: Equatable>(_ array: [T], values: [T]) -> [T] {
        return array.filter { !self.contains(values, value: $0) }
    }

    /// Removes all provided values from the given array at the given indices
    ///
    /// - parameter array: The array to source from.
    /// - parameter indices: The indices to remove from.
    /// - returns: Array with values pulled out.
    open class func pullAt<T: Equatable>(_ array: [T], indices: Int...) -> [T] {
        var elemToRemove = [T]()
        for index in indices {
            elemToRemove.append(array[index])
        }
        return Dollar.pull(array, values: elemToRemove)
    }

    /// Returns permutation of array
    ///
    /// - parameter character: Characters to source the permutation
    /// - returns: Array of permutation of the characters specified
    open class func permutation<T>(_ elements: [T]) -> [String] where T : CustomStringConvertible {
        guard elements.count > 1 else {
            return Dollar.map(elements) { $0.description }
        }

        let strings = self.permutation(Dollar.initial(elements))
        if let char = Dollar.last(elements) {
            return Dollar.reduce(strings, initial: []) { (result, str) -> [String] in
                let splitStr = Dollar.map(str.description) { $0.description }
                return result + Dollar.map(0...splitStr.count) { (index) -> String in
                    var copy = Dollar.copy(splitStr)
                    copy.insert(char.description, at: (splitStr.count - index))
                    return Dollar.join(copy, separator: "")
                }
                }.sorted()
        }
        return []
    }

    /// Returns random number from 0 upto but not including upperBound
    ///
    /// - parameter upperBound: upper bound when generating random number
    /// - returns: Random number
    open class func random(_ upperBound: Int) -> Int {
        #if os(Linux)
            let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
            srand(time)
            let randomNumber = Glibc.random() % upperBound
        #else
            let randomNumber = Int(arc4random_uniform(UInt32(upperBound)))
        #endif
        return randomNumber
    }

    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// - parameter endVal: End value of range.
    /// - returns: Array of elements based on the sequence starting from 0 to endVal and incremented by 1.
    open class func range<T: Strideable>(_ endVal: T) -> [T] where T : ExpressibleByIntegerLiteral {
        return self.range(from: 0, to: endVal)
    }

    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// - parameter from: Start value of range
    /// - parameter to: End value of range
    /// - returns: Array of elements based on the sequence that is incremented by 1
    open class func range<T: Strideable>(from startVal: T, to endVal: T) -> [T] {
        return self.range(from: startVal, to: endVal, incrementBy: 1)
    }

    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// - parameter from: Start value of range.
    /// - parameter to: End value of range.
    /// - parameter incrementBy: Increment sequence by.
    /// - returns: Array of elements based on the sequence.
    open class func range<T: Strideable>(from startVal: T, to endVal: T, incrementBy: T.Stride) -> [T] {
        let range = stride(from: startVal, to: endVal, by: incrementBy)
        return self.sequence(range)
    }

    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// - parameter from: Start value of range
    /// - parameter through: End value of range
    /// - returns: Array of elements based on the sequence that is incremented by 1
    open class func range<T: Strideable>(from startVal: T, through endVal: T) -> [T] {
        return self.range(from: startVal, to: endVal.advanced(by: 1), incrementBy: 1)
    }

    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// - parameter from: Start value of range.
    /// - parameter through: End value of range.
    /// - parameter incrementBy: Increment sequence by.
    /// - returns: Array of elements based on the sequence.
    open class func range<T: Strideable>(from startVal: T, through endVal: T, incrementBy: T.Stride) -> [T] {
        return self.range(from: startVal, to: endVal.advanced(by: 1), incrementBy: incrementBy)
    }

    /// Reduce function that will resolve to one value after performing combine function on all elements
    ///
    /// - parameter array: The array to source from.
    /// - parameter initial: Initial value to seed the reduce function with
    /// - parameter combine: Function that will combine the passed value with element in the array
    /// - returns: The result of reducing all of the elements in the array into one value
    open class func reduce<U, T>(_ array: [T], initial: U, combine: (U, T) -> U) -> U {
        return array.reduce(initial, combine)
    }

    /// Creates an array of an arbitrary sequence. Especially useful with builtin ranges.
    ///
    /// - parameter seq: The sequence to generate from.
    /// - returns: Array of elements generated from the sequence.
    open class func sequence<S: Sequence>(_ seq: S) -> [S.Iterator.Element] {
        return Array<S.Iterator.Element>(seq)
    }

    /// Removes all elements from an array that the callback returns true.
    ///
    /// - parameter array: The array to wrap.
    /// - parameter callback: Remove elements for which callback returns true.
    /// - returns: Array with elements filtered out.
    open class func remove<T>(_ array: [T], callback: (T) -> Bool) -> [T] {
        return array.filter { !callback($0) }
    }

    /// Removes an element from an array.
    ///
    /// - parameter array: The array to source from.
    /// - parameter value: Element that is to be removed
    /// - returns: Array with element removed.
    open class func remove<T: Equatable>(_ array: [T], value: T) -> [T] {
        return self.remove(array, callback: {$0 == value})
    }

    /// The opposite of initial this method gets all but the first element or first n elements of an array.
    ///
    /// - parameter array: The array to source from.
    /// - parameter numElements: The number of elements to exclude from the beginning.
    /// - returns: The rest of the elements.
    open class func rest<T>(_ array: [T], numElements: Int = 1) -> [T] {
        var result: [T] = []
        if numElements < array.count && numElements >= 0 {
            for index in numElements..<array.count {
                result.append(array[index])
            }
        }
        return result
    }

    /// Returns a sample from the array.
    ///
    /// - parameter array: The array to sample from.
    /// - returns: Random element from array.
    open class func sample<T>(_ array: [T]) -> T {
        return array[self.random(array.count)]
    }

    /// Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.
    ///
    /// - parameter array: The array to slice.
    /// - parameter start: Start index.
    /// - parameter end: End index.
    /// - returns: First element from the array.
    open class func slice<T>(_ array: [T], start: Int, end: Int = 0) -> [T] {
        var uend = end
        if uend == 0 {
            uend = array.count
        }

        if end > array.count || start > array.count || uend < start {
            return []
        } else {
            return Array(array[start..<uend])
        }
    }

    /// Gives the smallest index at which a value should be inserted into a given the array is sorted.
    ///
    /// - parameter array: The array to source from.
    /// - parameter value: Find sorted index of this value.
    /// - returns: Index of where the elemnt should be inserted.
    open class func sortedIndex<T: Comparable>(_ array: [T], value: T) -> Int {
        for (index, elem) in array.enumerated() {
            if elem > value {
                return index
            }
        }
        return array.count
    }

    /// Invokes interceptor with the object and then returns object.
    ///
    /// - parameter object: Object to tap into.
    /// - parameter function: Callback function to invoke.
    /// - returns: Returns the object back.
    open class func tap<T>(_ object: T, function: (T) -> ()) -> T {
        function(object)
        return object
    }

    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// - parameter num: Number of times to call function.
    /// - parameter function: The function to be called every time.
    /// - returns: Values returned from callback function.
    open class func times<T>(_ num: Int, function: () -> T) -> [T] {
        return self.times(num) { (index: Int) -> T in
            return function()
        }
    }

    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// - parameter num: Number of times to call function
    /// - parameter function: The function to be called every time
    open class func times(_ num: Int, function: @escaping () -> Void) {
        _ = self.times(num) { (index: Int) -> () in
            function()
        }
    }

    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// - parameter num: Number of times to call function.
    /// - parameter function: The function to be called every time that takes index.
    /// - returns: Values returned from callback function.
    open class func times<T>(_ num: Int, function: (Int) -> T) -> [T] {
        var result: [T] = []
        for index in (0..<num) {
            result.append(function(index))
        }
        return result
    }

    /// Transposes matrix if able. If unable; parameter matrix is returned.
    ///
    /// - parameter matrix: Generic matrix containing any type.
    /// - returns: A transposed version of input matrix.
    open class func transpose<T>(_ matrix: [[T]]) -> [[T]] {
        guard matrix.filter({ return $0.count == matrix[0].count }).count == matrix.count else {
            return matrix
        }
        var returnMatrix: [[T?]] = Array(repeating: Array(repeating: nil, count: matrix.count),
                                         count: matrix.first!.count)
        for (rowNumber, row) in matrix.enumerated() {
            for (index, item) in row.enumerated() {
                returnMatrix[index][rowNumber] = item
            }
        }
        return returnMatrix.compactMap { $0.compactMap { $0 } }
    }

    /// Creates an array of unique values, in order, of the provided arrays.
    ///
    /// - parameter arrays: The arrays to perform union on.
    /// - returns: Resulting array after union.
    open class func union<T: Hashable>(_ arrays: [T]...) -> [T] {
        var result: [T] = []
        for arr in arrays {
            result += arr
        }
        return self.uniq(result)
    }

    /// Creates a duplicate-value-free version of an array.
    ///
    /// - parameter array: The array to source from.
    /// - returns: An array with unique values.
    open class func uniq<T: Hashable>(_ array: [T]) -> [T] {
        var result: [T] = []
        var map: [T: Bool] = [T: Bool]()
        for elem in array {
            if map[elem] == .none {
                result.append(elem)
            }
            map[elem] = true
        }
        return result
    }

    /// Create a duplicate-value-free version of an array based on the condition.
    /// Uses the last value generated by the condition function
    ///
    /// - parameter array: The array to source from.
    /// - parameter condition: Called per iteration
    /// - returns: An array with unique values.
    open class func uniq<T: Hashable, U: Hashable>(_ array: [T], by condition: (T) -> U) -> [T] {
        var result: [T] = []
        var map: [U: Bool] = [U: Bool]()
        for elem in array {
            let val = condition(elem)
            if map[val] == .none {
                result.append(elem)
            }
            map[val] = true
        }
        return result
    }

    /// Creates an array of values of a given dictionary.
    ///
    /// - parameter dictionary: The dictionary to source from.
    /// - returns: An array of values from the dictionary.
    open class func values<T, U>(_ dictionary: [T: U]) -> [U] {
        var result: [U] = []
        for value in dictionary.values {
            result.append(value)
        }
        return result
    }

    /// Creates an array excluding all provided values.
    ///
    /// - parameter array: The array to source from.
    /// - parameter values: Values to exclude.
    /// - returns: Array excluding provided values.
    open class func without<T: Equatable>(_ array: [T], values: T...) -> [T] {
        return self.pull(array, values: values)
    }

    /// Creates an array that is the symmetric difference of the provided arrays.
    ///
    /// - parameter arrays: The arrays to perform xor on in order.
    /// - returns: Resulting array after performing xor.
    open class func xor<T: Hashable>(_ arrays: [T]...) -> [T] {
        var map: [T: Bool] = [T: Bool]()
        for arr in arrays {
            for elem in arr {
                map[elem] = !(map[elem] ?? false)
            }
        }
        var result: [T] = []
        for (key, value) in map {
            if value {
                result.append(key)
            }
        }
        return result
    }

    /// Creates an array of grouped elements, the first of which contains the first elements
    /// of the given arrays.
    ///
    /// - parameter arrays: The arrays to be grouped.
    /// - returns: An array of grouped elements.
    open class func zip<T>(_ arrays: [T]...) -> [[T]] {
        var result: [[T]] = []
        for _ in self.first(arrays)! as [T] {
            result.append([] as [T])
        }
        for (_, array) in arrays.enumerated() {
            for (elemIndex, elem): (Int, T) in array.enumerated() {
                result[elemIndex].append(elem)
            }
        }
        return result
    }

    /// Creates an object composed from arrays of keys and values.
    ///
    /// - parameter keys: The array of keys.
    /// - parameter values: The array of values.
    /// - returns: Dictionary based on the keys and values passed in order.
    open class func zipObject<T, E>(_ keys: [T], values: [E]) -> [T: E] {
        var result = [T: E]()
        for (index, key) in keys.enumerated() {
            result[key] = values[index]
        }
        return result
    }

    /// Returns the collection wrapped in the chain object
    ///
    /// - parameter collection: of elements
    /// - returns: Chain object
    open class func chain<T>(_ collection: [T]) -> Chain<T> {
        return Chain(collection)
    }
}

//  ________  ___  ___  ________  ___  ________
// |\   ____\|\  \|\  \|\   __  \|\  \|\   ___  \
// \ \  \___|\ \  \\\  \ \  \|\  \ \  \ \  \\ \  \
//  \ \  \    \ \   __  \ \   __  \ \  \ \  \\ \  \
//   \ \  \____\ \  \ \  \ \  \ \  \ \  \ \  \\ \  \
//    \ \_______\ \__\ \__\ \__\ \__\ \__\ \__\\ \__\
//     \|_______|\|__|\|__|\|__|\|__|\|__|\|__| \|__|
//
open class Chain<C> {

    fileprivate var result: Wrapper<[C]>
    fileprivate var funcQueue: [(Wrapper<[C]>) -> Wrapper<[C]>] = []
    open var value: [C] {
        get {
            var result: Wrapper<[C]> = self.result
            for function in self.funcQueue {
                result = function(result)
            }
            return result.value
        }
    }

    /// Initializer of the wrapper object for chaining.
    ///
    /// - parameter collection: The array to wrap.
    public init(_ collection: [C]) {
        self.result = Wrapper(collection)
    }

    /// Get the first object in the wrapper object.
    ///
    /// - returns: First element from the array.
    open func first() -> C? {
        return Dollar.first(self.value)
    }

    /// Get the second object in the wrapper object.
    ///
    /// - returns: Second element from the array.
    open func second() -> C? {
        return Dollar.second(self.value)
    }

    /// Get the third object in the wrapper object.
    ///
    /// - returns: Third element from the array.
    open func third() -> C? {
        return Dollar.third(self.value)
    }

    /// Flattens nested array.
    ///
    /// - returns: The wrapper object.
    open func flatten() -> Chain {
        return self.queue {
            return Wrapper(Dollar.flatten($0.value))
        }
    }

    /// Keeps all the elements except last one.
    ///
    /// - returns: The wrapper object.
    open func initial() -> Chain {
        return self.initial(1)
    }

    /// Keeps all the elements except last n elements.
    ///
    /// - parameter numElements: Number of items to remove from the end of the array.
    /// - returns: The wrapper object.
    open func initial(_ numElements: Int) -> Chain {
        return self.queue {
            return Wrapper(Dollar.initial($0.value, numElements: numElements))
        }
    }

    /// Maps elements to new elements.
    ///
    /// - parameter function: Function to map.
    /// - returns: The wrapper object.
    open func map(_ function: @escaping (C) -> C) -> Chain {
        return self.queue {
            var result: [C] = []
            for elem: C in $0.value {
                result.append(function(elem))
            }
            return Wrapper(result)
        }
    }

    /// Get the first object in the wrapper object.
    ///
    /// - parameter function: The array to wrap.
    /// - returns: The wrapper object.
    open func map(_ function: @escaping (Int, C) -> C) -> Chain {
        return self.queue {
            var result: [C] = []
            for (index, elem) in $0.value.enumerated() {
                result.append(function(index, elem))
            }
            return Wrapper(result)
        }
    }

    /// Get the first object in the wrapper object.
    ///
    /// - parameter function: The array to wrap.
    /// - returns: The wrapper object.
    open func each(_ function: @escaping (C) -> ()) -> Chain {
        return self.queue {
            for elem in $0.value {
                function(elem)
            }
            return $0
        }
    }

    /// Get the first object in the wrapper object.
    ///
    /// - parameter function: The array to wrap.
    /// - returns: The wrapper object.
    open func each(_ function: @escaping (Int, C) -> ()) -> Chain {
        return self.queue {
            for (index, elem) in $0.value.enumerated() {
                function(index, elem)
            }
            return $0
        }
    }

    /// Filter elements based on the function passed.
    ///
    /// - parameter function: Function to tell whether to keep an element or remove.
    /// - returns: The wrapper object.
    open func filter(_ function: @escaping (C) -> Bool) -> Chain {
        return self.queue {
            return Wrapper(($0.value).filter(function))
        }
    }

    /// Returns if all elements in array are true based on the passed function.
    ///
    /// - parameter function: Function to tell whether element value is true or false.
    /// - returns: Whether all elements are true according to func function.
    open func all(_ function: (C) -> Bool) -> Bool {
        return Dollar.every(self.value, callback: function)
    }

    /// Returns if any element in array is true based on the passed function.
    ///
    /// - parameter function: Function to tell whether element value is true or false.
    /// - returns: Whether any one element is true according to func function in the array.
    open func any(_ function: (C) -> Bool) -> Bool {
        let resultArr = self.value
        for elem in resultArr {
            if function(elem) {
                return true
            }
        }
        return false
    }

    /// Returns size of the array
    ///
    /// - returns: The wrapper object.
    open func size() -> Int {
        return self.value.count
    }

    /// Slice the array into smaller size based on start and end value.
    ///
    /// - parameter start: Start index to start slicing from.
    /// - parameter end: End index to stop slicing to and not including element at that index.
    /// - returns: The wrapper object.
    open func slice(_ start: Int, end: Int = 0) -> Chain {
        return self.queue {
          return Wrapper(Dollar.slice($0.value, start: start, end: end))
        }
    }

    fileprivate func queue(_ function: @escaping (Wrapper<[C]>) -> Wrapper<[C]>) -> Chain {
        funcQueue.append(function)
        return self
    }
}

typealias `$` = Dollar
typealias € = Dollar

private struct Wrapper<V> {
    let value: V
    init(_ value: V) {
        self.value = value
    }
}

fileprivate func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}
