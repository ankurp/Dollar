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
3.upTo(0) {
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

### `lstring() -> String`

Get string without leading spaces

```swift
let leadingSpace = "  Hello"
leadingSpace.lstrip()
=> "Hello"
```

### `rstring() -> String`

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
re.matches("Hello World")
=> true

re.matches("Str")
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
If you are interested in contributing checkout [CONTRIBUTING.md](https://github.com/ankurp/Dollar.swift/blob/master/CONTRIBUTING.md)

# Roadmap #

* Add more extention functions to the Cent library
* Benchmark and improve performance if applicable

# Dollar or Cent #
If you are interested only in pure functional programming `import Dollar` otherwise `import Cent` which includes extensions for certain object type such as Array for now but more will be added.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/ankurp/dollar.swift/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
