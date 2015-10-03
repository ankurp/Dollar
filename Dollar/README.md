# Dollar Usage #

## Array ##

### at - `$.at`

Creates an array of elements from the specified indexes, or keys, of the collection. Indexes may be specified as individual arguments or as arrays of indexes.

```swift
$.at(["ant", "bat", "cat", "dog", "egg"], indexes: 0, 2, 4) 
=> ["ant", "cat", "egg"]
```

### chunk - `$.chunk`

Creates an array of elements split into groups the length of size. If array can’t be split evenly, the final chunk will be the remaining elements.

```swift
$.chunk([1, 2, 3, 4], size: 2)
=> [[1, 2], [3, 4]]

$.chunk([1, 2, 3, 4], size: 3)
=> [[1, 2, 3], [4]]
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

### cycle - `$.cycle`

Cycles through the array definetly or indefinetly passing each element into the callback function. The second parameter is to specify how many times to cycle through the array. If left out it will cycle indefinetly.

```swift
$.cycle([1, 2, 3], 2) {
  print($0)
}
// Prints the following
123123
```

### difference - `$.difference`

Creates an array excluding all values of the provided arrays

```swift
$.difference([1, 2, 3, 4, 5], [5, 2, 10]) 
=> [1, 3, 4]
```

### each - `$.each`

Passes each element in the array to the callback

```swift
$.each(["A", "B"]) { 
  print("Value \($0)")
}
=> ["A", "B"]

$.each(["A", "B"]) { (index, elem) in
  print("\(index) - \(elem)")
}
=> ["A", "B"]
```

### every - `$.every`

Checks if the given callback returns true value for all items in the array.

```swift
$.every([1, 2, 3, 4], callback: { $0 < 20 }) 
=> true

$.every([1, 2, 3, 4]) { $0 == 1 } 
=> false
```

### factorial `$.factorial`

Returns factorial of integer

```swift
$.factorial(3)
=> 6

$.factorial(0)
=> 1
```

### fetch - `$.fetch`

Get element from an array at the given index which can be negative to find elements from the end of the array. A default value can be returned if indexing out of bounds.


```swift
let arr = [1, 2, 3, 4, 5, 6, 7, 8]
$.fetch(arr, 100)
=> nil

$.fetch(arr, 100, orElse: 42)
=> 42

$.fetch(arr, -1)
=> 8
```

### fill - `$.fill`

Fills elements of array with value from start up to, but not including, end. This method mutates array.

```swift
var arr = Array<Int>(count: 5, repeatedValue: 1)
$.fill(&arr, withElem: 42)
=> [42, 42, 42, 42, 42]

var arr = Array<Int>(count: 5, repeatedValue: 1)
$.fill(&arr, withElem: 42, startIndex: 1, endIndex: 3)
=> [1, 42, 42, 42, 1]
```


### find - `$.find`

Iterates over elements of an array and returning the first element that the callback returns true for.

```swift
$.find([1, 2, 3, 4], callback: { $0 == 2 }) 
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

### second - `$.second(array: AnyObject[])`

Gets the second element in the array.

```swift
$.second([1, 2, 3, 4])
=> 2

$.second([1]) 
=> nil

$.second([])
=> nil
```

### flatMap - `$.flatMap`

Maps a function that converts elements to a list and then concatenates them.

```swift
let values = [2, 3, 4, 5, 6, 7]
$.flatMap(values) { [$0, $0] }
=> [2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7]
```

### flatMap - `$.flatMap`

Maps a function that converts a type to an Optional over an Optional, and then returns a single-level Optional.


```swift
let url = NSURL(string: "https://apple.com/swift")
$.flatMap(url) { $0.lastPathComponent }
=> Optional("swift")
```

*Note*: This is the same behavior as Optional chaining.
The code above translates to
```swift
NSURL(string: "https://apple.com/swift/")?.lastPathComponent
=> Optional("swift")
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

### gcd `$.gcd`

GCD function return greatest common denominator with number passed

```swift
$.gcd(3, 10)
=> 1

$.gcd(3, 9)
=> 3
```

### indexOf - `$.indexOf`

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

### it-isIn `$.it<T: Comparable>(i: T, isIn range: Range<T>)`

Returns true if i is in interval or range

```swift
$.it("c", isIn: "a"..."z")
=> true

$.it("z", isIn: "a"..<"z")
=> false

$.it(1, isIn: -1.0...10.0)
=> true
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

### lcm `$.lcm`

LCM method return least common multiple with number passed

```swift
$.lcm(3, 10)
=> 30

$.lcm(3, 9)
=> 9
```

### rest - `$.rest`

The opposite of initial this method gets all but the first element or first n elements of an array.

```swift
$.rest([3, 4, 5]) 
=> [4, 5]

$.rest([3, 4, 5], numElements: 2) 
=> [5]
```

### map - `$.map`

Maps each element to new value based on the map function passed

