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
    
    func map(function: (AnyObject) -> AnyObject) -> $ {
        var result: AnyObject[] = []
        for elem : AnyObject in self.resultArray {
            result += function(elem)
        }
        self.resultArray = result
        return self
    }
    
    func map(function: (Int, AnyObject) -> AnyObject) -> $ {
        var result: AnyObject[] = []
        for (index, elem : AnyObject) in enumerate(self.resultArray) {
            result += function(index, elem)
        }
        self.resultArray = result
        return self
    }
    
    func each(function: (AnyObject) -> ()) -> $ {
        for elem : AnyObject in self.resultArray {
            function(elem)
        }
        return self
    }
    
    func each(function: (Int, AnyObject) -> ()) -> $ {
        for (index, elem : AnyObject) in enumerate(self.resultArray) {
            function(index, elem)
        }
        return self
    }
    
    func filter(function: (AnyObject) -> Bool) -> $ {
        var result: AnyObject[] = []
        for elem : AnyObject in self.resultArray {
            if function(elem) {
                result += elem
            }
        }
        self.resultArray = result
        return self
    }
    
    func all(function: (AnyObject) -> Bool) -> Bool {
        for elem : AnyObject in self.resultArray {
            if !function(elem) {
                return false
            }
        }
        return true
    }
    
    func any(function: (AnyObject) -> Bool) -> Bool {
        for elem : AnyObject in self.resultArray {
            if function(elem) {
                return true
            }
        }
        return false
    }
    
    func value() -> AnyObject[] {
        return self.resultArray
    }

    func slice(start: Int, end: Int = 0) -> $ {
        self.resultArray =  $.slice(self.resultArray, start: start, end: end);
        return self;
    }
    
    //  ___  ___  _______   ___       ________  _______   ________
    // |\  \|\  \|\  ___ \ |\  \     |\   __  \|\  ___ \ |\   __  \
    // \ \  \\\  \ \   __/|\ \  \    \ \  \|\  \ \   __/|\ \  \|\  \
    //  \ \   __  \ \  \_|/_\ \  \    \ \   ____\ \  \_|/_\ \   _  _\
    //   \ \  \ \  \ \  \_|\ \ \  \____\ \  \___|\ \  \_|\ \ \  \\  \|
    //    \ \__\ \__\ \_______\ \_______\ \__\    \ \_______\ \__\\ _\
    //     \|__|\|__|\|_______|\|_______|\|__|     \|_______|\|__|\|__|
    //
    class func after<T, E>(n: Int, function: (T...) -> E) -> ((T...) -> E?) {
        var counter = n
        return { (params: (T...)) -> E? in
            if --counter <= 0 {
                return function(reinterpretCast(params))
            }
            return nil
        }
    }
    
    class func after<T>(n: Int, function: () -> T) -> (() -> T?) {
        let f = self.after(n) { (params: (Any?...)) -> T? in
            return function()
        }
        return { f()? }
    }

    class func at<T>(array: T[], indexes: Int...) -> T[] {
        var result: T[] = []
        for index in indexes {
            result += array[index]
        }
        return result
    }
    
    class func bind<T, E>(function: (T...) -> E, _ parameters: T...) -> (() -> E) {
        return { () -> E in
            return function(reinterpretCast(parameters))
        }
    }

    class func compact<T>(array: T?[]) -> T[] {
        var result: T[] = []
        for elem in array {
            if let val = elem {
                result += val
            }
        }
        return result
    }
    
    class func contains<T: Equatable>(array: T[], value: T) -> Bool {
        return array.filter({ $0 as? T == value }).count > 0
    }

    class func partial<T, E> (function: (T...) -> E, _ parameters: T...) -> ((T...) -> E) {
        return { (params: T...) -> E in
            return function(reinterpretCast(parameters + params))
        }
    }
    
    class func difference<T : Hashable>(arrays: T[]...) -> T[] {
        var result : T[] = []
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        let firstArr : T[] = self.first(arrays)!
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
    
    class func every<T>(array: T[], iterator: (T) -> Bool) -> Bool {
        var result : Bool = true
        for elem in array {
            result &= iterator(elem)
        }
        return result
    }
    
    class func find<T: Equatable>(array: T[], iterator: (T) -> Bool) -> T? {
        for elem in array {
            let result = iterator(elem)
            if result {
                return elem
            }
        }
        return nil
    }
    
    class func findIndex<T>(array: T[], iterator: (T) -> Bool) -> Int? {
        for (index, elem : T) in enumerate(array) {
            if iterator(elem) {
                return index
            }
        }
        return nil
    }
    
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
    
    class func first<T>(array: T[]) -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array[0]
        }
    }

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
    
    class func frequencies<T>(array: Array<T>) -> Dictionary<T, Int> {
        return self.frequencies(array) { $0 }
    }
    
    class func frequencies<T, U: Equatable>(array: Array<T>, function: (T) -> U) -> Dictionary<U, Int> {
        var result = Dictionary<U, Int>()
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
    
    class func indexOf<T: Equatable>(array: T[], value: T) -> Int? {
        for (index, elem) in enumerate(array) {
            if elem == value {
                return index
            }
        }
        return nil
    }

    class func initial<T>(array: T[], numElements: Int = 1) -> T[] {
        var result: T[] = []
        for (index, _) in enumerate((0..array.count - numElements)) {
            result += array[index]
        }
        return result
    }
    
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
    
    class func join<T: ExtensibleCollection>(array: T[], separator: T) -> T {
        return Swift.join(separator, reinterpretCast(array) as T[])
    }
    
    class func keys<T, U>(dictionary: Dictionary<T, U>) -> T[] {
        var result : T[] = []
        for (key, _) in dictionary {
            result.insert(key, atIndex: 0)
        }
        return result
    }
    
    class func last<T>(array: T[]) -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array[array.count - 1]
        }
    }
    
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
    
    class func max<T : Comparable>(array: T[]) -> T? {
        var maxVal = array[0]
        for elem in array {
            if maxVal < elem {
                maxVal = elem
            }
        }
        return maxVal
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
    
    class func min<T : Comparable>(array: T[]) -> T? {
        var minVal = array[0]
        for elem in array {
            if minVal > elem {
                minVal = elem
            }
        }
        return minVal
    }
    
    class func noop() -> AnyObject? {
        return nil
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
    
    class func pick<T, U>(dictionary: Dictionary<T, U>, keys: T...) -> Dictionary<T, U> {
        var result : Dictionary<T, U> = Dictionary<T, U>()
        
        for key in keys {
            result[key] = dictionary[key]
        }
        
        return result
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
    
    class func pull<T : Equatable>(array: T[], values: T...) -> T[] {
        return self.pull(array, values: values)
    }
    
    
    class func pull<T : Equatable>(array: T[], values: T[]) -> T[] {
        return array.filter { !self.contains(values, value: $0) }
    }

    class func range<T : ForwardIndex where T : IntegerLiteralConvertible>(endVal: T) -> T[] {
        return self.range(0, endVal: endVal)
    }
    
    class func range<T : ForwardIndex where T.DistanceType : IntegerLiteralConvertible>(startVal: T, endVal: T) -> T[] {
        return self.range(startVal, endVal: endVal, incrementBy: 1)
    }
    
    class func range<T : ForwardIndex>(startVal: T, endVal: T, incrementBy: T.DistanceType) -> T[] {
        let range = (startVal..endVal).by(incrementBy)
        
        return sequence(range)
    }
    
    class func sequence<S : Sequence>(seq: S) -> S.GeneratorType.Element[] {
        return Array<S.GeneratorType.Element>(seq)
    }
 
    class func remove<T>(array: T[], iterator: (T) -> Bool) -> T[] {
        return array.filter { !iterator($0) }
    }
    
    class func rest<T>(array: T[], numElements: Int = 1) -> T[] {
        var result: T[] = []
        for (index, _) in enumerate((numElements..array.count)) {
            result += array[index + numElements]
        }
        return result
    }
    
    class func sample<T>(array: T[]) -> T {
        return array[random() % array.count]
    }

    class func slice<T>(array: T[], start: Int, end: Int = 0) -> T[] {
        
        var uend = end;
        if (uend == 0) {
            uend = array.count;
        }
        
        if end > array.count || start > array.count || uend < start {
            return [];
        } else {
            return Array(array[start..uend]);
        }
    }
    
    class func sortedIndex<T : Comparable>(array: T[], value: T) -> Int {
        for (index, elem) in enumerate(array) {
            if elem > value {
                return index
            }
        }
        return array.count
    }
    
    class func tap<T>(object: T, function: (T) -> ()) -> T {
        function(object)
        return object
    }
    
    class func times<T>(n: Int, function: () -> T) -> T[] {
        return self.times(n) { (index: Int) -> T in
            return function()
        }
    }
    
    class func times(n: Int, function: () -> ()) {
        self.times(n) { (index: Int) -> () in
            function()
        }
    }
    
    class func times<T>(n: Int, function: (Int) -> T) -> T[] {
        var result: T[] = []
        for index in (0..n) {
            result += function(index)
        }
        return result
    }
    
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
    
    class func values<T, U>(dictionary: Dictionary<T, U>) -> U[] {
        var result : U[] = []
        for (_, value) in dictionary {
            result.insert(value, atIndex: 0)
        }
        return result
    }
    
    class func without<T : Equatable>(array: T[], values: T...) -> T[] {
        return self.pull(array, values: values)
    }
    
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

    class func zipObject<T, E>(keys: T[], values: E[]) -> Dictionary<T, E> {
        var result = Dictionary<T, E>()
        for (index, key) in enumerate(keys) {
            result[key] = values[index]
        }
        return result
    }
    
    /**
    *  Produces an array of arrays, each containing n elements, each offset by step.
    *  If the final partition is not n elements long it is dropped.
    *  @param array The array to partition.
    *  @param n The number of elements in each partition.
    *  @param step The number of elements to progress between each partition. Set to n if not supplied.
    *  @return Array partitioned into n element arrays, starting step elements apart.
    */
    class func partition<T>(array: Array<T>, var n: Int, var step: Int? = nil) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        if !step?   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        if n > array.count { return [[]] }
        
        for i in (0...array.count-n).by(step!) {
            result += Array(array[i..(i+n)] as Slice<T>)
        }
        
        return result
    }
    
    /**
    *  Produces an array of arrays, each containing n elements, each offset by step.
    *  @param array The array to partition.
    *  @param n The number of elements in each partition.
    *  @param step The number of elements to progress between each partition. Set to n if not supplied.
    *  @param pad An array of elements to pad the last partition if it is not long enough to
    *             contain n elements. If nil is passed or there are not enough pad elements
    *             the last partition may less than n elements long.
    *  @return Array partitioned into n element arrays, starting step elements apart.
    */
    class func partition<T>(var array: Array<T>, var n: Int, var step: Int? = nil, pad: T[]?) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        if !step?   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in (0..array.count).by(step!) {
            var end = i+n
            if end > array.count { end = array.count }
            result += Array(array[i..end] as Slice<T>)
            if end != i+n { break }
        }
        
        if let padding = pad {
            let remain = array.count%n
            let end = padding.count > remain ? remain : padding.count
            result[result.count-1] += Array(padding[0..end] as Slice<T>)
        }
        
        return result
    }
    
    /**
    *  Produces an array of arrays, each containing n elements, each offset by step.
    *  @param array The array to partition.
    *  @param n The number of elements in each partition.
    *  @param step The number of elements to progress between each partition. Set to n if not supplied.
    *  @return Array partitioned into n element arrays, starting step elements apart.
    */
    class func partitionAll<T>(array: Array<T>, var n: Int, var step: Int? = nil) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        if !step?   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in (0..array.count).by(step!) {
            var end = i+n
            if end > array.count { end = array.count }
            result += Array(array[i..end] as Slice<T>)
        }
        
        return result
    }
    
    /**
    *  Applies function to each element in array, splitting it each time function returns a new value.
    *  @param array The array to partition.
    *  @param function Function which takes an element and produces an equatable result.
    *  @return Array partitioned in order, splitting via results of function.
    */
    class func partitionBy<T, U: Equatable>(array: Array<T>, function: (T) -> U) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        var lastValue: U? = nil
        
        for item in array {
            let value = function(item)
            
            if value == lastValue? {
                result[result.count-1] += item
            } else {
                result.append([item])
                lastValue = value
            }
        }
        
        return result
    }
    
}