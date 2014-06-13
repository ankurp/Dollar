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
//  Dollar - A functional tool-belt for Swift Language
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

class $ {
    
    //  ________  ___  ___  ________  ___  ________
    // |\   ____\|\  \|\  \|\   __  \|\  \|\   ___  \
    // \ \  \___|\ \  \\\  \ \  \|\  \ \  \ \  \\ \  \
    //  \ \  \    \ \   __  \ \   __  \ \  \ \  \\ \  \
    //   \ \  \____\ \  \ \  \ \  \ \  \ \  \ \  \\ \  \
    //    \ \_______\ \__\ \__\ \__\ \__\ \__\ \__\\ \__\
    //     \|_______|\|__|\|__|\|__|\|__|\|__|\|__| \|__|
    //
    var resultArray: AnyObject[] = []
    init(array: AnyObject[]) {
        self.resultArray = array
    }

    func first() -> AnyObject? {
        return $.first(self.resultArray)
    }
    
    func flatten() -> $ {
        self.resultArray = $.flatten(self.resultArray)
        return self
    }
    
    func initial() -> $ {
        return self.initial(1)
    }
    
    func initial(numElements: Int) -> $ {
        self.resultArray = $.initial(self.resultArray, numElements: numElements)
        return self
    }

    func value() -> AnyObject[] {
        return self.resultArray
    }

    //  ________  ________  ________  ________      ___    ___
    // |\   __  \|\   __  \|\   __  \|\   __  \    |\  \  /  /|
    // \ \  \|\  \ \  \|\  \ \  \|\  \ \  \|\  \   \ \  \/  / /
    //  \ \   __  \ \   _  _\ \   _  _\ \   __  \   \ \    / /
    //   \ \  \ \  \ \  \\  \\ \  \\  \\ \  \ \  \   \/  /  /
    //    \ \__\ \__\ \__\\ _\\ \__\\ _\\ \__\ \__\__/  / /
    //     \|__|\|__|\|__|\|__|\|__|\|__|\|__|\|__|\___/ /
    //                                            \|___|/
    
    //$.first([0, 1, false, 2, '', 3])
    //Gets the first element or first n elements of an array.
    class func first(array: AnyObject[]) -> AnyObject? {
        if array.isEmpty {
            return nil
        } else {
            return array[0]
        }
    }
    
    //$.compact([0, 1, false, 2, '', 3])
    //Remove all falsey values
    class func compact(array: AnyObject?[]) -> AnyObject[] {
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
    class func flatten(array: AnyObject[]) -> AnyObject[] {
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
    class func indexOf<T: Equatable>(array: T[], value: T) -> Int? {
        for (index, elem) in enumerate(array) {
            if elem == value {
                return index
            }
        }
        return nil
    }

    //$.initial([2, 3, 4, 5])
    //Returns all except for last element
    class func initial(array: AnyObject[]) -> AnyObject[] {
        return self.initial(array, numElements: 1)
    }
    
    //$.initial([2, 3, 4, 5], 2)
    //Returns all except for last 2
    class func initial(array: AnyObject[], numElements: Int) -> AnyObject[] {
        var result: AnyObject[] = []
        for (index, _) in enumerate((0..array.count - numElements)) {
            result += array[index]
        }
        return result
    }
    
    //$.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1])
    //Will return intersection of all arrays
    class func intersection<T : Hashable>(arrays: T[]...) -> T[] {
        var map : Dictionary<T, Int> = Dictionary<T, Int>()
        for arr in arrays {
            for elem in arr {
                if let val : Int = map[elem] {
                    map[elem] = val + 1
                } else {
                    map[elem] = 1
                }
            }
        }
        var result : T[] = []
        let count = arrays.count
        for (key, value) in map {
            if value == count {
                result += key
            }
        }
        return result
    }
    
    //$.last([1, 2, 3])
    //Will return last element in the array
    class func last(array: AnyObject[]) -> AnyObject? {
        if array.isEmpty {
            return nil
        } else {
            return array[array.count - 1]
        }
    }
    
    //$.difference([1, 2, 3], [2], [3])
    //returns [1]
    //Returns first array passed subtracted by remaining arrays
    class func difference<T : Hashable>(arrays: T[]...) -> T[] {
        var result : T[] = []
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        let firstArr : T[] = self.first(arrays) as T[]
        let restArr : T[][] = self.rest(arrays) as T[][]
        
        for elem in firstArr {
            map[elem] = true
        }
        for arr in restArr {
            for elem in arr {
                map.removeValueForKey(elem)
            }
        }
        for key in map.keys {
            result += key
        }
        return result
    }
    
