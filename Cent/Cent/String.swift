//
//  String.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

public extension String {
    
    /// Get character at a subscript
    ///
    /// :param i Index for which the character is returned
    /// :return Character at index i
    public subscript(i: Int) -> Character? {
        if let char = Array(self).get(i) {
            return char
        }
        return .None
    }

    /// Get character at a subscript
    ///
    /// :param i Index for which the character is returned
    /// :return Character at index i
    public subscript(pattern: String) -> String? {
        if let range = Regex(pattern).rangeOfFirstMatch(self).toRange() {
            return self[range]
        }
        return .None
    }

    /// Get substring using subscript notation and by passing a range
    ///
    /// :param range The range from which to start and end the substring
    /// :return Substring
    public subscript(range: Range<Int>) -> String {
        var start = Swift.advance(startIndex, range.startIndex)
        var end = Swift.advance(startIndex, range.endIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }
    
    /// Get an array from string split using the delimiter character
    ///
    /// :return Array of strings after spliting
    public func split(delimiter: Character) -> [String] {
        return Swift.split(self) { (char: Character) -> Bool in
            char == delimiter
        }
    }

    /// Remove leading whitespace characters
    ///
    /// :return String without leading whitespace
    public func lstrip() -> String {
        return self["[^\\s]+.*$"]!
    }
    
    /// Remove trailing whitespace characters
    ///
    /// :return String without trailing whitespace
    public func rstrip() -> String {
        return self["^.*[^\\s]+"]!
    }

    /// Remove leading and trailing whitespace characters
    ///
    /// :return String without leading or trailing whitespace
    public func strip() -> String {
        return self.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
    }
    
}

infix operator =~ {}

public func =~(str: String, pattern: String) -> Bool {
    return Regex(pattern).test(str)
}

public func * (str: String, n: Int) -> String {
    var stringBuilder = [String]()
    n.times {
        stringBuilder.append(str)
    }
    return Swift.join("", stringBuilder)
}

