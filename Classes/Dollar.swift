//
//  $.swift
//  Dollar
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

struct $ {
    
    //$.first([0, 1, false, 2, '', 3]);
    //Gets the first element or first n elements of an array.
    static func first(collection: AnyObject[]) -> AnyObject {
        if collection.isEmpty {
            return NSNull()
        } else {
            return collection[0];
        }
    }
    
    //$.compact([0, 1, false, 2, '', 3])
    //Remove all falsey values
    static func compact(array: AnyObject?[]) -> AnyObject[] {
        var result: AnyObject[] = []
        for elem: AnyObject? in array {
            if let val: AnyObject = elem {
                result += val
            }
        }
        return result
    }

    //$.flatten([[2],3,4])
    //flatten array
    static func flatten(array: AnyObject[]) -> AnyObject[] {
        var resultArr: AnyObject[] = []
        for elem : AnyObject in array {
            if let val = elem as? AnyObject[] {
                resultArr += self.flatten(val)
            } else {
                resultArr += elem
            }
        }
        return resultArr
    }
    
    //$.indexOf([2, 3, 4, 5], 3)
    //Return index of the value
    static func indexOf<T: Equatable>(array: T[], value: T) -> Int? {
        for (index, elem) in enumerate(array) {
            if elem == value {
                return index
            }
        }
        return nil
    }

    //$.initial([2, 3, 4, 5])
    //Returns all except for last element
    static func initial(array: AnyObject[]) -> AnyObject[] {
        return self.initial(array, numElements: 1)
    }
    
    //$.initial([2, 3, 4, 5], 2)
    //Returns all except for last 2
    static func initial(array: AnyObject[], numElements: Int) -> AnyObject[] {
        var result: AnyObject[] = []
        for (index, _) in enumerate((0..array.count - numElements)) {
            result += array[index]
        }
        return result
    }
    
    //$.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1])
    //Will return intersection of all arrays
    static func intersection(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO Implement
    }
    
    //$.last([1, 2, 3])
    //Will return last element in the array
    static func last(array: AnyObject[]) -> AnyObject {
        return array[array.count - 1]
    }
    
    //$.difference([1, 2, 3], [2], [3])
    //returns [1]
    //Returns first array passed subtracted by remaining arrays
    static func difference(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.rest([2, 3, 4])
    //returns [3, 4]
    //Returns last n - 1 elements in array
    static func rest(array: AnyObject[]) -> AnyObject[] {
        return self.rest(array, numElements: 1)
    }
    
    //$.rest([2, 3, 4], 2)
    //returns [4]
    //Returns last n - numElements elements in array
    static func rest(array: AnyObject[], numElements: Int) -> AnyObject[] {
        var result: AnyObject[] = []
        for (index, _) in enumerate((numElements..array.count)) {
            result += array[index + numElements]
        }
        return result
    }
    
    //$.findIndex([2, 3, 3]) { return $0 == 3 }
    //returns 1
    //Returns index of element
    static func findIndex(array: AnyObject[], iterator: (AnyObject) -> Bool) -> Int {
        return 0 //@TODO implement
    }
    
    //$.findLastIndex([2, 3, 3]) { return $0 == 3 }
    //returns 2
    //Returns last index of element
    static func findLastIndex(array: AnyObject[], iterator: (AnyObject) -> Bool) -> Int {
        return 0 //@TODO implement
    }
    
    //$.lastIndexOf([2, 3, 4], 3)
    //returns 1
    static func lastIndexOf(array: AnyObject[], value: AnyObject) -> Int {
        return 0 //@TODO implement
    }
    
    //$.pull()
    static func pull(array: AnyObject[], values: AnyObject...) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.range()
    static func range(endVal: Int) -> Int[] {
        return self.range(0, endVal: endVal)
    }

    //$.range()
    static func range(startVal: Int, endVal: Int) -> Int[] {
        return self.range(startVal, endVal: endVal, incrementBy: 1)
    }

    //$.range()
    static func range(startVal: Int, endVal: Int, incrementBy: Int) -> Int[] {
        return [] //@TODO implement
    }
    
    //$.remove()
    static func remove(array: AnyObject, iterator: (AnyObject) -> Bool) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.sortedIndex()
    static func sortedIndex(array: AnyObject, value: AnyObject) -> Int {
        return 0 //@TODO implement
    }

    //$.union()
    static func union(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }

    //$.uniq()
    static func uniq(array: AnyObject[]) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.without()
    static func without(array: AnyObject[], values: Int...) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.xor()
    static func xor(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.zip()
    static func zip(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }

    //$.zipObject()
    static func zipObject<T, E>(keys: T[], values: E[]) -> Dictionary<T, E> {
        return Dictionary<T, E>() //@TODO implement
    }
    
    //$.noop()
    //A no-operation function.
    static func noop() -> AnyObject {
        return NSNull();
    }
}