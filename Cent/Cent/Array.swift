//
//  Array.swift
//  Cent
//
//  Created by Ankur Patel on 6/28/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

internal extension Array {

    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// :param array The array to source from
    /// :param indexes Get elements from these indexes
    /// :return New array with elements from the indexes specified.
    func at(indexes: Int...) -> [Element] {
        return $.at(self, indexes: indexes)
    }

    /// Cycles through the array n times passing each element into the callback function
    ///
    /// :param times Number of times to cycle through the array
    /// :param callback function to call with the element
    func cycle<U>(times: Int, callback: (Element) -> U) {
        $.cycle(self, times, callback: callback)
    }

    /// Cycles through the array indefinetly passing each element into the callback function
    ///
    /// :param callback function to call with the element
    func cycle<U>(callback: (Element) -> U) {
        $.cycle(self, callback: callback)
    }

    /// For each item in the array invoke the callback by passing the elem
    ///
    /// :param callback The callback function to invoke that take an element
    func eachWithIndex(callback: (Int, Element) -> ()) -> [Element] {
        for (index, elem) in enumerate(self) {
            callback(index, elem)
        }
        return self
    }
    
    /// For each item in the array invoke the callback by passing the elem along with the index
    ///
    /// :param callback The callback function to invoke
    func each(callback: (Element) -> ()) -> [Element] {
        self.eachWithIndex { (index, elem) -> () in
            callback(elem)
        }
        return self
    }
    
    /// Checks if the given callback returns true value for all items in the array.
    ///
    /// :param array The array to check.
    /// :param callback Check whether element value is true or false.
    /// :return First element from the array.
    func every(callback: (Element) -> Bool) -> Bool {
        return $.every(self, callback: callback)
    }

    /// Get element from an array at the given index which can be negative
    /// to find elements from the end of the array
    ///
    /// :param index Can be positive or negative to find from end of the array
    /// :param orElse Default value to use if index is out of bounds
    /// :return Element fetched from the array or the default value passed in orElse
    func fetch(index: Int, orElse: Element? = .None) -> Element! {
        return $.fetch(self, index, orElse: orElse)
    }
    
    /// This method is like find except that it returns the index of the first element
    /// that passes the callback check.
    ///
    /// :param array The array to search for the element in.
    /// :param callback Function used to figure out whether element is the same.
    /// :return First element's index from the array found using the callback.
    func findIndex(callback: (Element) -> Bool) -> Int? {
        return $.findIndex(self, callback: callback)
    }
    
    /// This method is like findIndex except that it iterates over elements of the array
    /// from right to left.
    ///
    /// :param array The array to search for the element in.
    /// :param callback Function used to figure out whether element is the same.
    /// :return Last element's index from the array found using the callback.
    func findLastIndex(callback: (Element) -> Bool) -> Int? {
        return $.findLastIndex(self, callback: callback)
    }

    /// Gets the first element in the array.
    ///
    /// :param array The array to wrap.
    /// :return First element from the array.
    func first() -> Element? {
        return $.first(self)
    }
    
    /// Flattens the array
    ///
    /// :return Flatten array of elements
    func flatten() -> [Element] {
        return $.flatten(self)
    }
    
    /// Get element at index
    ///
    /// :param index The index in the array
    /// :return Element at that index
    func get(index: Int) -> Element! {
        return self.fetch(index)
    }
    
    /// Gets all but the last element or last n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to ignore in the end.
    /// :return Array of initial values.
    func initial(numElements: Int? = 1) -> [Element] {
        return $.initial(self, numElements: numElements!)
    }
    
    /// Gets the last element from the array.
    ///
    /// :param array The array to source from.
    /// :return Last element from the array.
    func last() -> Element? {
        return $.last(self)
    }
    
    /// The opposite of initial this method gets all but the first element or first n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to exclude from the beginning.
    /// :return The rest of the elements.
    func rest(numElements: Int? = 1) -> [Element] {
        return $.rest(self, numElements: numElements!)
    }
    
    /// Retrieves the minimum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Minimum value from array.
    func min<T: Comparable>() -> T? {
        return $.min(map { $0 as! T })
    }
    
    /// Retrieves the maximum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Maximum element in array.
    func max<T: Comparable>() -> T? {
        return $.max(map { $0 as! T })
    }
}

/// Overloaded operator to appends another array to an array
///
/// :return array with the element appended in the end
public func <<<T>(inout left: [T], right: [T]) -> [T] {
    left += right
    return left
}

/// Overloaded operator to append element to an array
///
/// :return array with the element appended in the end
public func <<<T>(inout array: [T], elem: T) -> [T] {
    array.append(elem)
    return array
}

