//
//  Array.swift
//  Cent
//
//  Created by Ankur Patel on 6/28/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Array {

    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// :param array The array to source from
    /// :param indexes Get elements from these indexes
    /// :return New array with elements from the indexes specified.
    func at(indexes: Int...) -> Element[] {
        return $.at(self, indexes: indexes)
    }

    /// Checks if the given callback returns true value for all items in the array.
    ///
    /// :param array The array to check.
    /// :param iterator Check whether element value is true or false.
    /// :return First element from the array.
    func every(iterator: (Element) -> Bool) -> Bool {
        return $.every(self, iterator: iterator)
    }
    
    /// This method is like find except that it returns the index of the first element
    /// that passes the callback check.
    ///
    /// :param array The array to search for the element in.
    /// :param iterator Function used to figure out whether element is the same.
    /// :return First element's index from the array found using the iterator.
    func findIndex(iterator: (Element) -> Bool) -> Int? {
        return $.findIndex(self, iterator: iterator)
    }
    
    /// This method is like findIndex except that it iterates over elements of the array
    /// from right to left.
    ///
    /// :param array The array to search for the element in.
    /// :param iterator Function used to figure out whether element is the same.
    /// :return Last element's index from the array found using the iterator.
    func findLastIndex(iterator: (Element) -> Bool) -> Int? {
        return $.findLastIndex(self, iterator: iterator)
    }

    /// Gets the first element in the array.
    ///
    /// :param array The array to wrap.
    /// :return First element from the array.
    func first() -> Element? {
        return $.first(self)
    }
    
    /// Flattens a nested array of any depth.
    ///
    /// :param array The array to flatten.
    /// :return Flattened array.
    func flatten() -> Element[] {
        return $.flatten(self)
    }
    
    /// Get element at index
    ///
    /// :param index The index in the array
    /// :return Element at that index
    func get(index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
    
    /// Gets all but the last element or last n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to ignore in the end.
    /// :return Array of initial values.
    func initial(numElements: Int? = 1) -> Element[] {
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
    func rest(numElements: Int? = 1) -> Element[] {
        return $.rest(self, numElements: numElements!)
    }
    
    /// Retrieves the minimum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Minimum value from array.
    func min<T: Comparable>() -> T? {
        return $.min(map { $0 as T })
    }
    
    /// Retrieves the maximum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Maximum element in array.
    func max<T: Comparable>() -> T? {
        return $.max(map { $0 as T })
    }
        
}