Dollar.$wift [![Build Status](https://travis-ci.org/ankurp/Dollar.swift.svg?branch=master)](https://travis-ci.org/ankurp/Dollar.swift)
===========

Dollar is a Swift library that provides useful functional programming helper methods without extending any built in objects. It is similar to Lo-Dash or Underscore in Javascript.

<div style="text-align:center;"><img src="http://i.imgur.com/zb88jFU.png" alt="Introducing Swift"></div>

## Contents ##

- [Setup](#setup)
- [Usage](#usage)
  - [Array](#array-methods)
  - [Dictionary](#dictionary-methods)
  - [Object](#object-methods)
  - [Function](#function-methods)
  - [Chaining](#chaining)
- [Examples](#examples)
  - [Array](#array)
  - [Dictionary](#dictionary)
  - [Object](#object)
  - [Function](#function)
  - [Chaining](#chaining---array-)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [Why?](#why-not-extend-collection)

## Setup ##
Include the `Dollar.swift` into your project and import the library using `import Dollar`

Currently there are issues loading the library using `pod 'Dollar', '~> 0.2'`

## Usage ##

### Array Methods ###

Method | Usage
---- | ---------
**`$.at`**|Creates an array of elements from the specified indexes, or keys, of the collection. Indexes may be specified as individual arguments or as arrays of indexes.
**`$.compact`**|Creates an array with all nil values removed.
**`$.contains`**|Checks if a given value is present in the array.
**`$.difference`**|Creates an array excluding all values of the provided arrays
**`$.every`**|Checks if the given callback returns true value for all items in the array.
**`$.find`**|Iterates over elements of an array and returning the first element that the callback returns true for.
**`$.findIndex`**|This method is like find except that it returns the index of the first element that passes the callback check.
**`$.findLastIndex`**|This method is like findIndex except that it iterates over elements of the array from right to left.
**`$.first`**|Gets the first element in the array.
**`$.flatten`**|Flattens a nested array of any depth.
**`$.frequencies`**|This method returns a dictionary of values in an array mapping to the total number of occurrences in the array. If passed a function it returns a frequency table of the results of the given function on the arrays elements.
**`$.indexOf`**|Gets the index at which the first occurrence of value is found.
**`$.initial`**|Gets all but the last element or last n elements of an array.
**`$.intersection`**|Creates an array of unique values present in all provided arrays.
**`$.join`**|Joins the elements in the array to create a concatenated element of the same type.
**`$.last`**|Gets the last element from the array.
**`$.lastIndexOf`**|Gets the index at which the last occurrence of value is found.
**`$.rest`**|The opposite of initial this method gets all but the first element or first n elements of an array.
**`$.noop`**|A no-operation function.
**`$.max`**|Retrieves the maximum value in an array.
**`$.merge`**|Creates an array of all values, including duplicates, of the arrays in the order they are provided.
**`$.min`**|Retrieves the minimum value in an array.
**`$.pluck`**|Retrieves the value of a specified property from all elements in the array.
**`$.pull`**|Removes all provided values from the given array.
**`$.range`**|Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
**`$.sequence`**|Creates an array of an arbitrary sequence. Especially useful with builtin ranges.
**`$.remove`**|Removes all elements from an array that the callback returns true.
**`$.slice`**|Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.
**`$.sortedIndex`**|Gives the smallest index at which a value should be inserted into a given the array is sorted.
**`$.union`**|Creates an array of unique values, in order, of the provided arrays.
**`$.uniq`**|Creates a duplicate-value-free version of an array.
**`$.without`**|Creates an array excluding all provided values.
**`$.xor`**|Creates an array that is the symmetric difference of the provided arrays.
**`$.zip`**|Creates an array of grouped elements, the first of which contains the first elements of the given arrays.
**`$.zipObject`**|Creates an object composed from arrays of keys and values.
**`$.partition`**|Produces an array of arrays, each containing n elements, each offset by step. Stops after a partition is less than n length.
**`$.partitionAll`**|Produces an array of arrays, each containing n elements, each offset by step. Continues after a partition is less than n length.
**`$.partitionBy`**|Applies a function to each element in array, splitting it each time the function returns a new value.


### Dictionary Methods ###

Method | Usage
---- | ---------
**`$.keys`**|Creates an array of keys given a dictionary.
**`$.values`**|Creates an array of values given a dictionary
**`$.merge`**|Merges all of the dictionaries together and the latter dictionary overrides the value at a given key
**`$.pick`**|Creates a shallow clone of a dictionary composed of the specified keys.
**`$.omit`**|Creates a shallow clone of a dictionary excluding the specified keys.

### Object Methods ###

Method | Usage
---- | ---------
**`$.tap`**|Invokes interceptor with the object and then returns object.

### Function Methods ###

Method | Usage
---- | ---------
**`$.after`**|Creates a function that executes passed function only after being called n times.
**`$.bind`**|Creates a function that, when called, invokes func with the binding of arguments provided.
**`$.id`**|The identify function which simply returns the argument its given.
**`$.partial`**|Creates a function that, when called, invokes func with any additional partial arguments prepended to those provided to the new function.
**`$.times`**|Call a function n times and also passes the index. If a value is returned in the function then the times method will return an array of those values.

### Chaining ###

**`$(array: ...)`**

Method | Usage
---- | ---------
**`any`**|Returns true if callback function returns true for at least one element in the array
**`all`**|Returns true if callback function returns true for all elements in the array
**`each`**|Passes each element value to the callback function
**`filter`**|Filters the arrary to elements for which the callback function returns true
**`first`**|Returns the first element in the array and terminated the chain
**`flatten`**|Flattens a nested array of any depth.
**`initial`**|Gets all but the last element or last n elements of an array.
**`map`**|Maps each element to the new value returned in the callback function
**`slice`**|Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.
**`value`**|Returns the array after applying all of the chained operators on it.

## Examples ##

### Array ###

### at - `$.at`

Creates an array of elements from the specified indexes, or keys, of the collection. Indexes may be specified as individual arguments or as arrays of indexes.

```swift
$.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4) 
=> ["ant", "cat", "egg"]
```

### compact - `$.compact`

Creates an array with all nil values removed.

```swift
$.compact([3, nil, 4, 5]) 
=> [3, 4, 5]

$.compact([nil, nil]) as NSObject[] 
=> []
```

### contains - `$.contains`

Checks if a given value is present in the array.

```swift
$.contains([1, 2, 3, 1, 2, 3], value: 2) 
=> true

$.contains([1, 2, 3, 1, 2, 3], value: 10) 
=> false
```

### difference - `$.difference`

Creates an array excluding all values of the provided arrays

```swift
$.difference([1, 2, 3, 4, 5], [5, 2, 10]) 
=> [1, 3, 4]
```


### every - `$.every`

Checks if the given callback returns true value for all items in the array.

```swift
$.every([1, 2, 3, 4], iterator: { $0 < 20 }) 
=> true

$.every([1, 2, 3, 4]) { $0 == 1 } 
=> false
```

### find - `$.find`

Iterates over elements of an array and returning the first element that the callback returns true for.

```swift
$.find([1, 2, 3, 4], iterator: { $0 == 2 }) 
=> 2

$.find([1, 2, 3, 4]) { $0 == 10 } 
=> nil
```

### findIndex - `$.findIndex`

This method is like find except that it returns the index of the first element that passes the callback check.

```swift
let arr = [["age": 36], ["age": 40], ["age": 1]]
let result = $.findIndex(arr) { $0["age"] < 20 }
result 
=> 2
```

### findLastIndex - `$.findLastIndex`

This method is like findIndex except that it iterates over elements of the array from right to left.

```swift
let arr = [["age": 36], ["age": 40], ["age": 1]]
let result = $.findLastIndex(arr) { $0["age"] > 30 }
result
=> 1
```

### first - `$.first(array: AnyObject[])`

Gets the first element in the array.

```swift
$.first([1, 2, 3, 4])
=> 1

$.first([]) 
=> nil
```

### flatten - `$.flatten`

Flattens a nested array of any depth.

```swift
$.flatten([[3], 4, 5]) as Int[] 
=> [3, 4, 5]

$.flatten([[3], "Hello", 5]) as NSObject[] 
=> [3, "Hello", 5]

$.flatten([[[3], 4], 5]) as Int[] 
=> [3, 4, 5]
```

### frequencies - `$.frequencies`
This method returns a dictionary of values in an array mapping to the total number of occurrences in the array. If passed a function it returns a frequency table of the results of the given function on the arrays elements.

```swift
$.frequencies(["a", "a", "b", "c", "a", "b"]) 
=> ["a": 3, "b": 2, "c": 1]

$.frequencies([1, 2, 3, 4, 5]) { $0 % 2 == 0 }
=> [false: 3, true: 2]
```

### indexof - `$.indexof`

Gets the index at which the first occurrence of value is found.

```swift
$.indexOf([1, 2, 3, 1, 2, 3], value: 2) 
=> 1

$.indexOf(["A", "B", "C"], value: "B") 
=> 1

$.indexOf([3, 4, 5], value: 5) 
=> 2

$.indexOf([3, 4, 5], value: 3) 
=> 0

$.indexOf([3, 4, 5], value: 2) 
=> nil
```

### initial - `$.initial`

Gets all but the last element or last n elements of an array.

```swift
$.initial([3, 4, 5]) 
=> [3, 4]

$.initial([3, 4, 5], numElements: 2) 
=> [3]
```

### intersection - `$.intersection`

Creates an array of unique values present in all provided arrays.

```swift
$.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]) 
=> [1, 2]
```

### last - `$.last`

Gets the last element from the array.

```swift
$.last([3, 4, 5]) 
=> 5
```

### lastIndexOf - `$.lastIndexOf`

Gets the index at which the last occurrence of value is found.

```swift
$.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2) 
=> 4
```

### rest - `$.rest`

The opposite of initial this method gets all but the first element or first n elements of an array.

```swift
$.rest([3, 4, 5]) 
=> [4, 5]

$.rest([3, 4, 5], numElements: 2) 
=> [5]
```

### noop - `$.noop()`

A no-operation function.

```swift
$.noop() 
=> nil
```

### min - `$.min`

Retrieves the minimum value in an array.

```swift
$.min([2, 1, 2, 3, 4]) 
=> 1
```

### max - `$.max`

Retrieves the maximum value in an array.

```swift
$.max([1, 2, 3, 4, 2, 1]) 
=> 4
```

### memoize - `$.memoize`

```swift
var times = 0 // to test memoization

let fibMemo = $.memoize { (fib: (Int -> Int), val: Int) -> Int in
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

### pluck - `$.pluck`

Retrieves the value of a specified property from all elements in the array.

```swift
let arr : Dictionary<String, Int>[] = [["age": 20], ["age": 30], ["age": 40]]
$.pluck(arr, value: "age") 
=> [20, 30, 40]
```

### pull - `$.pull`

Removes all provided values from the given array.

```swift
$.pull([3, 4, 5, 3, 5], values: 3, 5) 
=> [4]

$.pull([3, 4, 5, 3, 5], values: 4) 
=> [3, 5, 3, 5]

$.pull([3, 4, 5, 3, 5], values: 3, 4, 5) 
=> []
```

### range - `$.range`

Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.

```swift
$.range(4) 
=> [0, 1, 2, 3]

$.range(1, endVal: 5) 
=> [1, 2, 3, 4]

$.range(0, endVal: 20, incrementBy: 5) 
=> [0, 5, 10, 15]
```

### sample - `$.sample`
```
let arr : Int[] = [2, 1, 2, 3, 4]
$.contains(arr, value: $.sample(arr))
=> true
```

### sequence - `$.sequence`

Creates an array of an arbitrary sequence. Especially useful with builtin ranges.

```swift
$.sequence(0..4) 
=> [0, 1, 2, 3]

$.sequence(-2.0..2.0) 
=> [-2.0, -1.0, 0.0, 1.0]

$.sequence((0..20).by(5)) 
=> [0, 5, 10, 15]

$.sequence("abc") 
=> ["a", "b", "c"]
```

### remove - `$.remove`

Removes all elements from an array that the callback returns true.

```swift
let result = $.remove([1, 2, 3, 4, 5, 6]) { $0 == 2 || $0 == 3 }
result
=> [1, 4, 5, 6]
```

### sortedIndex - `$.sortedIndex`

Gives the smallest index at which a value should be inserted into a given the array is sorted.

```swift
$.sortedIndex([3, 4, 6, 10], value: 5)
=> 2

$.sortedIndex([10, 20, 30, 50], value: 40)
=> 3
```

### union - `$.union`

Creates an array of unique values, in order, of the provided arrays.

```swift
$.union([1, 2, 3], [5, 2, 1, 4], [2, 1]) 
=> [1, 2, 3, 4, 5]
```

### merge - `$.merge`

Creates an array of all values, including duplicates, of the arrays in the order they are provided.

```swift
let arr  = [1, 5]
let arr2 = [2, 4]
let arr3 = [5, 6]
let result = $.merge(arrays: arr, arr2, arr3)
result
=> [1, 5, 2, 4, 5, 6]
```

### uniq - `$.uniq`

Creates a duplicate-value-free version of an array.

```swift
$.uniq([1, 2, 1, 3, 1])
=> [1, 2, 3]
```

### without - `$.without`

Creates an array excluding all provided values.

```swift
$.without([3, 4, 5, 3, 5], values: 3, 5)
=> [4]

$.without([3, 4, 5, 3, 5], values: 4)
=> [3, 5, 3, 5]

$.without([3, 4, 5, 3, 5], values: 3, 4, 5)
=> []
```

### xor - `$.xor`

Creates an array that is the symmetric difference of the provided arrays.

```swift
$.xor([1, 2, 3], [5, 2, 1, 4])
=> [3, 4, 5]
```

### zip - `$.zip`

Creates an array of grouped elements, the first of which contains the first elements of the given arrays.

```swift
$.zip(["fred", "barney"], [30, 40], [true, false]) as NSObject[] 
=> [["fred", 30, true], ["barney", 40, false]]
```

### zipObject - `$.zipObject`

Creates an object composed from arrays of keys and values.

```swift
$.zipObject(["fred", "barney"], values: [30, 40]) as Dictionary<String, Int> 
=> ["fred": 30, "barney": 40]
```

### partition - `$.partition`

Produces an array of arrays, each containing n elements, each offset by step. Stops after a partition is less than n length.

```swift
let arr = [1, 2, 3, 4, 5]
$.partition(arr, n: 2)
=> [[1, 2], [3, 4]]

$.partition(arr, n: 4, step: 1)
=> [[1, 2, 3, 4], [2, 3, 4, 5]]

$.partition(arr, n: 4, step: 1, pad: nil)
=> [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5]]

$.partition(arr, n: 4, step: 1, pad: [6, 7, 8])
=> [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6]]
```

### partitionAll - `$.partitionAll`

Produces an array of arrays, each containing n elements, each offset by step. Continues after a partition is less than n length.

```swift
$.partitionAll([1, 2, 3, 4, 5], n:4, step: 1)
=> [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5], [4, 5], [5]]
```

### partitionBy - `$.partitionBy`

Applies a function to each element in array, splitting it each time the function returns a new value.

```swift
$.partitionBy([1, 2, 3, 4, 5]) { $0 % 2 == 0 }
=> [[1], [2, 4], [3, 5], [6]]

$.partitionBy([1, 7, 3, 6, 10, 12]) { $0 % 3 }
=> [[1, 7], [3, 6], [10], [12]]
```

### Dictionary ###

### keys - `$.keys`

Creates an array of keys given a dictionary.

```swift
$.keys(["Dog": 1, "Cat": 2])
=> ["Dog", "Cat"]
```

### values - `$.values`

Creates an array of values given a dictionary

```swift
$.values(["Dog": 1, "Cat": 2])
=> [1, 2]
```

### merge - `$.merge`

Merges all of the dictionaries together and the latter dictionary overrides the value at a given key

```swift
let dict: Dictionary<String, Int> = ["Dog": 1, "Cat": 2]
let dict2: Dictionary<String, Int> = ["Cow": 3]
let dict3: Dictionary<String, Int> = ["Sheep": 4]
$.merge(dict, dictionaries: dict2, dict3)
```

### pick - `$.pick`

Creates a shallow clone of a dictionary composed of the specified keys.

```swift
$.pick(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Dog", "Cow")
```

### omit - `$.omit`

Creates a shallow clone of a dictionary excluding the specified keys.

```swift
$.omit(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Cat", "Dog")
```

### Object ###

### tap - `$.tap`

Invokes interceptor with the object and then returns object.

```swift
var beatle = Car(name: "Fusca")
$.tap(beatle, {$0.name = "Beatle"}).color = "Blue"
```

### Function ###

### after - `$.after`

Creates a function that executes passed function only after being called n times.

```swift
var saves = ["profile", "settings"];
let asyncSave = { (function: () -> ()?) in
   function() // Saving right away for testing but in real world would be async
}
var isDone = false
var completeCallback = $.after(saves.count) {
   isDone = true
}
for elem in saves {
   asyncSave(completeCallback)
}
isDone 
=> true
```

### bind - `$.bind`

Creates a function that, when called, invokes func with the binding of arguments provided.

```swift
let helloWorldFunc = $.bind({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello", "World", "Swift")
helloWorldFunc() 
=> "Hello World from Swift"
```

### id - `$.id`

The identify function which simply returns the argument its given.

```swift
$.id("Hello World from Swift")
=> "Hello World from Swift"
```

### partial - `$.partial`

Creates a function that, when called, invokes func with any additional partial arguments prepended to those provided to the new function.

```swift
let partialFunc = $.partial({(T...) in T[0] + " " + T[1] + " from " + T[2] }, "Hello")
partialFunc("World", "Swift") 
=> "Hello World from Swift"
```

### times - `$.times`

Call a function n times and also passes the index. If a value is returned in the function then the times method will return an array of those values.

```swift
let fun = $.bind({ (names: String...) -> String in
   let people = $.join(names, separator: " from ")
   return "Hello \(people)"
   }, "Ankur", "Swift")
$.times(2, function: fun) as String[] 
=> ["Hello Ankur from Swift", "Hello Ankur from Swift"]
```

### Chaining - `$(array: ...)`
```swift
$(array: [1, 2, 3])

$(array: [1, 2, 3]).first() as Int 
=> 1

$(array: [[1, 2], 3, [[4], 5]]).flatten().initial(2).value() as Int[] 
=> [1, 2, 3]

$(array: [[1, 2], 3, [[4], 5]]).initial().flatten().first() as Int 
=> 1

var chain = $(array: [10, 20, 30, 40, 50])
var elements: Int[] = []
chain.each { elements += $0 as Int }
elements as Int[] 
=> [10, 20, 30, 40, 50]

var chain = $(array: [10, 20, 30, 40, 50])
chain.all { ($0 as Int) < 100 } 
=> true

chain.all { ($0 as Int) < 40 } 
=> false

chain.any { ($0 as Int) < 40 } 
=> true
```

## Contributing ##
If you are interested in contributing

1. Please fork this project
2. Implement new methods or changes in the `Dollar.swift` file in the Classes folder
3. Write tests in `DollarTests.swift` file in the DollarTests folder
4. Submit a pull request.

## Roadmap ##

More functions such as curry function and then ability to lazily evaluate chained expressions.


## Why not extend collection? ##
1. The project doesnt extend or monkey patch the collection using the extension features to keep it purely functional and
2. To not override any methods via extensions if Apple decides to add those methods into the collection class themselves as part of the language update. This could lead to inconsistent behavior for those who use the library and those who don't.
