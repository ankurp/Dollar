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

public class $ {
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
    /// :param n Number of times after which to call function.
    /// :param function Function to be called that takes params.
    /// :return Function that can be called n times after which the callback function is called.
    public class func after<T, E>(n: Int, function: (T...) -> E) -> ((T...) -> E?) {
        var counter = n
        return { (params: T...) -> E? in
            typealias Function = [T] -> E
            counter -= 1
            if counter <= 0 {
                let f = unsafeBitCast(function, Function.self)
                return f(params)
            }
            return .None
        }
    }
    
    /// Creates a function that executes passed function only after being called n times.
    ///
    /// :param n Number of times after which to call function.
    /// :param function Function to be called that does not take any params.
    /// :return Function that can be called n times after which the callback function is called.
    public class func after<T>(n: Int, function: () -> T) -> (() -> T?) {
        let f = self.after(n) { (params: Any?...) -> T in
            return function()
        }
        return { f() }
    }
    
    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// :param array The array to source from
    /// :param indexes Get elements from these indexes
    /// :return New array with elements from the indexes specified.
    public class func at<T>(array: [T], indexes: Int...) -> [T] {
        return self.at(array, indexes: indexes)
    }
    
    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// :param array The array to source from
    /// :param indexes Get elements from these indexes
    /// :return New array with elements from the indexes specified.
    public class func at<T>(array: [T], indexes: [Int]) -> [T] {
        var result: [T] = []
        for index in indexes {
            result.append(array[index])
        }
        return result
    }
    
    /// Creates a function that, when called, invokes func with the binding of arguments provided.
    ///
    /// :param function Function to be bound.
    /// :param parameters Parameters to be passed into the function when being invoked.
    /// :return A new function that when called will invoked the passed function with the parameters specified.
    public class func bind<T, E>(function: (T...) -> E, _ parameters: T...) -> (() -> E) {
        return { () -> E in
            typealias Function = [T] -> E
            let f = unsafeBitCast(function, Function.self)
            return f(parameters)
        }
    }
    