    //$.rest([2, 3, 4])
    //returns [3, 4]
    //Returns last n - 1 elements in array
    class func rest(array: AnyObject[]) -> AnyObject[] {
        return self.rest(array, numElements: 1)
    }
    
    //$.rest([2, 3, 4], 2)
    //returns [4]
    //Returns last n - numElements elements in array
    class func rest(array: AnyObject[], numElements: Int) -> AnyObject[] {
        var result: AnyObject[] = []
        for (index, _) in enumerate((numElements..array.count)) {
            result += array[index + numElements]
        }
        return result
    }
    
    //$.findIndex([2, 3, 3]) { return $0 == 3 }
    //returns 1
    //Returns index of element
    class func findIndex<T>(array: T[], iterator: (T) -> Bool) -> Int? {
        for (index, elem : T) in enumerate(array) {
            if iterator(elem) {
                return index
            }
        }
        return nil
    }
    
    //$.findLastIndex([2, 3, 3]) { return $0 == 3 }
    //returns 2
    //Returns last index of element
    class func findLastIndex<T>(array: T[], iterator: (T) -> Bool) -> Int? {
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
    
    //$.lastIndexOf([2, 3, 4], 3)
    //returns 1
    class func lastIndexOf<T: Equatable>(array: T[], value: T) -> Int? {
        var count = array.count
        for (index, _) in enumerate(array) {
            let reverseIndex = count - (index + 1)
            if value == array[reverseIndex] {
                return reverseIndex
            }
        }
        return nil
    }
    
    //$.pull()
    class func pull<T : Equatable>(array: T[], values: T...) -> T[] {
        return self.pull(array, values: values)
    }
    
    class func pull<T : Equatable>(array: T[], values: T[]) -> T[] {
        return array.filter { !self.contains(values, value: $0) }
    }
    
    //$.range()
    class func range(endVal: Int) -> Int[] {
        return self.range(0, endVal: endVal)
    }

    //$.range()
    class func range(startVal: Int, endVal: Int) -> Int[] {
        return self.range(startVal, endVal: endVal, incrementBy: 1)
    }

    //$.range()
    class func range(startVal: Int, endVal: Int, incrementBy: Int) -> Int[] {
        var result: Int[] = []
        for var i = startVal; i < endVal; i = i + incrementBy {
            result += i
        }
        return result
    }
    
    //$.remove()
    class func remove(array: AnyObject[], iterator: (AnyObject) -> Bool) -> AnyObject[] {
        return array.filter { !iterator($0) }
    }
        
    //$.sortedIndex()
    class func sortedIndex<T : Comparable>(array: T[], value: T) -> Int {
        for (index, elem) in enumerate(array) {
            if elem > value {
                return index
            }
        }
        return array.count
    }

    //$.union()
    class func union<T : Hashable>(arrays: T[]...) -> T[] {
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        for arr in arrays {
            for elem in arr {
                map[elem] = true
            }
        }
        var result : T[] = []
        for key in map.keys {
            result += key
        }
        return result
    }

    //$.uniq()
    class func uniq<T : Hashable>(array: T[]) -> T[] {
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        for elem in array {
            map[elem] = true
        }
        var result : T[] = []
        for key in map.keys {
            result += key
        }
        return result
    }
    
    //$.without()
    class func without<T : Equatable>(array: T[], values: T...) -> T[] {
        return self.pull(array, values: values)
    }
    
    //$.xor()
    class func xor<T : Hashable>(arrays: T[]...) -> T[] {
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        for arr in arrays {
            for elem in arr {
                map[elem] = !map[elem]
            }
        }
        var result : T[] = []
        for (key, value) in map {
            if value {
                result += key
            }
        }
        return result
    }
    
    //$.zip()
    class func zip(arrays: AnyObject[]...) -> AnyObject[] {
        var result: AnyObject[][] = []
        for _ in self.first(arrays) as AnyObject[] {
            result += [] as AnyObject[]
        }
        for (index, array) in enumerate(arrays) {
            for (elemIndex, elem : AnyObject) in enumerate(array) {
                result[elemIndex] += elem
            }
        }
        return result
    }

    //$.zipObject()
    class func zipObject<T, E>(keys: T[], values: E[]) -> Dictionary<T, E> {
        var result = Dictionary<T, E>()
        for (index, key) in enumerate(keys) {
            result[key] = values[index]
        }
        return result
    }
    
    //$.noop()
    //A no-operation function.
    class func noop() -> AnyObject? {
        return nil
    }
    
