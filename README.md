Dollar.swift
===========

A functional tool-belt for Swift Language. Library Source code is in Classes folder. 

It is under construction. If you are interested in contributing 

1. please fork this project
2. implement new methods or changes in the `Dollar.swift` file in the Classes folder
3. write tests in `DollarTests.swift` file in the DollarTests folder 
4. and submit a pull request.

### Array Methods Implemented

  $.first
  $.compact
  $.contains
  $.findIndex
  $.findLastIndex
  $.flatten
  $.indexOf
  $.initial
  $.last
  $.lastIndexOf
  $.rest
  $.noop
  $.pull
  $.range
  $.remove
  $.sortedIndex
  $.without

### Array Methods To Be Implemented
  $.difference
  $.intersection
  $.union
  $.uniq
  $.xor
  $.zip
  $.zipObject

### Example usage

`$.first([0, 1, false, 2, '', 3])`
Gets the first element or first n elements of an array.

`$.compact([0, 1, false, 2, '', 3])`
Remove all falsey values

`$.flatten([[2],3,4])`
flatten array

`$.indexOf([2, 3, 4, 5], 3)`
Return index of the value

`$.initial([2, 3, 4, 5])`
Returns all except for last element

`$.initial([2, 3, 4, 5], 2)`
Returns all except for last 2

`$.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1])`
Will return intersection of all arrays

`$.last([1, 2, 3])`
Will return last element in the array

Need to add lazy evaluation using chaining
`$([[[2], 3], 4]).flatten().first().value()` should return 2

### Roadmap

More functions will be added first for all array types and then for dictionary type and then ability to chain operations and lazily evaluating in the end.