    /// Creates an array of elements split into groups the length of size.
    /// If array can’t be split evenly, the final chunk will be the remaining elements.
    ///
    /// :param array to chunk
    /// :param size size of each chunk
    /// :return array elements chunked
    public class func chunk<T>(array: [T], size: Int = 1) -> [[T]] {
        var result = [[T]]()
        var chunk = -1
        for (index, elem) in array.enumerate() {
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
    /// :param array Array to be compacted.
    /// :return A new array that doesnt have any nil values.
    public class func compact<T>(array: [T?]) -> [T] {
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
    /// :param functions - list of functions
    /// :return A function that can be called with variadic parameters of values
    public class func compose<T>(functions: ((T...) -> [T])...) -> ((T...) -> [T]) {
        typealias Function = [T] -> [T]
        return {
            var result = $0
            for fun in functions {
                let f = unsafeBitCast(fun, Function.self)
                result = f(result)
            }
            return result
        }
    }

    /// Compose two or more functions passing result of the first function
    /// into the next function until all the functions have been evaluated
    ///
    /// :param functions - list of functions
    /// :return A function that can be called with array of values
    public class func compose<T>(functions: ([T] -> [T])...) -> ([T] -> [T]) {
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
    /// :param array The array to check against.
    /// :param value The value to check.
    /// :return Whether value is in the array.
    public class func contains<T : Equatable>(array: [T], value: T) -> Bool {
        return array.contains(value)
    }
    
    /// Create a copy of an array
    ///
    /// :param array The array to copy
    /// :return New copy of array
    public class func copy<T>(array: [T]) -> [T] {
        var newArr : [T] = []
        for elem in array {
            newArr.append(elem)
        }
        return newArr
    }

    /// Cycles through the array indefinetly passing each element into the callback function
    ///
    /// :param array to cycle through
    /// :param callback function to call with the element
    public class func cycle<T, U>(array: [T], callback: (T) -> (U)) {
        while true {
            for elem in array {
                callback(elem)
            }
        }
    }
    
    /// Cycles through the array n times passing each element into the callback function
    ///
    /// :param array to cycle through
    /// :param times Number of times to cycle through the array
    /// :param callback function to call with the element
    public class func cycle<T, U>(array: [T], _ times: Int, callback: (T) -> (U)) {
        for _ in 0..<times {
            for elem in array {
                callback(elem)
            }
        }
    }

    /// Creates an array excluding all values of the provided arrays in order
    ///
    /// :param arrays The arrays to difference between.
    /// :return The difference between the first array and all the remaining arrays from the arrays params.
    public class func differenceInOrder<T: Equatable>(arrays: [[T]]) -> [T] {
        return $.reduce(self.rest(arrays), initial: self.first(arrays)!) { (result, arr) -> [T] in
            return result.filter() { !arr.contains($0) }
        }
    }

    /// Creates an array excluding all values of the provided arrays with or without order
    /// Without order difference is much faster and at times 100% than difference with order
    ///
    /// :param arrays The arrays to difference between.
    /// :param inOrder Optional Paramter which is true by default
    /// :return The difference between the first array and all the remaining arrays from the arrays params.
    public class func difference<T: Hashable>(arrays: [T]..., inOrder: Bool = true) -> [T] {
        if inOrder {
            return self.differenceInOrder(arrays)
        } else {
            var result : [T] = []
            var map : [T: Int] = [T: Int]()
            let firstArr : [T] = self.first(arrays)!
            let restArr : [[T]] = self.rest(arrays) as [[T]]
            for elem in firstArr {
                if let val = map[elem] {
                    map[elem] = val + 1
                } else {
                    map[elem] = 1
                }
            }
            for arr in restArr {
                for elem in arr {
                    map.removeValueForKey(elem)
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
    /// :param array The array to iterate over
    /// :param callback function that gets called with each item in the array
    /// :return The array passed
    public class func each<T>(array: [T], callback: (T) -> ()) -> [T] {
        for elem in array {
            callback(elem)
        }
        return array
    }

    /// Call the callback passing index of the element and each element in the array
    ///
    /// :param array The array to iterate over
    /// :param callback function that gets called with each item in the array with its index
    /// :return The array passed
    public class func each<T>(array: [T], callback: (Int, T) -> ()) -> [T] {
        for (index, elem): (Int, T) in array.enumerate() {
            callback(index, elem)
        }
        return array
    }
    
    /// Call the callback on all elements that meet the when condition
    ///
    /// :param array The array to check.
    /// :param when Condition to check before performing callback
    /// :param callback Check whether element value is true or false.
    /// :return The array passed
    public class func each<T>(array: [T], when: (T) -> Bool, callback: (T) -> ()) ->[T] {
        for elem in array where when(elem) {
            callback(elem);
        }
        return array;
    }
    
    /// Checks if two optionals containing Equatable types are equal.
    ///
    /// :param value The first optional to check.
    /// :param other The second optional to check.
    /// :return: true if the optionals contain two equal values, or both are nil; false otherwise.
    public class func equal<T: Equatable>(value: T?, _ other: T?) -> Bool {
        switch (value, other) {
        case (.None, .None):
            return true
        case (.None, .Some(_)):
            return false
        case (.Some(_), .None):
            return false
        case (.Some(let unwrappedValue), .Some(let otherUnwrappedValue)):
            return unwrappedValue == otherUnwrappedValue
        }
    }
    
    /// Checks if the given callback returns true value for all items in the array.
    ///
    /// :param array The array to check.
    /// :param callback Check whether element value is true or false.
    /// :return First element from the array.
    public class func every<T>(array: [T], callback: (T) -> Bool) -> Bool {
        for elem in array {
            if !callback(elem) {
                return false
            }
        }
        return true
    }
    

    /// Returns Factorial of integer
    ///
    /// :param num number whose factorial needs to be calculated
    /// :return factorial
    public class func factorial(num: Int) -> Int {
        guard num > 0 else { return 1 }
        return num * $.factorial(num - 1)
    }
    
    /// Get element from an array at the given index which can be negative
    /// to find elements from the end of the array
    ///
    /// :param array The array to fetch from
    /// :param index Can be positive or negative to find from end of the array
    /// :param orElse Default value to use if index is out of bounds
    /// :return Element fetched from the array or the default value passed in orElse
    public class func fetch<T>(array: [T], _ index: Int, orElse: T? = .None) -> T! {
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
    /// :param array to fill
    /// :param elem the element to replace
    /// :return array elements chunked
    public class func fill<T>(inout array: [T], withElem elem: T, startIndex: Int = 0, endIndex: Int? = .None) -> [T] {
        let endIndex = endIndex ?? array.count
        for (index, _) in array.enumerate() {
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
    /// :param array The array to search for the element in.
    /// :param callback The callback function to tell whether element is found.
    /// :return Optional containing either found element or nil.
    public class func find<T>(array: [T], callback: (T) -> Bool) -> T? {
        for elem in array {
            let result = callback(elem)
            if result {
                return elem
            }
        }
        return .None
    }
    
    /// This method is like find except that it returns the index of the first element
    /// that passes the callback check.
    ///
    /// :param array The array to search for the element in.
    /// :param callback Function used to figure out whether element is the same.
    /// :return First element's index from the array found using the callback.
    public class func findIndex<T>(array: [T], callback: (T) -> Bool) -> Int? {
        for (index, elem): (Int, T) in array.enumerate() {
            if callback(elem) {
                return index
            }
        }
        return .None
    }
    
    /// This method is like findIndex except that it iterates over elements of the array
    /// from right to left.
    ///
    /// :param array The array to search for the element in.
    /// :param callback Function used to figure out whether element is the same.
    /// :return Last element's index from the array found using the callback.
    public class func findLastIndex<T>(array: [T], callback: (T) -> Bool) -> Int? {
        let count = array.count
        for (index, _) in array.enumerate() {
            let reverseIndex = count - (index + 1)
            let elem : T = array[reverseIndex]
            if callback(elem) {
                return reverseIndex
            }
        }
        return .None
    }
    
    /// Gets the first element in the array.
    ///
    /// :param array The array to wrap.
    /// :return First element from the array.
    public class func first<T>(array: [T]) -> T? {
        if array.isEmpty {
            return .None
        } else {
            return array[0]
        }
    }
    
    /// Gets the second element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Second element from the array.
    public class func second<T>(array: [T]) -> T? {
        if array.count < 2 {
            return .None
        } else {
            return array[1]
        }
    }
    
    /// Gets the third element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Third element from the array.
    public class func third<T>(array: [T]) -> T? {
        if array.count < 3 {
            return .None
        } else {
            return array[2]
        }
    }
    
    /// Flattens a nested array of any depth.
    ///
    /// :param array The array to flatten.
    /// :return Flattened array.
    public class func flatten<T>(array: [T]) -> [T] {
        var resultArr: [T] = []
        for elem : T in array {
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
    /// :param array The array to map.
    /// :return The array with the transformed values concatenated together.
    public class func flatMap<T, U>(array: [T], f: (T) -> ([U])) -> [U] {
        return array.map(f).reduce([], combine: +)
    }
    
    /// Maps a function that converts a type to an Optional over an Optional, and then returns a single-level Optional.
    ///
    /// :param array The array to map.
    /// :return The array with the transformed values concatenated together.
    public class func flatMap<T, U>(value: T?, f: (T) -> (U?)) -> U? {
        if let unwrapped = value.map(f) {
            return unwrapped
        } else {
            return .None
        }
    }
    
    /// Returns size of the array
    ///
    /// :param array The array to size.
    /// :return size of the array
    public class func size<T>(array: [T]) -> Int {
        return array.count
    }
    
    /// Randomly shuffles the elements of an array.
    ///
    /// :param array The array to shuffle.
    /// :return Shuffled array
    public class func shuffle<T>(array: [T]) -> [T] {
        var newArr = self.copy(array)
        // Implementation of Fisher-Yates shuffle
        // http://en.wikipedia.org/wiki/Fisher-Yates_Shuffle
        for index in 0..<array.count {
            let randIndex = self.random(index)
            
            if index != randIndex {
                Swift.swap(&newArr[index], &newArr[randIndex])
            }
        }
        return newArr
    }
    
    /// This method returns a dictionary of values in an array mapping to the
    /// total number of occurrences in the array.
    ///
    /// :param array The array to source from.
    /// :return Dictionary that contains the key generated from the element passed in the function.
    public class func frequencies<T>(array: [T]) -> [T: Int] {
        return self.frequencies(array) { $0 }
    }
    
    /// This method returns a dictionary of values in an array mapping to the
    /// total number of occurrences in the array. If passed a function it returns
    /// a frequency table of the results of the given function on the arrays elements.
    ///
    /// :param array The array to source from.
    /// :param function The function to get value of the key for each element to group by.
    /// :return Dictionary that contains the key generated from the element passed in the function.
    public class func frequencies<T, U: Equatable>(array: [T], function: (T) -> U) -> [U: Int] {
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
    /// :param first number
    /// :param second number
    /// :return Greatest common denominator
    public class func gcd(first: Int, _ second: Int) -> Int {
        var first = first
        var second = second
        while second != 0 {
            (first, second) = (second, first % second)
        }
        return Swift.abs(first)
    }

    /// LCM function return least common multiple
    ///
    /// :param first number
    /// :param second number
    /// :return Least common multiple
    public class func lcm(first: Int, _ second: Int) -> Int {
        return (first / $.gcd(first, second)) * second
    }
    
    /// The identity function. Returns the argument it is given.
    ///
    /// :param arg Value to return
    /// :return Argument that was passed
    public class func id<T>(arg: T) -> T {
        return arg
    }
    
    /// Gets the index at which the first occurrence of value is found.
    ///
    /// :param array The array to source from.
    /// :param value Value whose index needs to be found.
    /// :return Index of the element otherwise returns nil if not found.
    public class func indexOf<T: Equatable>(array: [T], value: T) -> Int? {
        return self.findIndex(array) { $0 == value }
    }
    
    /// Gets all but the last element or last n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to ignore in the end.
    /// :return Array of initial values.
    public class func initial<T>(array: [T], numElements: Int = 1) -> [T] {
        var result: [T] = []
        if (array.count > numElements && numElements >= 0) {
            for index in 0..<(array.count - numElements) {
                result.append(array[index])
            }
        }
        return result
    }
    
    /// Creates an array of unique values present in all provided arrays.
    ///
    /// :param arrays The arrays to perform an intersection on.
    /// :return Intersection of all arrays passed.
    public class func intersection<T : Hashable>(arrays: [T]...) -> [T] {
        var map : [T: Int] = [T: Int]()
        for arr in arrays {
            for elem in arr {
                if let val : Int = map[elem] {
                    map[elem] = val + 1
                } else {
                    map[elem] = 1
                }
            }
        }
        var result : [T] = []
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
    /// :param i to check if it is in range
    /// :param range to check in
    /// :return true if it is in range otherwise false
    public class func it<T: Comparable>(i: T, isIn range: Range<T>) -> Bool {
        return i >= range.startIndex && i < range.endIndex
    }

    /// Returns true if i is in interval
    ///
    /// :param i to check if it is in interval
    /// :param interval to check in
    /// :return true if it is in interval otherwise false
    public class func it<I : IntervalType>(i: I.Bound, isIn interval: I) -> Bool {
        return interval.contains(i)
    }
    
    /// Joins the elements in the array to create a concatenated element of the same type.
    ///
    /// :param array The array to join the elements of.
    /// :param separator The separator to join the elements with.
    /// :return Joined element from the array of elements.
    public class func join(array: [String], separator: String) -> String {
        return array.joinWithSeparator(separator)
    }
    
    /// Creates an array of keys given a dictionary.
    ///
    /// :param dictionary The dictionary to source from.
    /// :return Array of keys from dictionary.
    public class func keys<T, U>(dictionary: [T: U]) -> [T] {
        var result : [T] = []
        for key in dictionary.keys {
            result.append(key)
        }
        return result
    }
    
    /// Gets the last element from the array.
    ///
    /// :param array The array to source from.
    /// :return Last element from the array.
    public class func last<T>(array: [T]) -> T? {
        if array.isEmpty {
            return .None
        } else {
            return array[array.count - 1]
        }
    }
    
    /// Gets the index at which the last occurrence of value is found.
    ///
    /// param: array:: The array to source from.
    /// :param value The value whose last index needs to be found.
    /// :return Last index of element if found otherwise returns nil.
    public class func lastIndexOf<T: Equatable>(array: [T], value: T) -> Int? {
        return self.findLastIndex(array) { $0 == value }
    }
    
    /// Maps each element to new value based on the map function passed
    ///
    /// :param collection The collection to source from
    /// :param transform The mapping function
    /// :return Array of elements mapped using the map function
    public class func map<T : CollectionType, E>(collection: T, transform: (T.Generator.Element) -> E) -> [E] {
        return collection.map(transform)
    }

    /// Maps each element to new value based on the map function passed
    ///
    /// :param sequence The sequence to source from
    /// :param transform The mapping function
    /// :return Array of elements mapped using the map function
    public class func map<T : SequenceType, E>(sequence: T, transform: (T.Generator.Element) -> E) -> [E] {
        return sequence.map(transform)
    }
    
    /// Retrieves the maximum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Maximum element in array.
    public class func max<T : Comparable>(array: [T]) -> T? {
        if var maxVal = array.first {
            for elem in array {
                if maxVal < elem {
                    maxVal = elem
                }
            }
            return maxVal
        }
        return .None
    }
    
    /// Get memoized function to improve performance
    ///
    /// :param function The function to memoize.
    /// :return Memoized function
    public class func memoize<T: Hashable, U>(function: ((T -> U), T) -> U) -> (T -> U) {
        var cache = [T: U]()
        var funcRef: (T -> U)!
        funcRef = { (param : T) -> U in
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
    /// :param dictionaries The dictionaries to source from.
    /// :return Merged dictionary with all of its keys and values.
    public class func merge<T, U>(dictionaries: [T: U]...) -> [T: U] {
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
    /// :param arrays The arrays to source from.
    /// :return Array with all values merged, including duplicates.
    public class func merge<T>(arrays: [T]...) -> [T] {
        var result = [T]()
        for arr in arrays {
            result += arr
        }
        return result
    }
    
    /// Retrieves the minimum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Minimum value from array.
    public class func min<T : Comparable>(array: [T]) -> T? {
        if var minVal = array.first {
            for elem in array {
                if minVal > elem {
                    minVal = elem
                }
            }
            return minVal
        }
        return .None
    }
    
    /// A no-operation function.
    ///
    /// :return nil.
    public class func noop() -> () {
    }
    
    /// Gets the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
    ///
    /// :return number of seconds as double
    public class func now() -> NSTimeInterval {
        return NSDate().timeIntervalSince1970
    }
    
    /// Creates a shallow clone of a dictionary excluding the specified keys.
    ///
    /// :param dictionary The dictionary to source from.
    /// :param keys The keys to omit from returning dictionary.
    /// :return Dictionary with the keys specified omitted.
    public class func omit<T, U>(dictionary: [T: U], keys: T...) -> [T: U] {
        var result : [T: U] = [T: U]()
        
        for (key, value) in dictionary {
            if !self.contains(keys, value: key) {
                result[key] = value
            }
        }
        return result
    }
    
    /// Get a wrapper function that executes the passed function only once
    ///
    /// :param function That takes variadic arguments and return nil or some value
    /// :return Wrapper function that executes the passed function only once
    /// Consecutive calls will return the value returned when calling the function first time
    public class func once<T, U>(function: (T...) -> U) -> (T...) -> U {
        var result: U?
        let onceFunc = { (params: T...) -> U in
            typealias Function = [T] -> U
            if let returnVal = result {
                return returnVal
            } else {
                let f = unsafeBitCast(function, Function.self)
                result = f(params)
                return result!
            }
        }
        return onceFunc
    }

    /// Get a wrapper function that executes the passed function only once
    ///
    /// :param function That takes variadic arguments and return nil or some value
    /// :return Wrapper function that executes the passed function only once
    /// Consecutive calls will return the value returned when calling the function first time
    public class func once<U>(function: () -> U) -> () -> U {
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
    /// :param function to invoke
    /// :param parameters to pass the function when invoked
    /// :return Function with partial arguments prepended
    public class func partial<T, E> (function: (T...) -> E, _ parameters: T...) -> ((T...) -> E) {
        return { (params: T...) -> E in
            typealias Function = [T] -> E
            let f = unsafeBitCast(function, Function.self)
            return f(parameters + params)
        }
    }
    
    /// Produces an array of arrays, each containing n elements, each offset by step.
    /// If the final partition is not n elements long it is dropped.
    ///
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    public class func partition<T>(array: [T], n: Int, step: Int? = .None) -> [[T]] {
        var n = n
        var step = step
        var result = [[T]]()
    
        if step == .None    { step = n } // If no step is supplied move n each step.
        if step < 1         { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1            { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        if n > array.count  { return [[]] }
        
        for i in self.range(from: 0, through: array.count - n, incrementBy: step!) {
            result.append(Array(array[i..<(i + n)] as ArraySlice<T>))
        }
        return result
    }
    
    /// Produces an array of arrays, each containing n elements, each offset by step.
    ///
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :param pad An array of elements to pad the last partition if it is not long enough to
    ///            contain n elements. If there are not enough pad elements
    ///            the last partition may less than n elements long.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    public class func partition<T>(array: [T], n: Int, step: Int? = .None, pad: [T]?) -> [[T]] {
        var array = array
        var n = n
        var step = step
        var result : [[T]] = []
        var need = 0

        if step == .None { step = n } // If no step is supplied move n each step.
        if step < 1      { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1         { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in self.range(from: 0, to: array.count, incrementBy: step!) {
            var end = i + n
            if end > array.count { end = array.count }
            result.append(Array(array[i..<end] as ArraySlice<T>))
            if end != i+n { need = i + n - end; break }
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
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    public class func partitionAll<T>(array: [T], n: Int, step: Int? = .None) -> [[T]] {
        var n = n
        var step = step
        var result = [[T]]()
        if step == .None { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in self.range(from: 0, to: array.count, incrementBy: step!) {
            var end = i + n
            if end > array.count { end = array.count }
            result.append(Array(array[i..<end] as ArraySlice<T>))
        }
        return result
    }
    
    /// Applies function to each element in array, splitting it each time function returns a new value.
    ///
    /// :param array The array to partition.
    /// :param function Function which takes an element and produces an equatable result.
    /// :return Array partitioned in order, splitting via results of function.
    public class func partitionBy<T, U: Equatable>(array: [T], function: (T) -> U) -> [[T]] {
        var result = [[T]]()
        var lastValue: U? = .None
        
        for item in array {
            let value = function(item)
            
            if let lastValue = lastValue where value == lastValue {
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
    /// :param dictionary The dictionary to source from.
    /// :param keys The keys to pick values from.
    /// :return Dictionary with the key and values picked from the keys specified.
    public class func pick<T, U>(dictionary: [T: U], keys: T...) -> [T: U] {
        var result : [T: U] = [T: U]()
        for key in keys {
            result[key] = dictionary[key]
        }
        return result
    }
    
    /// Retrieves the value of a specified property from all elements in the array.
    ///
    /// :param array The array to source from.
    /// :param value The property on object to pull out value from.
    /// :return Array of values from array of objects with property of value.
    public class func pluck<T, E>(array: [[T: E]], value: T) -> [E] {
        var result : [E] = []
        for obj in array {
            if let val = obj[value] {
                result.append(val)
            }
        }
        return result
    }
    
    /// Removes all provided values from the given array.
    ///
    /// :param array The array to source from.
    /// :return Array with values pulled out.
    public class func pull<T : Equatable>(array: [T], values: T...) -> [T] {
        return self.pull(array, values: values)
    }
    
    /// Removes all provided values from the given array.
    ///
    /// :param array The array to source from.
    /// :param values The values to remove.
    /// :return Array with values pulled out.
    public class func pull<T : Equatable>(array: [T], values: [T]) -> [T] {
        return array.filter { !self.contains(values, value: $0) }
    }

    /// Removes all provided values from the given array at the given indices
    ///
    /// :param array The array to source from.
    /// :param values The indices to remove from.
    /// :return Array with values pulled out.
    public class func pullAt<T : Equatable>(array: [T], indices: Int...) -> [T] {
        var elemToRemove = [T]()
        for index in indices {
            elemToRemove.append(array[index])
        }
        return $.pull(array, values: elemToRemove)
    }

    /// Returns random number from 0 upto but not including upperBound
    ///
    /// :return Random number
    public class func random(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param endVal End value of range.
    /// :return Array of elements based on the sequence starting from 0 to endVal and incremented by 1.
    public class func range<T : Strideable where T : IntegerLiteralConvertible>(endVal: T) -> [T] {
        return self.range(from: 0, to: endVal)
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param from Start value of range
    /// :param to End value of range
    /// :return Array of elements based on the sequence that is incremented by 1
    public class func range<T : Strideable where T.Stride : IntegerLiteralConvertible>(from startVal: T, to endVal: T) -> [T] {
        return self.range(from: startVal, to: endVal, incrementBy: 1)
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param from Start value of range.
    /// :param to End value of range.
    /// :param incrementBy Increment sequence by.
    /// :return Array of elements based on the sequence.
    public class func range<T : Strideable>(from startVal: T, to endVal: T, incrementBy: T.Stride) -> [T] {
        let range = startVal.stride(to: endVal, by: incrementBy)
        return self.sequence(range)
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param from Start value of range
    /// :param through End value of range
    /// :return Array of elements based on the sequence that is incremented by 1
    public class func range<T : Strideable where T.Stride : IntegerLiteralConvertible>(from startVal: T, through endVal: T) -> [T] {
        return self.range(from: startVal, to: endVal + 1, incrementBy: 1)
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param from Start value of range.
    /// :param through End value of range.
    /// :param incrementBy Increment sequence by.
    /// :return Array of elements based on the sequence.
    public class func range<T : Strideable>(from startVal: T, through endVal: T, incrementBy: T.Stride) -> [T] {
        return self.range(from: startVal, to: endVal + 1, incrementBy: incrementBy)
    }
    
    /// Reduce function that will resolve to one value after performing combine function on all elements
    ///
    /// :param array The array to source from.
    /// :param initial Initial value to seed the reduce function with
    /// :param combine Function that will combine the passed value with element in the array
    /// :return The result of reducing all of the elements in the array into one value
    public class func reduce<U, T>(array: [T], initial: U, combine: (U, T) -> U) -> U {
        return array.reduce(initial, combine: combine)
    }
    
    /// Creates an array of an arbitrary sequence. Especially useful with builtin ranges.
    ///
    /// :param seq The sequence to generate from.
    /// :return Array of elements generated from the sequence.
    public class func sequence<S : SequenceType>(seq: S) -> [S.Generator.Element] {
        return Array<S.Generator.Element>(seq)
    }
    
    /// Removes all elements from an array that the callback returns true.
    ///
    /// :param array The array to wrap.
    /// :param callback Remove elements for which callback returns true.
    /// :return Array with elements filtered out.
    public class func remove<T>(array: [T], callback: (T) -> Bool) -> [T] {
        return array.filter { !callback($0) }
    }
    
    /// Removes an element from an array.
    ///
    /// :param array The array to source from.
    /// :param element Element that is to be removed
    /// :return Array with element removed.
    public class func remove<T: Equatable>(array: [T], value: T) -> [T] {
        return self.remove(array, callback: {$0 == value})
    }
    
    /// The opposite of initial this method gets all but the first element or first n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to exclude from the beginning.
    /// :return The rest of the elements.
    public class func rest<T>(array: [T], numElements: Int = 1) -> [T] {
        var result : [T] = []
        if (numElements < array.count && numElements >= 0) {
            for index in numElements..<array.count {
                result.append(array[index])
            }
        }
        return result
    }
    
    /// Returns a sample from the array.
    ///
    /// :param array The array to sample from.
    /// :return Random element from array.
    public class func sample<T>(array: [T]) -> T {
        return array[self.random(array.count)]
    }
    
    /// Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.
    ///
    /// :param array The array to slice.
    /// :param start Start index.
    /// :param end End index.
    /// :return First element from the array.
    public class func slice<T>(array: [T], start: Int, end: Int = 0) -> [T] {
        var uend = end;
        if (uend == 0) {
            uend = array.count;
        }
        
        if end > array.count || start > array.count || uend < start {
            return [];
        } else {
            return Array(array[start..<uend]);
        }
    }
    
    /// Gives the smallest index at which a value should be inserted into a given the array is sorted.
    ///
    /// :param array The array to source from.
    /// :param value Find sorted index of this value.
    /// :return Index of where the elemnt should be inserted.
    public class func sortedIndex<T : Comparable>(array: [T], value: T) -> Int {
        for (index, elem) in array.enumerate() {
            if elem > value {
                return index
            }
        }
        return array.count
    }
    
    /// Invokes interceptor with the object and then returns object.
    ///
    /// :param object Object to tap into.
    /// :param function Callback function to invoke.
    /// :return Returns the object back.
    public class func tap<T>(object: T, function: (T) -> ()) -> T {
        function(object)
        return object
    }
    
    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// :param n Number of times to call function.
    /// :param function The function to be called every time.
    /// :return Values returned from callback function.
    public class func times<T>(n: Int, function: () -> T) -> [T] {
        return self.times(n) { (index: Int) -> T in
            return function()
        }
    }
    
    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// :param n Number of times to call function.
    /// :param function The function to be called every time.
    public class func times(n: Int, function: () -> ()) {
        self.times(n) { (index: Int) -> () in
            function()
        }
    }
    
    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// :param n Number of times to call function.
    /// :param function The function to be called every time that takes index.
    /// :return Values returned from callback function.
    public class func times<T>(n: Int, function: (Int) -> T) -> [T] {
        var result : [T] = []
        for index in (0..<n) {
            result.append(function(index))
        }
        return result
    }
    
    /// Creates an array of unique values, in order, of the provided arrays.
    ///
    /// :param arrays The arrays to perform union on.
    /// :return Resulting array after union.
    public class func union<T : Hashable>(arrays: [T]...) -> [T] {
        var result : [T] = []
        for arr in arrays {
            result += arr
        }
        return self.uniq(result)
    }
    
    /// Creates a duplicate-value-free version of an array.
    ///
    /// :param array The array to source from.
    /// :return An array with unique values.
    public class func uniq<T : Hashable>(array: [T]) -> [T] {
        var result: [T] = []
        var map: [T: Bool] = [T: Bool]()
        for elem in array {
            if map[elem] == .None {
                result.append(elem)
            }
            map[elem] = true
        }
        return result
    }
    
    /// Create a duplicate-value-free version of an array based on the condition. 
    /// Uses the last value generated by the condition function
    ///
    /// :param array The array to source from.
    /// :param condition Called per iteration
    /// :return An array with unique values.
    public class func uniq<T: Hashable, U: Hashable>(array: [T], by condition: (T) -> U) -> [T] {
        var result: [T] = []
        var map : [U: Bool] = [U: Bool]()
        for elem in array {
            let val = condition(elem)
            if map[val] == .None {
                result.append(elem)
            }
            map[val] = true
        }
        return result
    }
    
    /// Creates an array of values of a given dictionary.
    ///
    /// :param dictionary The dictionary to source from.
    /// :return An array of values from the dictionary.
    public class func values<T, U>(dictionary: [T: U]) -> [U] {
        var result : [U] = []
        for value in dictionary.values {
            result.append(value)
        }
        return result
    }
    
    /// Creates an array excluding all provided values.
    ///
    /// :param array The array to source from.
    /// :param values Values to exclude.
    /// :return Array excluding provided values.
    public class func without<T : Equatable>(array: [T], values: T...) -> [T] {
        return self.pull(array, values: values)
    }
    
    /// Creates an array that is the symmetric difference of the provided arrays.
    ///
    /// :param arrays The arrays to perform xor on in order.
    /// :return Resulting array after performing xor.
    public class func xor<T : Hashable>(arrays: [T]...) -> [T] {
        var map : [T: Bool] = [T: Bool]()
        for arr in arrays {
            for elem in arr {
                map[elem] = !(map[elem] ?? false)
            }
        }
        var result : [T] = []
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
    /// :param arrays The arrays to be grouped.
    /// :return An array of grouped elements.
    public class func zip<T>(arrays: [T]...) -> [[T]] {
        var result: [[T]] = []
        for _ in self.first(arrays)! as [T] {
            result.append([] as [T])
        }
        for (_, array) in arrays.enumerate() {
            for (elemIndex, elem): (Int, T) in array.enumerate() {
                result[elemIndex].append(elem)
            }
        }
        return result
    }
    
    /// Creates an object composed from arrays of keys and values.
    ///
    /// :param keys The array of keys.
    /// :param values The array of values.
    /// :return Dictionary based on the keys and values passed in order.
    public class func zipObject<T, E>(keys: [T], values: [E]) -> [T: E] {
        var result = [T: E]()
        for (index, key) in keys.enumerate() {
            result[key] = values[index]
        }
        return result
    }

    /// Returns the collection wrapped in the chain object
    ///
    /// :param collection of elements
    /// :return Chain object
    public class func chain<T>(collection: [T]) -> Chain<T> {
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
public class Chain<C> {

    private var result: Wrapper<[C]>
    private var funcQueue: [Wrapper<[C]> -> Wrapper<[C]>] = []
    public var value: [C] {
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
    /// :param array The array to wrap.
    public init(_ collection: [C]) {
        self.result = Wrapper(collection)
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :return First element from the array.
    public func first() -> C? {
        return $.first(self.value)
    }
    
    /// Get the second object in the wrapper object.
    ///
    /// :return Second element from the array.
    public func second() -> C? {
        return $.second(self.value)
    }
    
    /// Get the third object in the wrapper object.
    ///
    /// :return Third element from the array.
    public func third() -> C? {
        return $.third(self.value)
    }
    
    /// Flattens nested array.
    ///
    /// :return The wrapper object.
    public func flatten() -> Chain {
        return self.queue {
            return Wrapper($.flatten($0.value))
        }
    }
    
    /// Keeps all the elements except last one.
    ///
    /// :return The wrapper object.
    public func initial() -> Chain {
        return self.initial(1)
    }
    
    /// Keeps all the elements except last n elements.
    ///
    /// :param numElements Number of items to remove from the end of the array.
    /// :return The wrapper object.
    public func initial(numElements: Int) -> Chain {
        return self.queue {
            return Wrapper($.initial($0.value, numElements: numElements))
        }
    }
    
    /// Maps elements to new elements.
    ///
    /// :param function Function to map.
    /// :return The wrapper object.
    public func map(function: C -> C) -> Chain {
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
    /// :param array The array to wrap.
    /// :return The wrapper object.
    public func map(function: (Int, C) -> C) -> Chain {
        return self.queue {
            var result: [C] = []
            for (index, elem) in $0.value.enumerate() {
                result.append(function(index, elem))
            }
            return Wrapper(result)
        }
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    public func each(function: (C) -> ()) -> Chain {
        return self.queue {
            for elem in $0.value {
                function(elem)
            }
            return $0
        }
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    public func each(function: (Int, C) -> ()) -> Chain {
        return self.queue {
            for (index, elem) in $0.value.enumerate() {
                function(index, elem)
            }
            return $0
        }
    }
    
    /// Filter elements based on the function passed.
    ///
    /// :param function Function to tell whether to keep an element or remove.
    /// :return The wrapper object.
    public func filter(function: (C) -> Bool) -> Chain {
        return self.queue {
            return Wrapper(($0.value).filter(function))
        }
    }
    
    /// Returns if all elements in array are true based on the passed function.
    ///
    /// :param function Function to tell whether element value is true or false.
    /// :return Whether all elements are true according to func function.
    public func all(function: (C) -> Bool) -> Bool {
        return $.every(self.value, callback: function)
    }
    
    /// Returns if any element in array is true based on the passed function.
    ///
    /// :param function Function to tell whether element value is true or false.
    /// :return Whether any one element is true according to func function in the array.
    public func any(function: (C) -> Bool) -> Bool {
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
    /// :return The wrapper object.
    public func size() -> Int {
        return self.value.count
    }
    
    /// Slice the array into smaller size based on start and end value.
    ///
    /// :param start Start index to start slicing from.
    /// :param end End index to stop slicing to and not including element at that index.
    /// :return The wrapper object.
    public func slice(start: Int, end: Int = 0) -> Chain {
        return self.queue {
            return Wrapper($.slice($0.value, start: start, end: end))
        }
    }
    
    private func queue(function: Wrapper<[C]> -> Wrapper<[C]>) -> Chain {
        funcQueue.append(function)
        return self
    }
}

private struct Wrapper<V> {
    let value: V
    init(_ value: V) {
        self.value = value
    }
}
