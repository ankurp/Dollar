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
//  $.swift
//  $ - A functional tool-belt for Swift Language
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

public class Dollar {
    
    //  ________  ___  ___  ________  ___  ________
    // |\   ____\|\  \|\  \|\   __  \|\  \|\   ___  \
    // \ \  \___|\ \  \\\  \ \  \|\  \ \  \ \  \\ \  \
    //  \ \  \    \ \   __  \ \   __  \ \  \ \  \\ \  \
    //   \ \  \____\ \  \ \  \ \  \ \  \ \  \ \  \\ \  \
    //    \ \_______\ \__\ \__\ \__\ \__\ \__\ \__\\ \__\
    //     \|_______|\|__|\|__|\|__|\|__|\|__|\|__| \|__|
    //
    
    private var resultArray: [AnyObject] = []

    private var lazyQueue: [(AnyObject) -> (AnyObject?)] = []
    
    /// Initializer of the wrapper object for chaining.
    ///
    /// :param array The array to wrap.
    public init(array: [AnyObject]) {
        self.resultArray = array
    }
    
    private func queue(function: (AnyObject) -> (AnyObject?)) -> Dollar {
        lazyQueue.append(function)
        return self
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :return First element from the array.
    public func first() -> Dollar {
        return self.queue {
            Dollar.first($0 as Array)
        }
    }
    
    /// Get the second object in the wrapper object.
    ///
    /// :return Second element from the array.
    public func second() -> Dollar {
        return self.queue {
            Dollar.second($0 as Array)
        }
    }
    
    /// Get the third object in the wrapper object.
    ///
    /// :return Third element from the array.
    public func third() -> Dollar {
        return self.queue {
            Dollar.third($0 as Array)
        }
    }
    
    /// Get the fourth object in the wrapper object.
    ///
    /// :return Fourth element from the array.
    public func fourth() -> Dollar {
        return self.queue {
            Dollar.fourth($0 as Array)
        }
    }
    
    /// Get the fifth object in the wrapper object.
    ///
    /// :return Fifth element from the array.
    public func fifth() -> Dollar {
        return self.queue {
            Dollar.fifth($0 as Array)
        }
    }
    
    /// Get the sixth object in the wrapper object.
    ///
    /// :return Sixth element from the array.
    public func sixth() -> Dollar {
        return self.queue {
            Dollar.sixth($0 as Array)
        }
    }
    
    /// Get the seventh object in the wrapper object.
    ///
    /// :return Seventh element from the array.
    public func seventh() -> Dollar {
        return self.queue {
            Dollar.seventh($0 as Array)
        }
    }
    
    /// Get the eighth object in the wrapper object.
    ///
    /// :return Eighth element from the array.
    public func eighth() -> Dollar {
        return self.queue {
            Dollar.eighth($0 as Array)
        }
    }
    
    /// Get the ninth object in the wrapper object.
    ///
    /// :return Ninth element from the array.
    public func ninth() -> Dollar {
        return self.queue {
            Dollar.ninth($0 as Array)
        }
    }
    
    /// Get the tenth object in the wrapper object.
    ///
    /// :return Tenth element from the array.
    public func tenth() -> Dollar {
        return self.queue {
            Dollar.tenth($0 as Array)
        }
    }
    
    /// Another comment
    /// Flattens nested array.
    ///
    /// :return The wrapper object.
    public func flatten() -> Dollar {
        return self.queue {
            return Dollar.flatten($0 as [AnyObject])
        }
    }
    
    /// Keeps all the elements except last one.
    ///
    /// :return The wrapper object.
    public func initial() -> Dollar {
        return self.initial(1)
    }
    
    /// Keeps all the elements except last n elements.
    ///
    /// :param numElements Number of items to remove from the end of the array.
    /// :return The wrapper object.
    public func initial(numElements: Int) -> Dollar {
        return self.queue {
            return Dollar.initial($0 as [AnyObject], numElements: numElements)
        }
    }
    
    /// Maps elements to new elements.
    ///
    /// :param function Function to map.
    /// :return The wrapper object.
    public func map(function: (AnyObject) -> AnyObject) -> Dollar {
        return self.queue {
            var result: [AnyObject] = []
            for elem : AnyObject in $0 as [AnyObject] {
                result.append(function(elem))
            }
            return result
        }
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    public func map(function: (Int, AnyObject) -> AnyObject) -> Dollar {
        return self.queue {
            var result: [AnyObject] = []
            for (index, elem : AnyObject) in enumerate($0 as [AnyObject]) {
                result.append(function(index, elem))
            }
            return result
        }
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    public func each(function: (AnyObject) -> ()) -> Dollar {
        return self.queue {
            for elem : AnyObject in $0 as [AnyObject] {
                function(elem)
            }
            return $0
        }
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    public func each(function: (Int, AnyObject) -> ()) -> Dollar {
        return self.queue {
            for (index, elem : AnyObject) in enumerate($0 as [AnyObject]) {
                function(index, elem)
            }
            return $0
        }
    }
    
    /// Filter elements based on the function passed.
    ///
    /// :param function Function to tell whether to keep an element or remove.
    /// :return The wrapper object.
    public func filter(function: (AnyObject) -> Bool) -> Dollar {
        return self.queue {
            return ($0 as [AnyObject]).filter(function)
        }
    }
    
    /// Returns if all elements in array are true based on the passed function.
    ///
    /// :param function Function to tell whether element value is true or false.
    /// :return Whether all elements are true according to func function.
    public func all(function: (AnyObject) -> Bool) -> Dollar {
        return self.queue {
            return Dollar.every($0 as Array, iterator: function)
        }
    }
    
    /// Returns if any element in array is true based on the passed function.
    ///
    /// :param function Function to tell whether element value is true or false.
    /// :return Whether any one element is true according to func function in the array.
    public func any(function: (AnyObject) -> Bool) -> Dollar {
        return self.queue {
            for elem : AnyObject in $0 as [AnyObject] {
                if function(elem) {
                    return true
                }
            }
            return false
        }
    }
    
    /// Slice the array into smaller size based on start and end value.
    ///
    /// :param start Start index to start slicing from.
    /// :param end End index to stop slicing to and not including element at that index.
    /// :return The wrapper object.
    public func slice(start: Int, end: Int = 0) -> Dollar {
        return self.queue {
            return Dollar.slice($0 as [AnyObject], start: start, end: end);
        }
    }
    
    /// Get the final result from the wrapper object to terminated the chain.
    ///
    /// :return Final resulting array from applying all functions on it.
    public func value() -> AnyObject? {
        var result : AnyObject? = self.resultArray
        for step in self.lazyQueue {
            result = step(result!)
        }
        if let val: AnyObject = result {
            return val
        } else {
            return self.resultArray
        }
    }
    
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
            if --counter <= 0 {
                let f = unsafeBitCast(function, Function.self)
                return f(params)
            }
            return nil
        }
    }
    
    /// Creates a function that executes passed function only after being called n times.
    ///
    /// :param n Number of times after which to call function.
    /// :param function Function to be called that does not take any params.
    /// :return Function that can be called n times after which the callback function is called.
    public class func after<T>(n: Int, function: () -> T) -> (() -> T?) {
        let f = self.after(n) { (params: Any?...) -> T? in
            return function()
        }
        return { f()? }
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
    
    /// Checks if a given value is present in the array.
    ///
    /// :param array The array to check against.
    /// :param value The value to check.
    /// :return Whether value is in the array.
    public class func contains<T : Equatable>(array: [T], value: T) -> Bool {
        return Swift.contains(array, value)
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
        
    /// Creates an array excluding all values of the provided arrays.
    ///
    /// :param arrays The arrays to difference between.
    /// :return The difference between the first array and all the remaining arrays from the arrays params.
    public class func difference<T : Hashable>(arrays: [T]...) -> [T] {
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
    
    /// Checks if the given callback returns true value for all items in the array.
    ///
    /// :param array The array to check.
    /// :param iterator Check whether element value is true or false.
    /// :return First element from the array.
    public class func every<T>(array: [T], iterator: (T) -> Bool) -> Bool {
        for elem in array {
            if !iterator(elem) {
                return false
            }
        }
        return true
    }
    
    /// Iterates over elements of an array and returning the first element
    /// that the callback returns true for.
    ///
    /// :param array The array to search for the element in.
    /// :param iterator The iterator function to tell whether element is found.
    /// :return Optional containing either found element or nil.
    public class func find<T>(array: [T], iterator: (T) -> Bool) -> T? {
        for elem in array {
            let result = iterator(elem)
            if result {
                return elem
            }
        }
        return nil
    }
    
    /// This method is like find except that it returns the index of the first element
    /// that passes the callback check.
    ///
    /// :param array The array to search for the element in.
    /// :param iterator Function used to figure out whether element is the same.
    /// :return First element's index from the array found using the iterator.
    public class func findIndex<T>(array: [T], iterator: (T) -> Bool) -> Int? {
        for (index, elem : T) in enumerate(array) {
            if iterator(elem) {
                return index
            }
        }
        return nil
    }
    
    /// This method is like findIndex except that it iterates over elements of the array
    /// from right to left.
    ///
    /// :param array The array to search for the element in.
    /// :param iterator Function used to figure out whether element is the same.
    /// :return Last element's index from the array found using the iterator.
    public class func findLastIndex<T>(array: [T], iterator: (T) -> Bool) -> Int? {
        let count = array.count
        for (index, _) in enumerate(array) {
            let reverseIndex = count - (index + 1)
            let elem : T = array[reverseIndex]
            if iterator(elem) {
                return reverseIndex
            }
        }
        return nil
    }
    
    /// Gets the first element in the array.
    ///
    /// :param array The array to wrap.
    /// :return First element from the array.
    public class func first<T>(array: [T]) -> T? {
        if array.isEmpty {
            return nil
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
            return nil
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
            return nil
        } else {
            return array[2]
        }
    }
    
    /// Gets the fourth element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Fourth element from the array.
    public class func fourth<T>(array: [T]) -> T? {
        if array.count < 4 {
            return nil
        } else {
            return array[3]
        }
    }
    
    /// Gets the fifth element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Fifth element from the array.
    public class func fifth<T>(array: [T]) -> T? {
        if array.count < 5 {
            return nil
        } else {
            return array[4]
        }
    }
    
    /// Gets the sixth element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Sixth element from the array.
    public class func sixth<T>(array: [T]) -> T? {
        if array.count < 6 {
            return nil
        } else {
            return array[5]
        }
    }
    
    /// Gets the seventh element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Seventh element from the array.
    public class func seventh<T>(array: [T]) -> T? {
        if array.count < 7 {
            return nil
        } else {
            return array[6]
        }
    }
    
    /// Gets the eighth element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Eighth element from the array.
    public class func eighth<T>(array: [T]) -> T? {
        if array.count < 8 {
            return nil
        } else {
            return array[7]
        }
    }
    
    /// Gets the ninth element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Ninth element from the array.
    public class func ninth<T>(array: [T]) -> T? {
        if array.count < 9 {
            return nil
        } else {
            return array[8]
        }
    }
    
    /// Gets the tenth element in the array.
    ///
    /// :param array The array to wrap.
    /// :return Tenth element from the array.
    public class func tenth<T>(array: [T]) -> T? {
        if array.count < 10 {
            return nil
        } else {
            return array[9]
        }
    }
    
    /// Flattens a nested array of any depth.
    ///
    /// :param array The array to flatten.
    /// :return Flattened array.
    public class func flatten(array: [AnyObject]) -> [AnyObject] {
        var resultArr: [AnyObject] = []
        for elem : AnyObject in array {
            if let val = elem as? [AnyObject] {
                resultArr += self.flatten(val)
            } else {
                resultArr.append(elem)
            }
        }
        return resultArr
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
            var randIndex = Int(arc4random_uniform(UInt32(index)))
            
            // We use in-out parameters to swap the internals of the array
            Swift.swap(&newArr[index], &newArr[randIndex])
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
        if (array.count > numElements) {
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
    
    /// Joins the elements in the array to create a concatenated element of the same type.
    ///
    /// :param array The array to join the elements of.
    /// :param separator The separator to join the elements with.
    /// :return Joined element from the array of elements.
    public class func join<T: ExtensibleCollectionType>(array: [T], separator: T) -> T {
        return Swift.join(separator, array)
    }
    
    /// Creates an array of keys given a dictionary.
    ///
    /// :param dictionary The dictionary to source from.
    /// :return Array of keys from dictionary.
    public class func keys<T, U>(dictionary: [T: U]) -> [T] {
        var result : [T] = []
        for (key, _) in dictionary {
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
            return nil
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
    /// :param array The array to source from.
    /// :param transform The mapping function
    /// :return Array of elements mapped using the map function
    public class func map<T, E>(array: [T], transform: (T) -> E) -> [E] {
        return array.map(transform)
    }
    
    /// Retrieves the maximum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Maximum element in array.
    public class func max<T : Comparable>(array: [T]) -> T? {
        var maxVal = array[0]
        for elem in array {
            if maxVal < elem {
                maxVal = elem
            }
        }
        return maxVal
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
    public class func merge<T, U>(#dictionaries: [T: U]...) -> [T: U] {
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
    public class func merge<T>(#arrays: [T]...) -> [T] {
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
        var minVal = array[0]
        for elem in array {
            if minVal > elem {
                minVal = elem
            }
        }
        return minVal
    }
    
    /// A no-operation function.
    ///
    /// :return nil.
    public class func noop() -> AnyObject? {
        return nil
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
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return First element from the array.
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
    public class func partition<T>(array: [T], var n: Int, var step: Int? = .None) -> [[T]] {
        var result = [[T]]()
        if step == .None    { step = n } // If no step is supplied move n each step.
        if step < 1         { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1            { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        if n > array.count  { return [[]] }
        
        for i in self.range(from: 0, through: array.count - n, incrementBy: step!) {
            result.append(Array(array[i..<(i+n)] as Slice<T>))
        }
        return result
    }
    
    /// Produces an array of arrays, each containing n elements, each offset by step.
    ///
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :param pad An array of elements to pad the last partition if it is not long enough to
    ///            contain n elements. If nil is passed or there are not enough pad elements
    ///            the last partition may less than n elements long.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    public class func partition<T>(var array: [T], var n: Int, var step: Int? = .None, pad: [T]?) -> [[T]] {
        var result : [[T]] = []
        if step? == .None   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in self.range(from: 0, to: array.count, incrementBy: step!) {
            var end = i + n
            if end > array.count { end = array.count }
            result.append(Array(array[i..<end] as Slice<T>))
            if end != i+n { break }
        }
        
        if let padding = pad {
            let remain = array.count % n
            let end = padding.count > remain ? remain : padding.count
            result[result.count - 1] += Array(padding[0..<end] as Slice<T>)
        }
        return result
    }
    
    /// Produces an array of arrays, each containing n elements, each offset by step.
    ///
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    public class func partitionAll<T>(array: [T], var n: Int, var step: Int? = .None) -> [[T]] {
        var result = [[T]]()
        if step? == .None { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in self.range(from: 0, to: array.count, incrementBy: step!) {
            var end = i + n
            if end > array.count { end = array.count }
            result.append(Array(array[i..<end] as Slice<T>))
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
            
            if value == lastValue? {
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
        var range = Swift.stride(from: startVal, to: endVal, by: incrementBy)
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
    /// :param iterator Remove elements for which iterator returns true.
    /// :return Array with elements filtered out.
    public class func remove<T>(array: [T], iterator: (T) -> Bool) -> [T] {
        return array.filter { !iterator($0) }
    }
    
    /// The opposite of initial this method gets all but the first element or first n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to exclude from the beginning.
    /// :return The rest of the elements.
    public class func rest<T>(array: [T], numElements: Int = 1) -> [T] {
        var result : [T] = []
        if (numElements < array.count) {
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
        return array[random() % array.count]
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
        for (index, elem) in enumerate(array) {
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
        var map : [T: Bool] = [T: Bool]()
        for arr in arrays {
            for elem in arr {
                map[elem] = true
            }
        }
        var result : [T] = []
        for key in map.keys {
            result.append(key)
        }
        return result
    }
    
    /// Creates a duplicate-value-free version of an array.
    ///
    /// :param array The array to source from.
    /// :return An array with unique values.
    public class func uniq<T : Hashable>(array: [T]) -> [T] {
        var map : [T: Bool] = [T: Bool]()
        for elem in array {
            map[elem] = true
        }
        var result : [T] = []
        for key in map.keys {
            result.append(key)
        }
        return result
    }
    
    /// Creates an array of values of a given dictionary.
    ///
    /// :param dictionary The dictionary to source from.
    /// :return An array of values from the dictionary.
    public class func values<T, U>(dictionary: [T: U]) -> [U] {
        var result : [U] = []
        for (_, value) in dictionary {
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
    public class func zip(arrays: [AnyObject]...) -> [AnyObject] {
        var result: [[AnyObject]] = []
        for _ in self.first(arrays)! as [AnyObject] {
            result.append([] as [AnyObject])
        }
        for (index, array) in enumerate(arrays) {
            for (elemIndex, elem : AnyObject) in enumerate(array) {
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
        for (index, key) in enumerate(keys) {
            result[key] = values[index]
        }
        return result
    }
}

public typealias $ = Dollar


