Dollar.swift [![Build Status](https://travis-ci.org/ankurp/Dollar.swift.svg?branch=master)](https://travis-ci.org/ankurp/Dollar.swift)
===========

$ is a Swift library that provides useful functional programming helper methods without extending any built in objects.


### Setup
Include the `Dollar.swift` into your project and import the library using `import Dollar`

Currently there are issues loading the library using `pod 'Dollar', '~> 0.1'`

### Contributing
If you are interested in contributing

1. Please fork this project
2. Implement new methods or changes in the `Dollar.swift` file in the Classes folder
3. Write tests in `DollarTests.swift` file in the DollarTests folder
4. Submit a pull request.

### Array Helper Methods

* $.first
* $.compact
* $.contains
* $.difference
* $.findIndex
* $.findLastIndex
* $.flatten
* $.frequencies
* $.indexOf
* $.initial
* $.intersection
* $.last
* $.lastIndexOf
* $.rest
* $.noop
* $.pull
* $.range
* $.remove
* $.sortedIndex
* $.union
* $.uniq
* $.without
* $.xor
* $.zip
* $.zipObject

### Collection Helper Methods
* $.at
* $.every
* $.find
* $.min
* $.max
* $.pluck

### Roadmap

More functions will be added and then ability to chain operations and lazily evaluation of chained expressions.

###Usage

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
