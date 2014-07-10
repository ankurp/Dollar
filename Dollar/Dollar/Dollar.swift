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

class Dollar {
    
    //  ________  ___  ___  ________  ___  ________
    // |\   ____\|\  \|\  \|\   __  \|\  \|\   ___  \
    // \ \  \___|\ \  \\\  \ \  \|\  \ \  \ \  \\ \  \
    //  \ \  \    \ \   __  \ \   __  \ \  \ \  \\ \  \
    //   \ \  \____\ \  \ \  \ \  \ \  \ \  \ \  \\ \  \
    //    \ \_______\ \__\ \__\ \__\ \__\ \__\ \__\\ \__\
    //     \|_______|\|__|\|__|\|__|\|__|\|__|\|__| \|__|
    //
    
    var resultArray: [AnyObject] = []
    var lazyQueue:[(()->AnyObject?)] = [];
    var lazyIndex:Int = 0;
    
    /// Initializer of the wrapper object for chaining.
    ///
    /// :param array The array to wrap.
    init(array: [AnyObject]) {
        self.resultArray = array
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :return First element from the array.
    func first() -> ${
        lazyQueue.append{
            return $.first(self.resultArray)
        }
        return self
    }
    
    /// Get the second object in the wrapper object.
    ///
    /// :return Second element from the array.
    func second() -> ${
        lazyQueue.append{
            return $.second(self.resultArray)
        }
        return self
    }
    
    /// Get the third object in the wrapper object.
    ///
    /// :return Third element from the array.
    func third() -> ${
        lazyQueue.append{
            return $.third(self.resultArray)
        }
        return self
    }
    
    /// Get the fourth object in the wrapper object.
    ///
    /// :return Fourth element from the array.
    func fourth()-> ${
        lazyQueue.append{
            return $.fourth(self.resultArray)
        }
        return self
    }
    
    /// Get the fifth object in the wrapper object.
    ///
    /// :return Fifth element from the array.
    func fifth() -> ${
        lazyQueue.append{
            return $.fifth(self.resultArray)
        }
        return self
    }
    
    /// Get the sixth object in the wrapper object.
    ///
    /// :return Sixth element from the array.
    func sixth() -> ${
        lazyQueue.append{
            return $.sixth(self.resultArray)
        }
        return self
    }
    
    /// Get the seventh object in the wrapper object.
    ///
    /// :return Seventh element from the array.
    func seventh() -> ${
        lazyQueue.append{
            return $.seventh(self.resultArray)
        }
        return self
    }
    
    /// Get the eighth object in the wrapper object.
    ///
    /// :return Eighth element from the array.
    func eighth() -> ${
        lazyQueue.append{
            return $.eighth(self.resultArray)
        }
        return self
    }
    
    /// Get the ninth object in the wrapper object.
    ///
    /// :return Ninth element from the array.
    func ninth() -> ${
        lazyQueue.append{
            return $.ninth(self.resultArray)
        }
        return self
    }
    
    /// Get the tenth object in the wrapper object.
    ///
    /// :return Tenth element from the array.
    func tenth() -> ${
        lazyQueue.append{
            return $.tenth(self.resultArray)
        }
        return self
    }
    
    /// Flattens nested array.
    ///
    /// :return The wrapper object.
    func flatten() -> ${
        lazyQueue.append{
            self.resultArray = $.flatten(self.resultArray)
            return self.resultArray
        }
        return self
    }
    
    /// Keeps all the elements except last one.
    ///
    /// :return The wrapper object.
    func initial() -> ${
        return self.initial(1)
    }
    
    /// Keeps all the elements except last n elements.
    ///
    /// :param numElements Number of items to remove from the end of the array.
    /// :return The wrapper object.
    func initial(numElements: Int) -> ${
        lazyQueue.append{
            self.resultArray = Dollar.initial(self.resultArray, numElements: numElements)
            return self.resultArray
        }
        return self
    }
    
    /// Maps elements to new elements.
    ///
    /// :param function Function to map.
    /// :return The wrapper object.
    func map(function: (AnyObject) -> AnyObject) -> ${
        lazyQueue.append{
            var result: [AnyObject] = []
            for elem : AnyObject in self.resultArray {
                result += function(elem)
            }
            self.resultArray = result
            return self.resultArray
        }
        return self
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    func map(function: (Int, AnyObject) -> AnyObject) -> ${
        lazyQueue.append{
            var result: [AnyObject] = []
            for (index, elem : AnyObject) in enumerate(self.resultArray) {
                result += function(index, elem)
            }
            self.resultArray = result
            return self.resultArray
        }
        return self
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    func each(function: (AnyObject) -> ()) -> ${
        lazyQueue.append{
            for elem : AnyObject in self.resultArray {
                function(elem)
            }
            return self.resultArray
        }
        return self;
    }
    
    /// Get the first object in the wrapper object.
    ///
    /// :param array The array to wrap.
    /// :return The wrapper object.
    func each(function: (Int, AnyObject) -> ()) -> ${
        lazyQueue.append{
            for (index, elem : AnyObject) in enumerate(self.resultArray) {
                function(index, elem)
            }
            return self.resultArray
        }
        return self;
    }
    
    /// Filter elements based on the function passed.
    ///
    /// :param function Function to tell whether to keep an element or remove.
    /// :return The wrapper object.
    func filter(function: (AnyObject) -> Bool) -> ${
        lazyQueue.append{
            self.resultArray = self.resultArray.filter(function)
            return self.resultArray
        }
        return self;
    }
    
    /// Returns if all elements in array are true based on the passed function.
    ///
    /// :param function Function to tell whether element value is true or false.
    /// :return Whether all elements are true according to func function.
    func all(function: (AnyObject) -> Bool) -> ${
        lazyQueue.append{
            return Dollar.every(self.resultArray, iterator: function)
        }
        return self;
    }
    
    /// Returns if any element in array is true based on the passed function.
    ///
    /// :param function Function to tell whether element value is true or false.
    /// :return Whether any one element is true according to func function in the array.
    func any(function: (AnyObject) -> Bool) -> ${
        lazyQueue.append{
            for elem : AnyObject in self.resultArray {
                if function(elem) {
                    return true
                }
            }
            return false
        }
        return self;
    }
    
    /// Get the final result from the wrapper object to terminated the chain.
    ///
    /// :return Final resulting array from applying all functions on it.
    func value() -> ${
        lazyQueue.append{
            return self.resultArray
        }
        return self;
    }
    
    /// Slice the array into smaller size based on start and end value.
    ///
    /// :param start Start index to start slicing from.
    /// :param end End index to stop slicing to and not including element at that index.
    /// :return The wrapper object.
    func slice(start: Int, end: Int = 0) -> ${
        lazyQueue.append{
            self.resultArray =  Dollar.slice(self.resultArray, start: start, end: end);
            return self.resultArray;
        }
        return self;
    }
    
    /// Consumes current method in chain
    ///
    /// :return Result of consuming method, nil if at end of chain or chain is empty
    func step() -> AnyObject?{
        if(!self.hasStep()) { return nil; }
        
        var action = lazyQueue.removeAtIndex(lazyIndex);
        return action();
    }
    
    /// Invoke current method in chain and increment
    ///
    /// :return Result of invoked method in chain, nil if chain is empty
    func walk() -> AnyObject?{
        if(lazyQueue.isEmpty) { return nil; }
        if(!self.hasStep()){ self.resetChain() }
        
        return lazyQueue[lazyIndex++]();
    }
    
    /// Decrement chain then consume method
    ///
    /// :return Result of consumed method in chain, nil if chain is empty or at beginning of chain
    func stepBackward() -> AnyObject?{
        if(!self.hasStepBackward()) { return nil; }
        lazyIndex--;
        
        return self.step();
    }
    /// Decrement chain then invoke method
    ///
    /// :return Result of invoked method, nile if chain is empty
    func walkBackward() -> AnyObject?{
        if(lazyQueue.isEmpty) { return nil; }
        if(!self.hasStepBackward()) { self.endChain(); }
        
        return lazyQueue[--lazyIndex]();
    }
    
    /// Moves index to beginning of chain
    func resetChain(){
        lazyIndex = 0;
    }
    
    /// Moves index to end of chain
    func endChain(){
        lazyIndex = lazyQueue.count;
    }
    
    /// Evaluates entire chain at once
    ///
    /// :return Result of chain
    func invokeAll() -> AnyObject?{
        var result:AnyObject? = nil
        
        self.resetChain();
        return self.invokeRest();
    }
    
    /// Evaluates remainder of chain
    ///
    /// :return Result of chain
    func invokeRest() -> AnyObject?{
        var result:AnyObject? = nil
        
        while(self.hasStep()){
            result = self.step();
        }
        return result;
    }
    
    /// Check if any steps can be made
    func hasStep() -> Bool{
        return self.countSteps() != 0;
    }
    /// Check if a backward step can be made
    func hasStepBackward() -> Bool{
        return self.countBackwardSteps() != 0;
    }
    
    /// Check if there are any methods that can be consumed
    func hasChain() -> Bool{
        return !lazyQueue.isEmpty;
    }
    
    /// :return Returns mathods that need evaluation
    func countChain() -> Int{
        return lazyQueue.count;
    }
    
    /// Get the count of remining methods to evaluate
    ///
    /// :return Remaining methods to evluate
    func countSteps() -> Int{
        if(!self.hasChain()) { return 0; }
        return lazyQueue.count - lazyIndex;
    }
    
    func countBackwardSteps() -> Int{
        if(!self.hasChain()) { return 0; }
        return lazyIndex;
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
    class func after<T, E>(n: Int, function: (T...) -> E) -> ((T...) -> E?) {
        var counter = n
        return { (params: (T...)) -> E? in
            if --counter <= 0 {
                return function(reinterpretCast(params))
            }
            return nil
        }
    }
    
    /// Creates a function that executes passed function only after being called n times.
    ///
    /// :param n Number of times after which to call function.
    /// :param function Function to be called that does not take any params.
    /// :return Function that can be called n times after which the callback function is called.
    class func after<T>(n: Int, function: () -> T) -> (() -> T?) {
        let f = self.after(n) { (params: (Any?...)) -> T? in
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
    class func at<T>(array: [T], indexes: Int...) -> [T] {
        return self.at(array, indexes: indexes)
    }
    
    /// Creates an array of elements from the specified indexes, or keys, of the collection.
    /// Indexes may be specified as individual arguments or as arrays of indexes.
    ///
    /// :param array The array to source from
    /// :param indexes Get elements from these indexes
    /// :return New array with elements from the indexes specified.
    class func at<T>(array: [T], indexes: [Int]) -> [T] {
        var result: [T] = []
        for index in indexes {
            result += array[index]
        }
        return result
    }
    
    /// Creates a function that, when called, invokes func with the binding of arguments provided.
    ///
    /// :param function Function to be bound.
    /// :param parameters Parameters to be passed into the function when being invoked.
    /// :return A new function that when called will invoked the passed function with the parameters specified.
    class func bind<T, E>(function: (T...) -> E, _ parameters: T...) -> (() -> E) {
        return { () -> E in
            return function(reinterpretCast(parameters))
        }
    }
    
    /// Creates an array with all nil values removed.
    ///
    /// :param array Array to be compacted.
    /// :return A new array that doesnt have any nil values.
    class func compact<T>(array: [T?]) -> [T] {
        var result: [T] = []
        for elem in array {
            if let val = elem {
                result += val
            }
        }
        return result
    }
    
    /// Checks if a given value is present in the array.
    ///
    /// :param array The array to check against.
    /// :param value The value to check.
    /// :return Whether value is in the array.
    class func contains<T : Equatable>(array: [T], value: T) -> Bool {
        return Swift.contains(array, value)
    }
    
    /// Creates an array excluding all values of the provided arrays.
    ///
    /// :param arrays The arrays to difference between.
    /// :return The difference between the first array and all the remaining arrays from the arrays params.
    class func difference<T : Hashable>(arrays: [T]...) -> [T] {
        var result : [T] = []
        var map : Dictionary<T, Int> = Dictionary<T, Int>()
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
            for _ in 0...count {
                result += key
            }
        }
        return result
    }
    
    /// Checks if the given callback returns true value for all items in the array.
    ///
    /// :param array The array to check.
    /// :param iterator Check whether element value is true or false.
    /// :return First element from the array.
    class func every<T>(array: [T], iterator: (T) -> Bool) -> Bool {
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
    class func find<T: Equatable>(array: [T], iterator: (T) -> Bool) -> T? {
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
    class func findIndex<T>(array: [T], iterator: (T) -> Bool) -> Int? {
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
    class func findLastIndex<T>(array: [T], iterator: (T) -> Bool) -> Int? {
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
    class func first<T>(array: [T]) -> T? {
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
    class func second<T>(array: [T]) -> T? {
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
    class func third<T>(array: [T]) -> T? {
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
    class func fourth<T>(array: [T]) -> T? {
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
    class func fifth<T>(array: [T]) -> T? {
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
    class func sixth<T>(array: [T]) -> T? {
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
    class func seventh<T>(array: [T]) -> T? {
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
    class func eighth<T>(array: [T]) -> T? {
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
    class func ninth<T>(array: [T]) -> T? {
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
    class func tenth<T>(array: [T]) -> T? {
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
    class func flatten(array: [AnyObject]) -> [AnyObject] {
        var resultArr: [AnyObject] = []
        for elem : AnyObject in array {
            if let val = elem as? [AnyObject] {
                resultArr += flatten(val)
            } else {
                resultArr += elem
            }
        }
        return resultArr
    }
    /* ALJCepeda: I could not get this to work no matter what I did.
    class func flatten<T>(array: [T]) -> [T] {
    var resultArr: [T] = []
    for elem : T in array {
    if let val = elem as? [T] {
    resultArr += self.flatten(val)
    } else {
    resultArr += elem
    }
    }
    return resultArr
    }*/
    
    /// This method returns a dictionary of values in an array mapping to the
    /// total number of occurrences in the array.
    ///
    /// :param array The array to source from.
    /// :return Dictionary that contains the key generated from the element passed in the function.
    class func frequencies<T>(array: Array<T>) -> Dictionary<T, Int> {
        return self.frequencies(array) { $0 }
    }
    
    /// This method returns a dictionary of values in an array mapping to the
    /// total number of occurrences in the array. If passed a function it returns
    /// a frequency table of the results of the given function on the arrays elements.
    ///
    /// :param array The array to source from.
    /// :param function The function to get value of the key for each element to group by.
    /// :return Dictionary that contains the key generated from the element passed in the function.
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
    
    /// The identity function. Returns the argument it is given.
    ///
    /// :param arg Value to return
    /// :return Argument that was passed
    class func id<T>(arg: T) -> T {
        return arg
    }
    
    /// Gets the index at which the first occurrence of value is found.
    ///
    /// :param array The array to source from.
    /// :param value Value whose index needs to be found.
    /// :return Index of the element otherwise returns nil if not found.
    class func indexOf<T: Equatable>(array: [T], value: T) -> Int? {
        return self.findIndex(array) { $0 == value }
    }
    
    /// Gets all but the last element or last n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to ignore in the end.
    /// :return Array of initial values.
    class func initial<T>(array: [T], numElements: Int = 1) -> [T] {
        var result: [T] = []
        if (array.count > numElements+1) {
            for index in 0...(array.count - (numElements+1)) {
                result += array[index]
            }
        }
        return result
    }
    
    /// Creates an array of unique values present in all provided arrays.
    ///
    /// :param arrays The arrays to perform an intersection on.
    /// :return Intersection of all arrays passed.
    class func intersection<T : Hashable>(arrays: [T]...) -> [T] {
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
        var result : [T] = []
        let count = arrays.count
        for (key, value) in map {
            if value == count {
                result += key
            }
        }
        return result
    }
    
    /// Joins the elements in the array to create a concatenated element of the same type.
    ///
    /// :param array The array to join the elements of.
    /// :param separator The separator to join the elements with.
    /// :return Joined element from the array of elements.
    class func join<T: ExtensibleCollection>(array: [T], separator: T) -> T {
        return Swift.join(separator, reinterpretCast(array) as [T])
    }
    
    /// Creates an array of keys given a dictionary.
    ///
    /// :param dictionary The dictionary to source from.
    /// :return Array of keys from dictionary.
    class func keys<T, U>(dictionary: Dictionary<T, U>) -> [T] {
        var result : [T] = []
        for (key, _) in dictionary {
            result.insert(key, atIndex: 0)
        }
        return result
    }
    
    /// Gets the last element from the array.
    ///
    /// :param array The array to source from.
    /// :return Last element from the array.
    class func last<T>(array: [T]) -> T? {
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
    class func lastIndexOf<T: Equatable>(array: [T], value: T) -> Int? {
        return self.findLastIndex(array) { $0 == value }
    }
    
    /// Maps each element to new value based on the map function passed
    ///
    /// :param array The array to source from.
    /// :param transform The mapping function
    /// :return Array of elements mapped using the map function
    class func map<T, E>(array: [T], transform: (T) -> E) -> [E] {
        return array.map(transform)
    }
    
    /// Retrieves the maximum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Maximum element in array.
    class func max<T : Comparable>(array: [T]) -> T? {
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
    class func memoize<T: Hashable, U>(function: ((T -> U), T) -> U) -> (T -> U) {
        var cache = Dictionary<T, U>()
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
    class func merge<T, U>(#dictionaries: Dictionary<T, U>...) -> Dictionary<T, U> {
        var result = Dictionary<T, U>()
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
    class func merge<T>(#arrays: Array<T>...) -> Array<T> {
        var result = Array<T>()
        for arr in arrays {
            result += arr
        }
        return result
    }
    
    /// Retrieves the minimum value in an array.
    ///
    /// :param array The array to source from.
    /// :return Minimum value from array.
    class func min<T : Comparable>(array: [T]) -> T? {
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
    class func noop() -> AnyObject? {
        return nil
    }
    
    /// Creates a shallow clone of a dictionary excluding the specified keys.
    ///
    /// :param dictionary The dictionary to source from.
    /// :param keys The keys to omit from returning dictionary.
    /// :return Dictionary with the keys specified omitted.
    class func omit<T, U>(dictionary: Dictionary<T, U>, keys: T...) -> Dictionary<T, U> {
        var result : Dictionary<T, U> = Dictionary<T, U>()
        
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
    class func partial<T, E> (function: (T...) -> E, _ parameters: T...) -> ((T...) -> E) {
        return { (params: T...) -> E in
            return function(reinterpretCast(parameters + params))
        }
    }
    
    /// Produces an array of arrays, each containing n elements, each offset by step.
    /// If the final partition is not n elements long it is dropped.
    ///
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    class func partition<T>(array: Array<T>, var n: Int, var step: Int? = nil) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        if !step?   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        if n > array.count { return [[]] }
        
        for i in (0...array.count-n).by(step!) {
            result += Array(array[i...(i+n)] as Slice<T>)
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
    class func partition<T>(var array: Array<T>, var n: Int, var step: Int? = nil, pad: [T]?) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        if !step?   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in (0...array.count).by(step!) {
            var end = i+n
            if end > array.count { end = array.count }
            result += Array(array[i...end] as Slice<T>)
            if end != i+n { break }
        }
        
        if let padding = pad {
            let remain = array.count%n
            let end = padding.count > remain ? remain : padding.count
            result[result.count-1] += Array(padding[0...end] as Slice<T>)
        }
        return result
    }
    
    /// Produces an array of arrays, each containing n elements, each offset by step.
    ///
    /// :param array The array to partition.
    /// :param n The number of elements in each partition.
    /// :param step The number of elements to progress between each partition. Set to n if not supplied.
    /// :return Array partitioned into n element arrays, starting step elements apart.
    class func partitionAll<T>(array: Array<T>, var n: Int, var step: Int? = nil) -> Array<Array<T>> {
        var result = Array<Array<T>>()
        if !step?   { step = n } // If no step is supplied move n each step.
        if step < 1 { step = 1 } // Less than 1 results in an infinite loop.
        if n < 1    { n = 0 }    // Allow 0 if user wants [[],[],[]] for some reason.
        
        for i in (0...array.count).by(step!) {
            var end = i+n
            if end > array.count { end = array.count }
            result += Array(array[i...end] as Slice<T>)
        }
        return result
    }
    
    /// Applies function to each element in array, splitting it each time function returns a new value.
    ///
    /// :param array The array to partition.
    /// :param function Function which takes an element and produces an equatable result.
    /// :return Array partitioned in order, splitting via results of function.
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
    
    /// Creates a shallow clone of a dictionary composed of the specified keys.
    ///
    /// :param dictionary The dictionary to source from.
    /// :param keys The keys to pick values from.
    /// :return Dictionary with the key and values picked from the keys specified.
    class func pick<T, U>(dictionary: Dictionary<T, U>, keys: T...) -> Dictionary<T, U> {
        var result : Dictionary<T, U> = Dictionary<T, U>()
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
    class func pluck<T, E>(array: [Dictionary<T, E>], value: T) -> [E] {
        var result : [E] = []
        for obj in array {
            if let val = obj[value] {
                result += val
            }
        }
        return result
    }
    
    /// Removes all provided values from the given array.
    ///
    /// :param array The array to source from.
    /// :return Array with values pulled out.
    class func pull<T : Equatable>(array: [T], values: T...) -> [T] {
        return self.pull(array, values: values)
    }
    
    /// Removes all provided values from the given array.
    ///
    /// :param array The array to source from.
    /// :param values The values to remove.
    /// :return Array with values pulled out.
    class func pull<T : Equatable>(array: [T], values: [T]) -> [T] {
        return array.filter { !self.contains(values, value: $0) }
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param endVal End value of range.
    /// :return Array of elements based on the sequence starting from 0 to endVal and incremented by 1.
    class func range<T : ForwardIndex where T : IntegerLiteralConvertible>(endVal: T) -> [T] {
        return self.range(0, endVal: endVal)
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param startVal Start value of range
    /// :param endVal End value of range
    /// :return Array of elements based on the sequence that is incremented by 1
    class func range<T : ForwardIndex where T.DistanceType : IntegerLiteralConvertible>(startVal: T, endVal: T) -> [T] {
        return self.range(startVal, endVal: endVal, incrementBy: 1)
    }
    
    /// Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
    ///
    /// :param startVal Start value of range.
    /// :param endVal End value of range.
    /// :param incrementBy Increment sequence by.
    /// :return Array of elements based on the sequence.
    class func range<T : ForwardIndex>(startVal: T, endVal: T, incrementBy: T.DistanceType) -> [T] {
        let range = (startVal...endVal).by(incrementBy)
        return self.sequence(range)
    }
    
    /// Reduce function that will resolve to one value after performing combine function on all elements
    ///
    /// :param array The array to source from.
    /// :param initial Initial value to seed the reduce function with
    /// :param combine Function that will combine the passed value with element in the array
    /// :return The result of reducing all of the elements in the array into one value
    class func reduce<U, T>(array: [T], initial: U, combine: (U, T) -> U) -> U {
        return array.reduce(initial, combine: combine)
    }
    
    /// Creates an array of an arbitrary sequence. Especially useful with builtin ranges.
    ///
    /// :param seq The sequence to generate from.
    /// :return Array of elements generated from the sequence.
    class func sequence<S : Sequence>(seq: S) -> [S.GeneratorType.Element] {
        return Array<S.GeneratorType.Element>(seq)
    }
    
    /// Removes all elements from an array that the callback returns true.
    ///
    /// :param array The array to wrap.
    /// :param iterator Remove elements for which iterator returns true.
    /// :return Array with elements filtered out.
    class func remove<T>(array: [T], iterator: (T) -> Bool) -> [T] {
        return array.filter { !iterator($0) }
    }
    
    /// The opposite of initial this method gets all but the first element or first n elements of an array.
    ///
    /// :param array The array to source from.
    /// :param numElements The number of elements to exclude from the beginning.
    /// :return The rest of the elements.
    class func rest<T>(array: [T], numElements: Int = 1) -> [T] {
        var result: [T] = []
        if (numElements < array.count) {
            for index in numElements...array.count {
                result += array[index]
            }
        }
        return result
    }
    
    /// Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.
    ///
    /// :param array The array to slice.
    /// :param start Start index.
    /// :param end End index.
    /// :return First element from the array.
    class func slice<T>(array: [T], start: Int, end: Int = 0) -> [T] {
        var uend = end;
        if (uend == 0) {
            uend = array.count;
        }
        
        if end > array.count || start > array.count || uend < start {
            return [];
        } else {
            return Array(array[start...uend]);
        }
    }
    
    /// Gives the smallest index at which a value should be inserted into a given the array is sorted.
    ///
    /// :param array The array to source from.
    /// :param value Find sorted index of this value.
    /// :return Index of where the elemnt should be inserted.
    class func sortedIndex<T : Comparable>(array: [T], value: T) -> Int {
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
    class func tap<T>(object: T, function: (T) -> ()) -> T {
        function(object)
        return object
    }
    
    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// :param n Number of times to call function.
    /// :param function The function to be called every time.
    /// :return Values returned from callback function.
    class func times<T>(n: Int, function: () -> T) -> [T] {
        return self.times(n) { (index: Int) -> T in
            return function()
        }
    }
    
    /// Call a function n times and also passes the index. If a value is returned
    /// in the function then the times method will return an array of those values.
    ///
    /// :param n Number of times to call function.
    /// :param function The function to be called every time.
    class func times(n: Int, function: () -> ()) {
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
    class func times<T>(n: Int, function: (Int) -> T) -> [T] {
        var result: [T] = []
        for index in (0...n) {
            result += function(index)
        }
        return result
    }
    
    /// Creates an array of unique values, in order, of the provided arrays.
    ///
    /// :param arrays The arrays to perform union on.
    /// :return Resulting array after union.
    class func union<T : Hashable>(arrays: [T]...) -> [T] {
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        for arr in arrays {
            for elem in arr {
                map[elem] = true
            }
        }
        var result : [T] = []
        for key in map.keys {
            result += key
        }
        return result
    }
    
    /// Creates a duplicate-value-free version of an array.
    ///
    /// :param array The array to source from.
    /// :return An array with unique values.
    class func uniq<T : Hashable>(array: [T]) -> [T] {
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        for elem in array {
            map[elem] = true
        }
        var result : [T] = []
        for key in map.keys {
            result += key
        }
        return result
    }
    
    /// Creates an array of values of a given dictionary.
    ///
    /// :param dictionary The dictionary to source from.
    /// :return An array of values from the dictionary.
    class func values<T, U>(dictionary: Dictionary<T, U>) -> [U] {
        var result : [U] = []
        for (_, value) in dictionary {
            result.insert(value, atIndex: 0)
        }
        return result
    }
    
    /// Creates an array excluding all provided values.
    ///
    /// :param array The array to source from.
    /// :param values Values to exclude.
    /// :return Array excluding provided values.
    class func without<T : Equatable>(array: [T], values: T...) -> [T] {
        return self.pull(array, values: values)
    }
    
    /// Creates an array that is the symmetric difference of the provided arrays.
    ///
    /// :param arrays The arrays to perform xor on in order.
    /// :return Resulting array after performing xor.
    class func xor<T : Hashable>(arrays: [T]...) -> [T] {
        var map : Dictionary<T, Bool> = Dictionary<T, Bool>()
        for arr in arrays {
            for elem in arr {
                map[elem] = !map[elem]
            }
        }
        var result : [T] = []
        for (key, value) in map {
            if value {
                result += key
            }
        }
        return result
    }
    
    /// Creates an object composed from arrays of keys and values.
    ///
    /// :param keys The array of keys.
    /// :param values The array of values.
    /// :return Dictionary based on the keys and values passed in order.
    class func zipObject<T, E>(keys: [T], values: [E]) -> Dictionary<T, E> {
        var result = Dictionary<T, E>()
        for (index, key) in enumerate(keys) {
            result[key] = values[index]
        }
        
        return result
    }
    
    /// Lazy namespace
    class lazy{
        /// Creates Iterator for performing action on collection
        ///
        /// :param array The collection to evaluate
        /// :param function Closure to perform on each element
        /// :return Iterator for performing lazy evaluation on collection
        class func map(array: [AnyObject], function: (AnyObject) -> AnyObject) -> $.Iterator{
            return $.Iterator(array: array, function: function);
        }
    }
    
    /// Dollar.Iterator for lazy evalution
    class Iterator{
        var index:Int = 0
        var action:(AnyObject) -> AnyObject
        var $:Dollar
        
        init(array:[AnyObject], function:(AnyObject) -> AnyObject){
            $ = Dollar(array: array);
            action = function;
        }
        
        /// Invokes action on current object then increments
        ///
        /// :return Value of evaluation. Nil if no more elements in collection
        func next() -> AnyObject?{
            if(!self.hasNext()) { return nil; }
            
            let element: AnyObject = $.resultArray[index++]
            return action(element);
        }
        
        /// Decrements then invokes action on object
        ///
        /// :return Value of evaluation. Nil if  at beginning of collection or if collection is empty
        func previous() -> AnyObject?{
            if(!self.hasPrevious()) { return nil; }
            
            let element: AnyObject = $.resultArray[--index];
            return action(element);
        }
        
        /// Continous invocation incremental
        ///
        /// :return Value of evaluation
        func cycle() -> AnyObject?{
            if(!self.hasNext()) { self.toFirstObject() }
            return action($.resultArray[index++]);
        }
        
        /// Continuous invocation decremental
        ///
        /// :return Value of evaluation
        func cycleBackward() -> AnyObject?{
            if(!self.hasPrevious()) { self.endIterator() }
            return self.previous();
        }
        
        /// Moves position of incrementor to begnning of collection
        func toFirstObject(){
            index = 0;
        }
        
        
        func toLastObject(){
            index = $.resultArray.count-1;
        }
        
        /// Moves position of incremento to end of collection
        func endIterator(){
            index = $.resultArray.count;
        }
        
        /// Check if there are anymore elements in collection to evaluate
        func hasNext() -> Bool{
            return index < $.resultArray.count;
        }
        
        /// :False if at the beginning of collection or collection is empty
        func hasPrevious() -> Bool{
            return index != 0 && !$.resultArray.isEmpty
        }
        
        /// :return Number of objects in collection left to evaluate
        func countNext() -> Int{
            return $.resultArray.count - index
        }
        
        func countPrevious() -> Int{
            return index;
        }
    }
}

typealias $ = Dollar