```swift
$.map([1, 2, 3, 4]) { 
  $0 * 2
}
=> [2, 4, 6, 8]
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

### pluck - `$.pluck`

Retrieves the value of a specified property from all elements in the array.

```swift
let arr = [["age": 20], ["age": 30], ["age": 40]]
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

### pullAt - `$.pullAt`

Removes all provided values from the given array at the given indices

```swift
let arr = [10, 20, 30, 40, 50]
$.pullAt(arr, indices: 1, 2, 3)
```

### range - `$.range`

Creates an array of numbers (positive and/or negative) progressing from start up to but not including end.

```swift
$.range(4) 
=> [0, 1, 2, 3]

$.range(from: 1, to: 5) 
=> [1, 2, 3, 4]

$.range(from: 0, to: 20, incrementBy: 5) 
=> [0, 5, 10, 15]

$.range(from: 1, through: 5)
=> [1, 2, 3, 4, 5]

$.range(from: 0, through: 20, incrementBy: 5)
=> [0, 5, 10, 15, 20]
```

### reduce - `$.reduce`

Reduce function that will resolve to one value after performing combine function on all elements

```swift
$.reduce([1, 2, 3], initial: 0) { (total, element) in
    total + element
}
=> 6
```

### sample - `$.sample`

Returns a sample item from the array

