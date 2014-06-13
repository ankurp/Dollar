Dollar.$wift [![Build Status](https://travis-ci.org/ankurp/Dollar.swift.svg?branch=master)](https://travis-ci.org/ankurp/Dollar.swift)
===========

$ is a Swift library that provides useful functional programming helper methods without extending any built in objects. It is similar to Lo-Dash or Underscore in Javascript.

## Contents ##

- [Setup](#setup)
- [Usage](#usage)
  - [Array](#array-methods)
  - [Dictionary](#dictionary-methods)
  - [Object](#object-methods)
  - [Chaining](#chaining)
- [Examples](#example)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [Why?](#why-not-extend-collection)

## Setup ##
Include the `Dollar.swift` into your project and import the library using `import Dollar`

Currently there are issues loading the library using `pod 'Dollar', '~> 0.2'`

## Usage ##

### Array Methods ###

Name | Usage
---- | ---------
**`$.at`**|Creates an array of elements from the specified indexes, or keys, of the collection. Indexes may be specified as individual arguments or as arrays of indexes.
**`$.first`**|Gets the first element in the array.
**`$.compact`**|Creates an array with all nil values removed.
**`$.contains`**|Checks if a given value is present in the array.
**`$.difference`**|Creates an array excluding all values of the provided arrays
**`$.every`**|Checks if the given callback returns true value for all items in the array.
**`$.find`**|Iterates over elements of an array and returning the first element that the callback returns true for.
**`$.findIndex`**|This method is like find except that it returns the index of the first element that passes the callback check.
**`$.findLastIndex`**|This method is like findIndex except that it iterates over elements of the array from right to left.
**`$.flatten`**|Flattens a nested array of any depth.
**`$.frequencies`**|This method returns a dictionary of values in an array mapping to the total number of occurances in the array.
**`$.indexOf`**|Gets the index at which the first occurrence of value is found.
**`$.initial`**|Gets all but the last element or last n elements of an array.
**`$.intersection`**|Creates an array of unique values present in all provided arrays.
**`$.last`**|Gets the last element from the array.
**`$.lastIndexOf`**|Gets the index at which the last occurrence of value is found.
**`$.rest`**|The opposite of initial this method gets all but the first element or first n elements of an array.
**`$.noop`**|A no-operation function.
**`$.min`**|Retrieves the minimum value in an array.
**`$.max`**|Retrieves the maximum value in an array.
**`$.pluck`**|Retrieves the value of a specified property from all elements in the array.
**`$.pull`**|Removes all provided values from the given array.
**`$.range`**|Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.
**`$.remove`**|Removes all elements from an array that the callback returns true.
**`$.sortedIndex`**|Gives the smallest index at which a value should be inserted into a given the array is sorted.
**`$.union`**|Creates an array of unique values, in order, of the provided arrays.
**`$.uniq`**|Creates a duplicate-value-free version of an array.
**`$.without`**|Creates an array excluding all provided values.
**`$.xor`**|Creates an array that is the symmetric difference of the provided arrays.
**`$.zip`**|Creates an array of grouped elements, the first of which contains the first elements of the given arrays.
**`$.zipObject`**|Creates an object composed from arrays of keys and values.


### Dictionary Methods ###

Name | Usage
---- | ---------
**`$.keys`**|Creates an array of keys given a dictionary.
**`$.values`**|Creates an array of values given a dictionary
**`$.merge`**|Merges all of the dictionaries together and the latter dictionary overrides the value at a given key
**`$.pick`**|Creates a shallow clone of a dictionary composed of the specified keys.
**`$.omit`**|Creates a shallow clone of a dictionary excluding the specified keys.

### Object Methods ###

Name | Usage
---- | ---------
**`$.tap`**|Invokes interceptor with the object and then returns object.

### Chaining ###

**`$(array: ...)`**

Name | Usage
---- | ---------
**`flatten`**|Flattens a nested array of any depth.
**`initial`**|Gets all but the last element or last n elements of an array.
**`first`**|Returns the first element in the array and terminated the chain
**`value`**|Returns the array after applying all of the chained operators on it.

## Examples ##

`$.first([1, 2, 3, 4]) as Double == 1`

`$.first([]) == nil`

`$.noop() == nil`

`$.compact([3, nil, 4, 5]) as NSObject[] == [3, 4, 5]`

`$.compact([nil, nil]) as NSObject[] == []`

`$.flatten([[3], 4, 5]) as Int[] == [3, 4, 5]`

`$.flatten([[3], "Hello", 5]) as NSObject[] == [3, "Hello", 5]`

`$.flatten([[[3], 4], 5]) as Int[] == [3, 4, 5]`

`$.indexOf(["A", "B", "C"], value: "B") == 1`

`$.indexOf([3, 4, 5], value: 5) == 2`

`$.indexOf([3, 4, 5], value: 3) == 0`

`$.indexOf([3, 4, 5], value: 2) == nil`

`$.initial([3, 4, 5]) as Int[] == [3, 4]`

`$.initial([3, 4, 5], numElements: 2) as Int[] == [3]    `

`$.rest([3, 4, 5]) as Int[] == [4, 5]`

`$.rest([3, 4, 5], numElements: 2) as Int[] == [5]`

`$.last([3, 4, 5]) as Int == 5`

```
let arr = [["age": 36], ["age": 40], ["age": 1]]
let result = $.findIndex(arr) { $0["age"] < 20 }
result == 2
```

```
let arr = [["age": 36], ["age": 40], ["age": 1]]
let result = $.findLastIndex(arr) { $0["age"] > 30 }
result == 1
```

`$.indexOf([1, 2, 3, 1, 2, 3], value: 2) == 1`

`$.lastIndexOf([1, 2, 3, 1, 2, 3], value: 2) == 4`

`$.contains([1, 2, 3, 1, 2, 3], value: 2) == true`

`$.contains([1, 2, 3, 1, 2, 3], value: 10) == false``

`$.frequencies(["a", "a", "b", "c", "a", "b"]) == ["a": 3, "b": 2, "c": 1]`

`$.range(4) as Int[] == [0, 1, 2, 3]`

`$.range(1, endVal: 5) as Int[] == [1, 2, 3, 4]`

`$.range(0, endVal: 20, incrementBy: 5) as Int[] == [0, 5, 10, 15]`

```
let result = $.remove([1, 2, 3, 4, 5, 6], iterator: { $0 as Int == 2 || $0 as Int == 3 })
result as Int[] == [1, 4, 5, 6]
```

`$.sortedIndex([3, 4, 6, 10], value: 5) as Int == 2`

`$.sortedIndex([10, 20, 30, 50], value: 40) as Int == 3`

`$.without([3, 4, 5, 3, 5], values: 3, 5) as Int[] == [4]`

`$.without([3, 4, 5, 3, 5], values: 4) as Int[] == [3, 5, 3, 5]`

`$.without([3, 4, 5, 3, 5], values: 3, 4, 5) as Int[] == []`

`$.pull([3, 4, 5, 3, 5], values: 3, 5) as Int[] == [4]`

`$.pull([3, 4, 5, 3, 5], values: 4) as Int[] == [3, 5, 3, 5]`

`$.pull([3, 4, 5, 3, 5], values: 3, 4, 5) as Int[] == []`

`$.zip(["fred", "barney"], [30, 40], [true, false]) as NSObject[] == [["fred", 30, true], ["barney", 40, false]]`

`$.zipObject(["fred", "barney"], values: [30, 40]) as Dictionary<String, Int> == ["fred": 30, "barney": 40]`

`$.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1]) as Int[] == [1, 2]`

`$.difference([1, 2, 3, 4, 5], [5, 2, 10]) as Int[] == [1, 3, 4]`

`$.uniq([1, 2, 1, 3, 1]) as Int[] == [1, 2, 3]`

`$.union([1, 2, 3], [5, 2, 1, 4], [2, 1]) as Int[] == [1, 2, 3, 4, 5]`

`$.xor([1, 2, 3], [5, 2, 1, 4]) as Int[] == [3, 4, 5]`

`$.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4) as String[] == ["ant", "cat", "egg"]`

`$.every([1, 2, 3, 4], iterator: { $0 < 20 }) == true`

`$.every([1, 2, 3, 4], iterator: { $0 == 1 }) == false`

`$.find([1, 2, 3, 4], iterator: { $0 == 2 }) == 2`

`$.find([1, 2, 3, 4], iterator: { $0 == 10 }) == nil`

`$.max([1, 2, 3, 4, 2, 1]) == 4`

`$.min([2, 1, 2, 3, 4]) == 1`

```
let arr : Int[] = [2, 1, 2, 3, 4]
$.contains(arr, value: $.sample(arr) as NSObject)
```

```
let arr : Dictionary<String, Int>[] = [["age": 20], ["age": 30], ["age": 40]]
$.pluck(arr, value: "age") == [20, 30, 40]
```

`$.keys(["Dog": 1, "Cat": 2])`

`$.values(["Dog": 1, "Cat": 2])`

```
let dict: Dictionary<String, Int> = ["Dog": 1, "Cat": 2]
let dict2: Dictionary<String, Int> = ["Cow": 3]
let dict3: Dictionary<String, Int> = ["Sheep": 4]
$.merge(dict, dictionaries: dict2, dict3)
```

`$.pick(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Dog", "Cow")`

`$.omit(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Cat", "Dog")`

```
var beatle = Car(name: "Fusca")
$.tap(beatle, {$0.name = "Beatle"}).color = "Blue"
```

`$(array: [1, 2, 3]).first() as Int == 1`

`$(array: [[1, 2], 3, [[4], 5]]).flatten().initial(2).value() as Int[] == [1, 2, 3]`

`$(array: [[1, 2], 3, [[4], 5]]).initial().flatten().first() as Int == 1`


## Contributing ##
If you are interested in contributing

1. Please fork this project
2. Implement new methods or changes in the `Dollar.swift` file in the Classes folder
3. Write tests in `DollarTests.swift` file in the DollarTests folder
4. Submit a pull request.

## Roadmap ##

More functions will be added and then ability to chain operations and lazily evaluation of chained expressions.


## Why not extend collection? ##
1. The project doesnt extend or monkey patch the collection using the extension features to keep it purely functional and
2. To not override any methods via extensions if Apple decides to add those methods into the collection class themselves as part of the language update. This could lead to inconsistent behavior for those who use the library and those who don't.

