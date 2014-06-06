Dollar.swift
===========

A functional tool-belt for Swift Language. Library Source code is in Classes folder. 

It is under construction so please be patient as more functions get added. If you are interested in contributing please fork this project implement new methods or changes in the `Dollar.swift` file in the Classes folder and submit a pull request.

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

More functions will be added first for all array types and then for dictionary type.