```swift
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

Removes an element from array.
```swift
$.remove(["A", "B", "C", "D"], value: "B")
=> ["A", "C", "D"]
```

### remove - `$.remove`

Removes all elements from an array that the `callback` returns true.

```swift
let result = $.remove([1, 2, 3, 4, 5, 6]) { 
  $0 == 2 || $0 == 3 
}
result
=> [1, 4, 5, 6]
```

### shuffle - `$.shuffle`

Shuffles and returns the new shuffled array

```swift
let result = $.shuffle([1, 2, 3, 4, 5, 6])
result
=> [4, 1, 3, 5, 6, 2]
```

### size - `$.size`

Returns size of the array

```swift
_.size(["a", "b", "c")
=> 3
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
=> [1, 2, 3, 5, 4]
```

### merge - `$.merge`

Creates an array of all values, including duplicates, of the arrays in the order they are provided.

```swift
let arr  = [1, 5]
let arr2 = [2, 4]
let arr3 = [5, 6]
let result = $.merge(arr, arr2, arr3)
result
=> [1, 5, 2, 4, 5, 6]
```

### uniq - `$.uniq`

Creates a duplicate-value-free version of an array.

```swift
$.uniq([1, 2, 1, 3, 1])
=> [1, 2, 3]

$.uniq([1, 2.5, 3, 1.5, 2, 3.5]) {
  floor($0)
}
=> [1, 2.5, 3]
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
$.zip(["fred", "barney"], [30, 40], [true, false]) as [NSObject] 
=> [["fred", 30, true], ["barney", 40, false]]
```

### zipObject - `$.zipObject`

Creates an object composed from arrays of keys and values.

```swift
$.zipObject(["fred", "barney"], values: [30, 40])
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

## Dictionary ##

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
$.merge(dict, dict2, dict3)
=> ["Dog": 1, "Cat": 2, "Cow": 3, "Sheep": 4]
```

### pick - `$.pick`

Creates a shallow clone of a dictionary composed of the specified keys.

```swift
$.pick(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Dog", "Cow")
=> ["Dog": 1, "Cow": 3]
```

### omit - `$.omit`

Creates a shallow clone of a dictionary excluding the specified keys.

```swift
$.omit(["Dog": 1, "Cat": 2, "Cow": 3], keys: "Cat", "Dog")
=> ["Cow": 3, "Sheep": 4]
```

## Object ##

### tap - `$.tap`

Invokes interceptor with the object and then returns object.

```swift
var beatle = Car(name: "Fusca")
$.tap(beatle, {$0.name = "Beatle"}).color = "Blue"
```

## Function ##

### after - `$.after`

Creates a function that executes passed function only after being called n times.

```swift
var saves = ["profile", "settings"];
let asyncSave = { (function: () -> ()?) in
   function() 
   // Saving right away for testing 
   // but in real world would be async
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
let helloWorldFunc = $.bind({(T...) in 
  T[0] + " " + T[1] + " from " + T[2] 
}, "Hello", "World", "Swift")
helloWorldFunc() 
=> "Hello World from Swift"
```

### compose - `$.compose`

Compose two or more functions where the return value of the first function is passed into the next function. Useful when chaining functions and returns a function that can be called with variadic argument values or an array of values as input

```swift
let double = { (params: Int...) -> [Int] in
  return $.map(params) { $0 * 2 }
}
let subtractTen = { (params: Int...) -> [Int] in
  return $.map(params) { $0 - 10 }
}
let doubleSubtractTen = $.compose(double, subtractTen)
doubleSubtractTen(5, 6, 7)
=> [0, 2, 4]

let f = $.compose({ (arr: [Int]) -> [Int] in
  $.map(arr) { $0 + 1 }
}, { (arr: [Int]) -> [Int] in
  $.map(arr) { $0 * 2 }
})
f([1, 2])
=> [4, 6]
```

### curry - `$.curry`

Returns a function which when invoked either executes the function returning its result, if all function arguments have been provided, or returns another function that accepts one more argument of the remaining function arguments until all arguments are supplied. This is useful for making partial function as seen in these examples.

```swift
func adder(x: Int, y: Int, z: Int) -> Int {
return x + y + z
}

let curriedAdder = $.curry(adder)
let addTenAnd = curriedAdder(10)
let addThirtyAnd = addTenAnd(20)
addThirtyAnd(1)
=> 31

addThirtyAnd(50)
=> 80

addTenAnd(10)(10)
=> 30
```

### id - `$.id`

The identify function which simply returns the argument its given.

```swift
$.id("Hello World from Swift")
=> "Hello World from Swift"
```

### memoize - `$.memoize`

Returns a memoized function to improve performance by caching recursive function values.

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

### noop - `$.noop`

A no-operation function.

```swift
$.noop() 
=> nil
```

### now - `$.now`

Gets the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).

```swift
$.now() 
=> 1431911564.292577
```

### once - `$.once`

Get a wrapper function that executes the passed function only once. Useful for getting shared config or creating singleton objects.

```swift
func createConfig() -> [String: String] {
  var i = 1
  return [
    "App ID": "\(i++)",
    "URL": "https://someurl"
  ]
}

let getConfig = $.once(createConfig)
getConfig()
=> ["App ID": "1", "URL": "https://someurl"]

getConfig()
=> ["App ID": "1", "URL": "https://someurl"]
```

### partial - `$.partial`

Creates a function that, when called, invokes func with any additional partial arguments prepended to those provided to the new function.

```swift
let partialFunc = $.partial({(T...) in 
  T[0] + " " + T[1] + " from " + T[2] 
}, "Hello")
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

## Chaining ##

**`$.chain(...)`**

### `any`

Returns true if callback function returns true for at least one element in the array

```swift
var chain = $.chain([1, 2, 3])
chain.any({ ($0 as Int) < 2 })
=> true
```

### `all`

Returns true if callback function returns true for all elements in the array

```swift
var chain = $.chain([1, 2, 3])
chain.all({ ($0 as Int) < 10 })
=> true
```

### `each`

Passes each element value to the callback function

```swift
var chain = $.chain(["Hello", "World"])
var strBuilder = ""
chain.each({ strBuilder += ($0 as String) }).value
strBuilder
=> "HelloWorld"
```

### `filter`

Filters the arrary to elements for which the callback function returns true

```swift
var chain = $.chain([1, 2, 3, 4])
chain.filter({ ($0 as Int) < 3 }).value
=> [1, 2]
```

### `first`

Returns the first element in the array and terminates the chain

```swift
var chain = $.chain([1, 2, 3, 4])
chain.first()
=> 1
```

### `second`

Returns the second element in the array and terminates the chain

```swift
var chain = $.chain([1, 2, 3, 4])
chain.second()
=> 2
```

### `third`

Returns the third element in the array and terminates the chain

```swift
var chain = $.chain([1, 2, 3, 4])
chain.third()
=> 3
```

### `flatten`

Flattens a nested array of any depth.

```swift
var chain = $.chain([[1, [2]], [3], 4])
chain.flatten().value
=> [1, 2, 3, 4]
```

### `initial`

Gets all but the last element or last n elements of an array.

```swift
var chain = $.chain([1, 2, 3, 4])
chain.initial(2).value
=> [1, 2]
```

### `map`

Maps each element to the new value returned in the callback function

```swift
var chain = $.chain([1, 2, 3, 4])
chain.map({ ($0 as Int) * 2 }).value
=> [2, 4, 6, 8]
```

### `size`

Returns size of the array and terminates the chain

```swift
var chain = $.chain([1, 2, 3, 4])
chain.map({ ($0 as Int) * 2 }).size()
=> 4
```

### `slice`

Slices the array based on the start and end position. If an end position is not specified it will slice till the end of the array.

```swift
var chain = $.chain([1, 2, 3, 4, 5, 6, 7])
chain.slice(2, end: 4).value
=> [3, 4]
```

### `value`

Returns the value after evaluating all callbacks

```swift
var chain = $.chain([1, 2, 3, 4, 5, 6, 7])
chain.value
=> [1, 2, 3, 4, 5, 6, 7]
```

**Chaining more than one method**

```swift
$.chain([[1, 2], 3, [[4], 5]])
  .initial()
  .flatten()
  .first()
=> 1

$.chain([1, 2, 3, 4, 5])
  .filter { $0 % 1 == 0 }
  .map { $0 * 2 }
  .all {$0 < 10}
=> false

$.chain([1, 2, 3, 4, 5])
  .map({ $0 * 2 })
  .flatten()
  .initial(2).value
=> [2, 4, 6]
```
