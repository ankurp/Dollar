Dollar [![Build Status](https://travis-ci.org/ankurp/Dollar.svg)](https://travis-ci.org/ankurp/Dollar) ![CocoaPods](https://img.shields.io/cocoapods/v/Dollar.svg) [![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
===========
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ankurp/Dollar?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Dollar is a Swift library that provides useful functional programming helper methods without extending any built in objects. It is similar to [Lo-Dash](https://lodash.com) or [Underscore.js](http://underscorejs.org) in Javascript.

[Cent](https://github.com/ankurp/Cent) is a library that extends certain Swift object types using the extension feature and gives its two cents to Swift language. It is now moved into a separate repo to support `Swift Package Manager`

NOTE: Starting Swift 4 `$` is no longer a valid identifier. So you get the following `error: '$' is not an identifier; use backticks to escape it` . Instead use `Dollar`.

## Contents ##

- [Setup](#setup)
  - [Demo App](#demo-app)
- [API Documentation](http://www.dollarswift.org)
- [Usage](#dollar-usage)
  - [Array](#array)
  - [Dictionary](#dictionary)
  - [Object](#object)
  - [Function](#function)
  - [Chaining](#chaining)
- [Contributing](#contributing)

# Setup #

## Using [cocoapods](http://cocoapods.org/) version 0.36.x or greater

Add `pod 'Dollar'` to your `Podfile` and run `pod install`. Add `use_frameworks!` to the end of the `Podfile`. Also checkout this [sample app](https://github.com/ankurp/DollarPodApp).

## Using [Swift Package Manager](https://github.com/apple/swift-package-manager)

Add the following dependency `.Package(url: "https://github.com/ankurp/Dollar", majorVersion: 7, minor: 1)` to your `Package.swift` file and then run `swift build`. Requires swift version 2.2 or greater that you can install from https://swift.org

## Using `git submodule`

1. If you are using git then add Dollar as a submodule using `git submodule add https://github.com/ankurp/Dollar.git`. If not using git download the project using `git clone https://github.com/ankurp/Dollar.git` in your project folder.
2. Open the `Dollar` folder. Drag Dollar.xcodeproj, inside the Dollar folder, into the file navigator of your Xcode project.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. In the tab bar at the top of that window, open the "Build Phases" panel.
5. Expand the "Link Binary with Libraries" group, and add Dollar.framework.
6. In your project file `import Dollar` and you can call all of the helper functions.

Still stuck. Then checkout this screencast on [how to import](http://recordit.co/0gQiCSEREF)

## Support for Xcode and Swift

* For Xcode 11 (Swift 5.0) use version `9.0.0`
* For Xcode 10 (Swift 4.2) use version `8.0.0`
* For Xcode 9 (Swift 4) use version `7.1.0`
* For Xcode 8 (Swift 3) use version `6.0.0`
* For Xcode 7 (Swift 2) use version `4.1.0` or `5.2.0`
* For Xcode 6.3 (Swift 1.2) use version `3.0.3`
* For Xcode 6.1 and 6.2 (Swift 1.1) use version `2.2.0`

## Demo Apps ##

* Using [`Cocoa Pods`](https://github.com/ankurp/DollarPodApp)
* Using [`Swift Package Manager`](https://github.com/ankurp/DollarSwiftPackage)
* Using [`git submodule`](https://github.com/ankurp/DollarSubmoduleApp)

## Communication ##

- If you **need help**, use [gitter.im](https://gitter.im/ankurp/Dollar) or post a question on [Stack Overflow](http://stackoverflow.com/questions/tagged/dollar.swift) with tag `dollar.swift`.
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/dollar.swift).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

# Dollar Usage #

## Array ##

### at - `Dollar.at`

Creates an array of elements from the specified indexes, or keys, of the collection. Indexes may be specified as individual arguments or as arrays of indexes.

```swift
Dollar.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4) 
=> ["ant", "cat", "egg"]
```

### chunk - `Dollar.chunk`

Creates an array of elements split into groups the length of size. If array can’t be split evenly, the final chunk will be the remaining elements.

```swift
Dollar.chunk([1, 2, 3, 4], size: 2)
=> [[1, 2], [3, 4]]

Dollar.chunk([1, 2, 3, 4], size: 3)
=> [[1, 2, 3], [4]]
```

### compact - `Dollar.compact`

Creates an array with all nil values removed.

```swift
Dollar.compact([3, nil, 4, 5]) 
=> [3, 4, 5]

Dollar.compact([nil, nil]) as NSObject[] 
=> []
```

### contains - `Dollar.contains`

Checks if a given value is present in the array.

```swift
Dollar.contains([1, 2, 3, 1, 2, 3], value: 2) 
=> true

Dollar.contains([1, 2, 3, 1, 2, 3], value: 10) 
=> false
```

### cycle - `Dollar.cycle`

Cycles through the array definetly or indefinetly passing each element into the callback function. The second parameter is to specify how many times to cycle through the array. If left out it will cycle indefinetly.

```swift
Dollar.cycle([1, 2, 3], 2) {
  print($0)
}
// Prints the following
123123
```

### difference - `Dollar.difference`

Creates an array excluding all values of the provided arrays

```swift
Dollar.difference([1, 2, 3, 4, 5], [5, 2, 10]) 
=> [1, 3, 4]
```

### each - `Dollar.each`

Passes each element in the array to the callback

```swift
Dollar.each(["A", "B"]) { 
  print("Value \($0)")
}
=> ["A", "B"]

Dollar.each(["A", "B"]) { (index, elem) in
  print("\(index) - \(elem)")
}
=> ["0 - A", "1 - B"]
```

### every - `Dollar.every`

Checks if the given callback returns true value for all items in the array.

```swift
Dollar.every([1, 2, 3, 4], callback: { $0 < 20 }) 
=> true

Dollar.every([1, 2, 3, 4]) { $0 == 1 } 
=> false
```

### factorial `Dollar.factorial`

Returns factorial of integer

```swift
Dollar.factorial(3)
=> 6

Dollar.factorial(0)
=> 1
```

### fetch - `Dollar.fetch`

Get element from an array at the given index which can be negative to find elements from the end of the array. A default value can be returned if indexing out of bounds.


```swift
let arr = [1, 2, 3, 4, 5, 6, 7, 8]
Dollar.fetch(arr, 100)
=> nil

Dollar.fetch(arr, 100, orElse: 42)
=> 42

Dollar.fetch(arr, -1)
=> 8
```

### fill - `Dollar.fill`

Fills elements of array with value from start up to, but not including, end. This method mutates array.

```swift
var arr = Array<Int>(count: 5, repeatedValue: 1)
Dollar.fill(&arr, withElem: 42)
=> [42, 42, 42, 42, 42]

var arr = Array<Int>(count: 5, repeatedValue: 1)
Dollar.fill(&arr, withElem: 42, startIndex: 1, endIndex: 3)
=> [1, 42, 42, 42, 1]
```


### find - `Dollar.find`

Iterates over elements of an array and returning the first element that the callback returns true for.

```swift
Dollar.find([1, 2, 3, 4], callback: { $0 == 2 }) 
=> 2

Dollar.find([1, 2, 3, 4]) { $0 == 10 } 
=> nil
```

### findIndex - `Dollar.findIndex`

This method is like find except that it returns the index of the first element that passes the callback check.

```swift
let arr = [["age": 36], ["age": 40], ["age": 1]]
let result = Dollar.findIndex(arr) { $0["age"] < 20 }
result 
=> 2
```

### findLastIndex - `Dollar.findLastIndex`

This method is like findIndex except that it iterates over elements of the array from right to left.

```swift
let arr = [["age": 36], ["age": 40], ["age": 1]]
let result = Dollar.findLastIndex(arr) { $0["age"] > 30 }
result
=> 1
```

### first - `Dollar.first(array: AnyObject[])`

Gets the first element in the array.

```swift
Dollar.first([1, 2, 3, 4])
=> 1

Dollar.first([]) 
=> nil
```
### groupBy `Dollar.groupBy`

This method returns a dictionary of values grouped by the value returned by a callback.

``` swift
Dollar.groupBy([1, 2, 3, 4, 5], callback: {$0 % 2})
=> [0: [2, 4], 1: [1, 3]]

Dollar.groupBy(["strings", "with", "different", lengths"], callback: {$0.characters.count})
=> [7: ["strings", "lengths"], 9: ["different"], 4: ["With"]]
```

### second - `Dollar.second(array: AnyObject[])`

Gets the second element in the array.

```swift
Dollar.second([1, 2, 3, 4])
=> 2

Dollar.second([1]) 
=> nil

Dollar.second([])
=> nil
```

### flatMap - `Dollar.flatMap`

Maps a function that converts elements to a list and then concatenates them.

```swift
let values = [2, 3, 4, 5, 6, 7]
Dollar.flatMap(values) { [$0, $0] }
=> [2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7]
```

### flatMap - `Dollar.flatMap`

Maps a function that converts a type to an Optional over an Optional, and then returns a single-level Optional.


```swift
let url = NSURL(string: "https://apple.com/swift")
Dollar.flatMap(url) { $0.lastPathComponent }
=> Optional("swift")
```

*Note*: This is the same behavior as Optional chaining.
The code above translates to
```swift
NSURL(string: "https://apple.com/swift/")?.lastPathComponent
=> Optional("swift")
```

### flatten - `Dollar.flatten`

Flattens a nested array of any depth.

```swift
Dollar.flatten([[3], 4, 5]) as Int[] 
=> [3, 4, 5]

Dollar.flatten([[3], "Hello", 5]) as NSObject[] 
=> [3, "Hello", 5]

Dollar.flatten([[[3], 4], 5]) as Int[] 
=> [3, 4, 5]
```

### frequencies - `Dollar.frequencies`
This method returns a dictionary of values in an array mapping to the total number of occurrences in the array. If passed a function it returns a frequency table of the results of the given function on the arrays elements.

```swift
Dollar.frequencies(["a", "a", "b", "c", "a", "b"]) 
=> ["a": 3, "b": 2, "c": 1]

Dollar.frequencies([1, 2, 3, 4, 5]) { $0 % 2 == 0 }
=> [false: 3, true: 2]
```

### gcd `Dollar.gcd`

GCD function return greatest common denominator with number passed

```swift
Dollar.gcd(3, 10)
=> 1

Dollar.gcd(3, 9)
=> 3
```

### indexOf - `Dollar.indexOf`

Gets the index at which the first occurrence of value is found.

```swift
Dollar.indexOf([1, 2, 3, 1, 2, 3], value: 2) 
=> 1

Dollar.indexOf(["A", "B", "C"], value: "B") 
=> 1

Dollar.indexOf([3, 4, 5], value: 5) 
=> 2

Dollar.indexOf([3, 4, 5], value: 3) 
=> 0

Dollar.indexOf([3, 4, 5], value: 2) 
=> nil
```

### initial - `Dollar.initial`

Gets all but the last element or last n elements of an array.

```swift
Dollar.initial([3, 4, 5]) 
=> [3, 4]

Dollar.initial([3, 4, 5], numElements: 2) 
=> [3]
```

### intersection - `Dollar.intersection`

Creates an array of unique values present in all provided arrays.

```swift
Dollar.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]) 
=> [1, 2]
```

### it-isIn `Dollar.it<T: Comparable>(i: T, isIn range: Range<T>)`

Returns true if i is in interval or range

```swift
Dollar.it("c", isIn: "a"..."z")
=> true

Dollar.it("z", isIn: "a"..<"z")
=> false

Dollar.it(1, isIn: -1.0...10.0)
=> true
```

### last - `Dollar.last`

Gets the last element from the array.

```swift
Dollar.last([3, 4, 5]) 
=> 5
```

### lastIndexOf - `Dollar.lastIndexOf`

Gets the index at which the last occurrence of value is found.

```swift
Dollar.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2) 
=> 4
```

### lcm `Dollar.lcm`

LCM method return least common multiple with number passed

```swift
Dollar.lcm(3, 10)
=> 30

Dollar.lcm(3, 9)
=> 9
```

### rest - `Dollar.rest`

The opposite of initial this method gets all but the first element or first n elements of an array.

```swift
Dollar.rest([3, 4, 5]) 
=> [4, 5]

Dollar.rest([3, 4, 5], numElements: 2) 
=> [5]
```

### map - `Dollar.map`

Maps each element to new value based on the map function passed

```swift
Dollar.map([1, 2, 3, 4]) { 
  $0 * 2
}
=> [2, 4, 6, 8]
```

### min - `Dollar.min`

Retrieves the minimum value in an array.

```swift
Dollar.min([2, 1, 2, 3, 4]) 
=> 1
```

### max - `Dollar.max`

Retrieves the maximum value in an array.

```swift
Dollar.max([1, 2, 3, 4, 2, 1]) 
=> 4
```

### pluck - `Dollar.pluck`

Retrieves the value of a specified property from all elements in the array.

```swift
let arr = [["age": 20], ["age": 30], ["age": 40]]
Dollar.pluck(arr, value: "age") 
=> [20, 30, 40]
```

### pull - `Dollar.pull`

Removes all provided values from the given array.

```swift
Dollar.pull([3, 4, 5, 3, 5], values: 3, 5) 
=> [4]

Dollar.pull([3, 4, 5, 3, 5], values: 4) 
=> [3, 5, 3, 5]

Dollar.pull([3, 4, 5, 3, 5], values: 3, 4, 5) 
=> []
```

### pullAt - `Dollar.pullAt`

Removes all provided values from the given array at the given indices

```swift
let arr = [10, 20, 30, 40, 50]
Dollar.pullAt(arr, indices: 1, 2, 3)
```

### range - `Dollar.range`

Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.

```swift
Dollar.range(4) 
=> [0, 1, 2, 3]

Dollar.range(from: 1, to: 5) 
=> [1, 2, 3, 4]

Dollar.range(from: 0, to: 20, incrementBy: 5) 
=> [0, 5, 10, 15]

Dollar.range(from: 1, through: 5)
=> [1, 2, 3, 4, 5]

Dollar.range(from: 0, through: 20, incrementBy: 5)
=> [0, 5, 10, 15, 20]
```

### reduce - `Dollar.reduce`

Reduce function that will resolve to one value after performing combine function on all elements

```swift
Dollar.reduce([1, 2, 3], initial: 0) { (total, element) in
    total + element
}
=> 6
```

### sample - `Dollar.sample`

Returns a sample item from the array

```swift
let arr : Int[] = [2, 1, 2, 3, 4]
Dollar.contains(arr, value: Dollar.sample(arr))
=> true
```

### sequence - `Dollar.sequence`

Creates an array of an arbitrary sequence. Especially useful with builtin ranges.

```swift
Dollar.sequence(0..4) 
=> [0, 1, 2, 3]

Dollar.sequence(-2.0..2.0) 
=> [-2.0, -1.0, 0.0, 1.0]

Dollar.sequence((0..20).by(5)) 
=> [0, 5, 10, 15]

Dollar.sequence("abc") 
=> ["a", "b", "c"]
```
### remove - `Dollar.remove`

Removes an element from array.
```swift
Dollar.remove(["A", "B", "C", "D"], value: "B")
=> ["A", "C", "D"]
```

### remove - `Dollar.remove`

Removes all elements from an array that the `callback` returns true.

```swift
let result = Dollar.remove([1, 2, 3, 4, 5, 6]) { 
  $0 == 2 || $0 == 3 
}
result
=> [1, 4, 5, 6]
```

### shuffle - `Dollar.shuffle`

Shuffles and returns the new shuffled array

```swift
let result = Dollar.shuffle([1, 2, 3, 4, 5, 6])
result
=> [4, 1, 3, 5, 6, 2]
```

### size - `Dollar.size`

Returns size of the array

```swift
Dollar.size(["a", "b", "c")
=> 3
```

### sortedIndex - `Dollar.sortedIndex`

Gives the smallest index at which a value should be inserted into a given the array is sorted.

```swift
Dollar.sortedIndex([3, 4, 6, 10], value: 5)
=> 2

Dollar.sortedIndex([10, 20, 30, 50], value: 40)
=> 3
```

### transpose - `Dollar.transpose`

Creates a tranposed matrix.

```swift
Dollar.transpose([[1, 2, 3], [4, 5, 6]])
=> [[1, 4], [2, 5], [3, 6]]
```

### union - `Dollar.union`

Creates an array of unique values, in order, of the provided arrays.

```swift
Dollar.union([1, 2, 3], [5, 2, 1, 4], [2, 1]) 
=> [1, 2, 3, 5, 4]
```

### merge - `Dollar.merge`

Creates an array of all values, including duplicates, of the arrays in the order they are provided.

```swift
let arr  = [1, 5]
let arr2 = [2, 4]
let arr3 = [5, 6]
let result = Dollar.merge(arr, arr2, arr3)
result
=> [1, 5, 2, 4, 5, 6]
```

### uniq - `Dollar.uniq`

Creates a duplicate-value-free version of an array.

```swift
Dollar.uniq([1, 2, 1, 3, 1])
=> [1, 2, 3]

Dollar.uniq([1, 2.5, 3, 1.5, 2, 3.5]) {
  floor($0)
}
=> [1, 2.5, 3]
```

### without - `Dollar.without`

Creates an array excluding all provided values.

```swift
Dollar.without([3, 4, 5, 3, 5], values: 3, 5)
=> [4]

Dollar.without([3, 4, 5, 3, 5], values: 4)
=> [3, 5, 3, 5]

Dollar.without([3, 4, 5, 3, 5], values: 3, 4, 5)
=> []
```

### xor - `Dollar.xor`

Creates an array that is the symmetric difference of the provided arrays.

```swift
Dollar.xor([1, 2, 3], [5, 2, 1, 4])
=> [3, 4, 5]
```

### zip - `Dollar.zip`

Creates an array of grouped elements, the first of which contains the first elements of the given arrays.

```swift
Dollar.zip(["fred", "barney"], [30, 40], [true, false]) as [NSObject] 
=> [["fred", 30, true], ["barney", 40, false]]
```

### zipObject - `Dollar.zipObject`

Creates an object composed from arrays of keys and values.

```swift
Dollar.zipObject(["fred", "barney"], values: [30, 40])
=> ["fred": 30, "barney": 40]
```

### partition - `Dollar.partition`

Produces an array of arrays, each containing n elements, each offset by step. Stops after a partition is less than n length.

```swift
let arr = [1, 2, 3, 4, 5]
Dollar.partition(arr, n: 2)
=> [[1, 2], [3, 4]]

Dollar.partition(arr, n: 4, step: 1)
=> [[1, 2, 3, 4], [2, 3, 4, 5]]

Dollar.partition(arr, n: 4, step: 1, pad: nil)
=> [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5]]

Dollar.partition(arr, n: 4, step: 1, pad: [6, 7, 8])
=> [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6]]
```

### partitionAll - `Dollar.partitionAll`

Produces an array of arrays, each containing n elements, each offset by step. Continues after a partition is less than n length.

```swift
Dollar.partitionAll([1, 2, 3, 4, 5], n:4, step: 1)
=> [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5], [4, 5], [5]]
```

### partitionBy - `Dollar.partitionBy`

Applies a function to each element in array, splitting it each time the function returns a new value.

```swift
Dollar.partitionBy([1, 2, 3, 4, 5]) { $0 % 2 == 0 }
=> [[1], [2, 4], [3, 5], [6]]

Dollar.partitionBy([1, 7, 3, 6, 10, 12]) { $0 % 3 }
=> [[1, 7], [3, 6], [10], [12]]
```

## Dictionary ##

### keys - `Dollar.keys`

Creates an array of keys given a dictionary.

```swift
Dollar.keys(["Dog": 1, "Cat": 2])
=> ["Dog", "Cat"]
```

### values - `Dollar.values`

Creates an array of values given a dictionary

```swift
Dollar.values(["Dog": 1, "Cat": 2])
=> [1, 2]
```

### merge - `Dollar.merge`

Merges all of the dictionaries together and the latter dictionary overrides the value at a given key

```swift
let dict: Dictionary<String, Int> = ["Dog": 1, "Cat": 2]
let dict2: Dictionary<String, Int> = ["Cow": 3]
let dict3: Dictionary<String, Int> = ["Sheep": 4]
Dollar.merge(dict, dict2, dict3)
=> ["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4]
```

### pick - `Dollar.pick`

Creates a shallow clone of a dictionary composed of the specified keys.

```swift
Dollar.pick(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Dog", "Cow")
=> ["Dog": 1, "Cow": 3]
```

### omit - `Dollar.omit`

Creates a shallow clone of a dictionary excluding the specified keys.

```swift
Dollar.omit(["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4], keys: "Cat", "Dog")
=> ["Cow": 3, "Sheep": 4]
```

## Object ##

### tap - `Dollar.tap`

Invokes interceptor with the object and then returns object.

```swift
var beatle = Car(name: "Fusca")
Dollar.tap(beatle, {$0.name = "Beatle"}).color = "Blue"
```

## Function ##

### after - `Dollar.after`

Creates a function that executes passed function only after being called n times.

```swift
var saves = ["profile", "settings"];
let asyncSave = { (function: () -> ()?) in
   function() 
   // Saving right away for testing 
   // but in real world would be async
}
var isDone = false
var completeCallback = Dollar.after(saves.count) {
   isDone = true
}
for elem in saves {
   asyncSave(completeCallback)
}
isDone 
=> true
```

### bind - `Dollar.bind`

Creates a function that, when called, invokes func with the binding of arguments provided.

```swift
var helloWorldFunc = Dollar.bind({(T...) in
  T[0] + " " + T[1] + " from " + T[2] 
}, "Hello", "World", "Swift")
helloWorldFunc() 
=> "Hello World from Swift"

helloWorldFunc = Dollar.bind({ $0 + " World" }, "Hello")
helloWorldFunc()
=> "Hello World"

helloWorldFunc = Dollar.bind({ $0 + $1 + " World" }, "Hello ", "Great")
helloWorldFunc()
=> "Hello Great World"
```

### compose - `Dollar.compose`

Compose two or more functions where the return value of the first function is passed into the next function. Useful when chaining functions and returns a function that can be called with variadic argument values or an array of values as input

```swift
let double = { (params: Int...) -> [Int] in
  return Dollar.map(params) { $0 * 2 }
}
let subtractTen = { (params: Int...) -> [Int] in
  return Dollar.map(params) { $0 - 10 }
}
let doubleSubtractTen = Dollar.compose(double, subtractTen)
doubleSubtractTen(5, 6, 7)
=> [0, 2, 4]

let f = Dollar.compose({ (arr: [Int]) -> [Int] in
  Dollar.map(arr) { $0 + 1 }
}, { (arr: [Int]) -> [Int] in
  Dollar.map(arr) { $0 * 2 }
})
f([1, 2])
=> [4, 6]
```

### curry - `Dollar.curry`

Returns a function which when invoked either executes the function returning its result, if all function arguments have been provided, or returns another function that accepts one more argument of the remaining function arguments until all arguments are supplied. This is useful for making partial function as seen in these examples.

```swift
func adder(x: Int, y: Int, z: Int) -> Int {
return x + y + z
}

let curriedAdder = Dollar.curry(adder)
let addTenAnd = curriedAdder(10)
let addThirtyAnd = addTenAnd(20)
addThirtyAnd(1)
=> 31

addThirtyAnd(50)
=> 80

addTenAnd(10)(10)
=> 30
```

### id - `Dollar.id`

The identify function which simply returns the argument its given.

```swift
Dollar.id("Hello World from Swift")
=> "Hello World from Swift"
```

### memoize - `Dollar.memoize`

Returns a memoized function to improve performance by caching recursive function values.

```swift
var times = 0 // to test memoization

let fibMemo = Dollar.memoize { (fib: (Int -> Int), val: Int) -> Int in
  times += 1
  return val == 1 || val == 0 ? 1 : fib(val - 1) + fib(val - 2)
}

let x = fibMemo(5)
times
=> 6

times = 0
let y = fibMemo(5)
times
=> 0

times = 0
let z = fibMemo(6)
times
=> 1
```

### noop - `Dollar.noop`

A no-operation function.

```swift
Dollar.noop() 
=> nil
```

### now - `Dollar.now`

Gets the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).

```swift
Dollar.now() 
=> 1431911564.292577
```

### once - `Dollar.once`

Get a wrapper function that executes the passed function only once. Useful for getting shared config or creating singleton objects.

```swift
func createConfig() -> [String: String] {
  var i = 1
  return [
    "App ID": "\(i++)",
    "URL": "https://someurl"
  ]
}

let getConfig = Dollar.once(createConfig)
getConfig()
=> ["App ID": "1", "URL": "https://someurl"]

getConfig()
=> ["App ID": "1", "URL": "https://someurl"]
```

### partial - `Dollar.partial`

Creates a function that, when called, invokes func with any additional partial arguments prepended to those provided to the new function.

```swift
let partialFunc = Dollar.partial({(T...) in 
  T[0] + " " + T[1] + " from " + T[2] 
}, "Hello")
partialFunc("World", "Swift") 
=> "Hello World from Swift"
```

### times - `Dollar.times`

Call a function n times and also passes the index. If a value is returned in the function then the times method will return an array of those values.

```swift
let fun = Dollar.bind({ (names: String...) -> String in
   let people = Dollar.join(names, separator: " from ")
   return "Hello \(people)"
   }, "Ankur", "Swift")
Dollar.times(2, function: fun) as String[] 
=> ["Hello Ankur from Swift", "Hello Ankur from Swift"]
```

## Chaining ##

**`Dollar.chain(...)`**

### `any`

Returns true if callback function returns true for at least one element in the array

```swift
var chain = Dollar.chain([1, 2, 3])
chain.any({ ($0 as Int) < 2 })
=> true
```

### `all`

Returns true if callback function returns true for all elements in the array

```swift
var chain = Dollar.chain([1, 2, 3])
chain.all({ ($0 as Int) < 10 })
=> true
```

### `each`

Passes each element value to the callback function

```swift
var chain = Dollar.chain(["Hello", "World"])
var strBuilder = ""
chain.each({ strBuilder += ($0 as String) }).value
strBuilder
=> "HelloWorld"
```

### `filter`

Filters the arrary to elements for which the callback function returns true

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.filter({ ($0 as Int) < 3 }).value
=> [1, 2]
```

### `first`

Returns the first element in the array and terminates the chain

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.first()
=> 1
```

### `second`

Returns the second element in the array and terminates the chain

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.second()
=> 2
```

### `third`

Returns the third element in the array and terminates the chain

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.third()
=> 3
```

### `flatten`

Flattens a nested array of any depth.

```swift
var chain = Dollar.chain([[1, [2]], [3], 4])
chain.flatten().value
=> [1, 2, 3, 4]
```

### `initial`

Gets all but the last element or last n elements of an array.

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.initial(2).value
=> [1, 2]
```

### `map`

Maps each element to the new value returned in the callback function

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.map({ ($0 as Int) * 2 }).value
=> [2, 4, 6, 8]
```

### `size`

Returns size of the array and terminates the chain

```swift
var chain = Dollar.chain([1, 2, 3, 4])
chain.map({ ($0 as Int) * 2 }).size()
=> 4
```

### `slice`

Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.

```swift
var chain = Dollar.chain([1, 2, 3, 4, 5, 6, 7])
chain.slice(2, end: 4).value
=> [3, 4]
```

### `value`

Returns the value after evaluating all callbacks

```swift
var chain = Dollar.chain([1, 2, 3, 4, 5, 6, 7])
chain.value
=> [1, 2, 3, 4, 5, 6, 7]
```

**Chaining more than one method**

```swift
Dollar.chain([[1, 2], 3, [[4], 5]])
  .initial()
  .flatten()
  .first()
=> 1

Dollar.chain([1, 2, 3, 4, 5])
  .filter { $0 % 1 == 0 }
  .map { $0 * 2 }
  .all {$0 < 10}
=> false

Dollar.chain([1, 2, 3, 4, 5])
  .map({ $0 * 2 })
  .flatten()
  .initial(2).value
=> [2, 4, 6]
```

# Cent Usage #

## Array Extensions ##

### `<< elem: Element -> [Element]`

Overloaded operator to append element to an array or append elements from another array into the first array. Return array with the element appended in the end.

```swift
var array = [1, 2, 3]
array << 4
=> [1, 2, 3, 4]
array << [5, 6]
=> [1, 2, 3, 4, 5, 6]
```

### `at(indexes: Int...) -> [Element]`

Creates an array of elements from the specified indexes, or keys, of the collection.

```swift
let array = ["foo", "spam", "bar", "eggs"]
let some = array.at(1, 3)
=> ["spam", "eggs"]
```

### `each(callback: (Element) -> ()) -> [Element]`

For each item in the array invoke the callback by passing the elem

```swift
let array = ["foo", "spam", "bar", "eggs"]
array.each {
  print($0)
}
=> ["foo", "spam", "bar", "eggs"]
```

### `eachWithIndex(callback: (Int, Element) -> ()) -> [Element]`

For each item in the array invoke the callback by passing the elem along with the index

```swift
let array = ["foo", "spam", "bar", "eggs"]
array.each { (index, elem)
  print("\(index) - \(elem)")
}
=> ["foo", "spam", "bar", "eggs"]
```

### `cycle<U>(times: Int, callback: (Element) -> U)`

Cycles through the array definetly or indefinetly passing each element into the callback function. The second parameter is to specify how many times to cycle through the array. If left out it will cycle indefinetly.

```swift
[1, 2, 3].cycle(2) {
  print($0)
}
// Prints the following
123123

[1, 2, 3].cycle {
  print($0)
}
// Cycles in an infinite loop
```

### `every(callback: (Element) -> Bool) -> Bool`

Checks if the given callback returns true value for all items in the array.

```swift
["angry", "hungry"].every { (a: String) -> (Bool) in 
  a.hasSuffix("gry") 
}
=> true
```

### `indexOf<T: Equatable>(value: T) -> Int`

Gets the index at which the first occurrence of value is found.

```swift
let array = ["foo", "spam", "bar", "eggs"]
array.indexOf("spam")
=> 1
array.indexOf("None")
=> nil
```

### `fetch(index: Int, orElse: T? = .None) -> T!`

Get element from an array at the given index which can be negative to find elements from the end of the array. A default value can be returned if indexing out of bounds.


```swift
let arr = [1, 2, 3, 4, 5, 6, 7, 8]
arr.fetch(100)
=> nil

arr.fetch(100, orElse: 42)
=> 42

arr.fetch(-1)
=> 8
```

### `findIndex(callback: (Element) -> Bool) -> Int?`

This method is like find except that it returns the index of the first element that passes the callback check.

```swift
let ind: int? = ["foo", "bar", "spam", "eggs"].findIndex {
  $0.length == 4
}
ind! == 2 
=> true
```

### `findLastIndex(callback: (Element) -> Bool) -> Int?`

This method is like findIndex except that it iterates over elements of the array from right to left.

```swift
let ind: int? = ["foo", "bar", "spam", "eggs"].findLastIndex {
  $0.length == 4 
}
ind! == 3 
=> true
```

### `first() -> Element?`

Gets the first element in the array.

```swift
let first = ["foo", "bar"].first()
=> "foo"
```

### `flatten() -> [Element]`

Flattens a nested array of any depth.

```swift
let unFlattened = ["foo", ["bar"], [["spam"]], [[["eggs"]]] ]
let flattened = unFlattened.flatten() 
=> ["foo", "bar", "spam", "eggs"]
```

### `get(index: Int) -> Element?`

Get element at index

```swift
let element = ["foo", "bar"].get(0)
element!
=> "foo"

let nothing = ["foo", "bar"].get(1000)
=> nil
```

### `initial(numElements: Int? = 1) -> [Element]`

Gets all but the last element or last n elements of an array.

```swift
let initial = ["foo", "bar", "spam"].initial(2) 
=> ["foo"]
```

### `last() -> Element?`

Gets the last element from the array.

```swift
let last = ["foo", "bar"].last() 
=> "bar"
```

### `rest(numElements: Int? = 1) -> [Element]`

The opposite of initial this method gets all but the first element or first n elements of an array.

```swift
let rest = ["foo", "bar", "spam"].rest(2)
=> ["spam"]
```

### `min<T: Comparable>() -> T?`

Retrieves the minimum value in an array.

```swift
let min = [ 0, 1, 2 ].min()
=> 0
```

### `max<T: Comparable>() -> T?`

Retrieves the maximum value in an array.

```swift
let max = [ 0, 1, 2].max()
=> 2
```

### `remove<T: Equatable>(value: T) -> T?`

Remove element from array

```swift
var arr = ["A", "B", "C", "D", "E"]
arr.remove("B")
=> ["A", "C", "D", "E"]
```

### `contains<T:Equatable>(value: T) -> Bool`

Checks if a given value is present in the array.

```swift
var arr = ["A", "B", "C", "D", "E"]
arr.contains("C")
=> true
arr.contains("Z")
=> false
```


## Character Extensions ##

### `"A".description -> String`

Get string description of Character

```swift
let ch: Character = "A"
let str = ch.description
=> "A"
```

### `"A".ord -> Int`

Get int representation of character

```swift
Character("A").ord
=> 65
```


## Date Extensions ##

### `Date.from(#year: Int, month: Int, day: Int) -> NSDate`

Returns a new Date given the year month and day

```swift
let date = Date.from(2014, 1, 1) 
=> "Jan 1, 2014, 12:00 AM"
```

### `Date.from(#unix: Double) -> NSDate`

Returns a new Date given the unix timestamp (timeIntervalSince1970)

```swift
let date = Date.from(unix: 1_388_552_400.0)
=> "Jan 1, 2014, 12:00 AM"
```

### `Date.parse(dateStr: String, format: String = "yyyy-MM-dd") -> NSDate`

Parses the date based on the format and return a new Date

```swift
let parsedDate = Date.parse("2014-01-01", format: "yyyy-MM-dd")
=> "Jan 1, 2014, 12:00 AM"
```

### `Date.unix(date: NSDate = NSDate()) -> Double`

Returns the unix timestamp of the date passed in or the current unix timestamp

```swift
let currentUnix = Date.unix()
=> 1,388,552,400.0

var otherNSDate = Date()
let otherUnix = Date.unix(otherDate)
=> 1,388,552,400.0
```

### `Int.hour.fromNow` et al.

Use the following syntax to calculate dates and times based on the user's current calendar. 

```swift
1.day.ago
=> "Apr 10, 2015, 11:51 AM"
4.hours.fromNow
=> "Apr 11, 2015, 3:51 PM"
```

## Dictionary Extensions ##

### `merge<K, V>(dictionaries: Dictionary<K, V>...)`

Merges the dictionary with dictionaries passed. The latter dictionaries will override values of the keys that are already set

```swift
var dic = ["foo": "bar"] 
let anotherDic = ["foo": "baz", "spam": "eggs"]
dic.merge(anotherDic)
=> ["foo": "baz", "spam": "eggs"]
```

## Int Extensions ##

### `times(callback: (Int) -> ())`

Invoke a callback n times with callback that takes index

```swift
5.times { print("Na") } 
=> "NaNaNaNaNa"
```

### `times (function: () -> ())`

Invoke a callback n times

```swift
5.times { (a: Int) -> () in print("\(a) ") } 
=> 0 1 2 3 4  
```

### `char -> Character`

Get ASCII character from integer

```swift
65.char
=> "A"
```

### `isEven`

Check if int is even

```swift
2.isEven
=> true

1.isEven
=> false
```

### `isOdd`

Check if int is odd

```swift
3.isOdd
=> true

2.isOdd
=> false
```

### `digits() -> [Int]`

Splits the int into array of digits

```swift
4208.digits()
=> [4, 2, 0, 8]
```

### `lcm() -> Int`

LCM method return least common multiple with number passed

```swift
3.lcm(10)
=> 30

3.lcm(9)
=> 9
```

### `gcd() -> Int`

GCD method return greatest common denominator with number passed

```swift
3.gcd(10)
=> 1

3.gcd(9)
=> 3
```

### `random() -> Int`

Returns random number from 0 upto but not including value of integer

```swift
3.random()
=> 2

3.random()
=> 1
```

### `factorial() -> Int`

Returns factorial of integer

```swift
3.factorial()
=> 6

0.factorial()
=> 1
```

### `isIn(interval) -> Bool`

Returns true if i is in interval or range

```swift
5.isIn(1...10)
=> true

10.isIn(1..<10)
=> false
```

### `next() -> Int`

Get the next int

```swift
10.next()
=> 11
```

### `prev() -> Int`

Get the previous int

```swift
10.prev()
=> 9
```

### `upTo(limit: Int, callback: () -> ())`

Invoke the callback from int up to and including limit

```swift
3.upTo(5) {
  print("Hi")
}
Prints "HiHiHi"
```

### `downTo(limit: Int, callback: () -> ())`

Invoke the callback from int down to and including limit

```swift
3.downTo(0) {
  print("Hi")
}
Prints "HiHiHiHi"
```

## String Extensions ##

### `.length`

Get the length of the string

```swift
"Hello".length
=> 5
```

### `.camelCase`

Get the camel case representation of the string

```swift
"__Dollar and cent-- dollarANDCent".camelCase
=> "dollarAndCentDollarAndCent"
```

### `.kebabCase`

Get the kebab case representation of the string

```swift
"__Dollar and cent-- dollarANDCent".kebabCase
=> "dollar-and-cent-dollar-and-cent"
```

### `.snakeCase`

Get the snake case representation of the string

```swift
"__Dollar and cent-- dollarANDCent".snakeCase
=> "dollar_and_cent_dollar_and_cent"
```

### `.startCase`

Get the start case representation of the string

```swift
"__Dollar and cent-- dollarANDCent".startCase
=> "Dollar And Cent Dollar And Cent"
```

### `=~ str: String -> Bool`

Does a regex match of whether regex string on the right is matches the string on the left

```swift
"Dollar" =~ "oll"
=> true
```

### `* n: Int -> String`

Get string concatenated `n` times

```swift
"Hi Swift! " * 3
=> "Hi Swift! Hi Swift! Hi Swift! "
```

### `[i: Int] -> Character?`

Get character at a subscript

```swift
"Hello World"[6] == "W"
=> true

"Hi"[5]
=> nil
```

### `[str: String] -> String?`

Returns the substring based on the first regex match passed in the subscript

```swift
let proj = "Dollar and Cent"
proj["^.+[^and Cent]"]
=> {Some: "Dollar"}
```


### `[r: Range<Int>] -> String`

Get substring using subscript notation and by passing a range

```swift
"Hello World"[0..<5] == "Hello" 
=> true
```

### `indexOf(char: Character) -> Int?`

Get the start index of character

```swift
"hello world".indexOf(Character("o"))!
=> 4
```


### `indexOf(str: String) -> Int?`

Get the start index of string

```swift
"hello world".indexOf("llo")!
=> 2

"hello world".indexOf("illo")
=> nil
```

### `indexOf(pattern: String) -> Int?`

Get the start index of regex pattern inside the string

```swift
"hello world".indexOf(".llo")!
=> 1
```

### `split(delimiter: Character) -> [String]`

Get an array from string split using the delimiter character

```swift
"Hello World".split(" ") 
=> ["Hello", "World"]
```

### `lstrip() -> String`

Get string without leading spaces

```swift
let leadingSpace = "  Hello"
leadingSpace.lstrip()
=> "Hello"
```

### `rstrip() -> String`

Get string without trailing spaces

```swift
let trailingSpace = "Hello   "
trailingSpace.rstrip()
=> "Hello"
```

### `strip() -> String`

Get string without leading or trailing spaces

```swift
let spaces = "   Hello   "
spaces.strip()
=> "Hello"
```

## Regex ##

### `init`

Init with regex pattern as string

```swift
Regex.init("^Hello.World$") // Regex that matches "Hello World"
```

### `matches(testStr: String) -> [AnyObject]`

Return matches based on String passed.

```swift
let re = Regex.init("^Hello.World$")
re.matches("Hello World")
```

### `test(testStr: String) -> Bool`

```swift
let re = Regex.init("^Hello.World$")
re.test("Hello World")
=> true

re.test("Str")
=> false
```

### `escapeStr(str: String) -> String`

Escape string with regex characters

```swift
Regex.escape("Hello.World")
=> "Hello\.World"
```

## Range Extensions ##

### equals - `==`

Check the equality of two ranges

```swift
(1...5) == (1...5) 
=> true

(1..<5) == (1...5) 
=> false
```

### `eachWithIndex(callback: (T) -> ())`

For each index in the range invoke the callback by passing the item in range

```swift
(1...5).eachWithIndex { (a: Int) -> () in print("\(a)") } 
=> 12345
```

### `each(callback: () -> ())`

For each index in the range invoke the callback

```swift
(1...5).each { print("Na") } 
=> "NaNaNaNaNa"
```

# Contributing #
If you are interested in contributing checkout [CONTRIBUTING.md](https://github.com/ankurp/Dollar/blob/master/CONTRIBUTING.md)