    //$.frequencies(["a", "a", "b", "c", "a", "b"])
    //returns: ["a": 3, "b": 2, "c": 1]
    //returns number of times each element appears in an array.
    class func frequencies<T>(array: Array<T>) -> Dictionary<T, Int> {
        var result = Dictionary<T, Int>()
        for elem in array {
            if let freq = result[elem] {
                result[elem] = freq + 1
            } else {
                result[elem] = 1
            }
        }
        return result
    }
    
    
    //  ________  ________  ___       ___       _______   ________ _________  ___  ________  ________
    // |\   ____\|\   __  \|\  \     |\  \     |\  ___ \ |\   ____\\___   ___\\  \|\   __  \|\   ___  \
    // \ \  \___|\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \___\|___ \  \_\ \  \ \  \|\  \ \  \\ \  \
    //  \ \  \    \ \  \\\  \ \  \    \ \  \    \ \  \_|/_\ \  \       \ \  \ \ \  \ \  \\\  \ \  \\ \  \
    //   \ \  \____\ \  \\\  \ \  \____\ \  \____\ \  \_|\ \ \  \____   \ \  \ \ \  \ \  \\\  \ \  \\ \  \
    //    \ \_______\ \_______\ \_______\ \_______\ \_______\ \_______\  \ \__\ \ \__\ \_______\ \__\\ \__\
    //     \|_______|\|_______|\|_______|\|_______|\|_______|\|_______|   \|__|  \|__|\|_______|\|__| \|__|
    
    class func contains<T : Equatable>(array: T[], value: T) -> Bool {
        return array.filter({ $0 as? T == value }).count > 0
    }
    
    class func at(array: AnyObject[], indexes: Int...) -> AnyObject[] {
        var result : AnyObject[] = []
        for index in indexes {
            result += array[index]
        }
        return result
    }

    class func every<T>(array: T[], iterator: (T) -> Bool) -> Bool {
        var result : Bool = true
        for elem in array {
            result &= iterator(elem)
        }
        return result
    }
    
    class func find<T : Equatable>(array: T[], iterator: (T) -> Bool) -> T? {
        for elem in array {
            let result = iterator(elem)
            if result {
                return elem
            }
        }
        return nil
    }
    
    class func min<T : Comparable>(array: T[]) -> T? {
        var minVal = array[0]
        for elem in array {
            if minVal > elem {
                minVal = elem
            }
        }
        return minVal
    }
    
    class func max<T : Comparable>(array: T[]) -> T? {
        var maxVal = array[0]
        for elem in array {
            if maxVal < elem {
                maxVal = elem
            }
        }
        return maxVal
    }
    
    class func sample(array: AnyObject[]) -> AnyObject {
        return array[random() % array.count]
    }
    
    class func pluck<T, E>(array: Dictionary<T, E>[], value: T) -> E[] {
        var result : E[] = []
        
        for obj in array {
            if let val = obj[value] {
                result += val
            }
        }
        
        return result
    }
    
    // Objects
    
    class func tap<T>(object: T, function: (T) -> ()) -> T {
        function(object)
        return object
    }
    
    // Dictionaries
    
    class func keys<T, U>(dictionary: Dictionary<T, U>) -> T[] {
        var result : T[] = []
        for (key, _) in dictionary {
            result.insert(key, atIndex: 0)
        }
        return result
    }
    
    class func values<T, U>(dictionary: Dictionary<T, U>) -> U[] {
        var result : U[] = []
        for (_, value) in dictionary {
            result.insert(value, atIndex: 0)
        }
        return result
    }
    
    class func merge<T, U>(original: Dictionary<T, U>, dictionaries: Dictionary<T, U>...) -> Dictionary<T, U> {
        var result : Dictionary<T, U> = Dictionary<T, U>()
        
        for (key, value) in original {
            result[key] = value
        }
        
        for dict in dictionaries {
            for (key, value) in dict {
                result[key] = value
            }
        }
        
        return result
    }
    
    class func pick<T, U>(dictionary: Dictionary<T, U>, keys: T...) -> Dictionary<T, U> {
        var result : Dictionary<T, U> = Dictionary<T, U>()
        
        for key in keys {
            result[key] = dictionary[key]
        }
        
        return result
    }
    
    class func omit<T, U>(dictionary: Dictionary<T, U>, keys: T...) -> Dictionary<T, U> {
        var result : Dictionary<T, U> = Dictionary<T, U>()
        
        for (key, value) in dictionary {
            if !self.contains(keys, value: key) {
                result[key] = value
            }
        }
        
        return result
    }
}