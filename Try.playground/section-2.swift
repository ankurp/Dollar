import Dollar
import Cent

$.map([1, 2, 3]) {
    $0 * 2
}

$.max([1, 2, 3])
$.max([Int]())

$.min([2, 3, 1])
$.min([Int]())

$.uniq([1, 2.5, 3, 1.5, 2, 3.5]) {
    floor($0)
}

3.times {
    println("Hello World!")
}

"Dollar" =~ "oll"
let proj = "Dollar and Cent"
proj["^.+[^and Cent]"]

let leadingSpace = "  Hello"
leadingSpace.lstrip()

let trailingSpace = "Hello   "
trailingSpace.rstrip()

let spaces = "   Hello   "
spaces.strip()

("Hi Swift! " * 3).rstrip()
