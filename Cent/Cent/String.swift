//
//  String.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension String {
    
    public var length: Int {
        get {
            return count(self)
        }
    }
    
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
    
    /// Get the start index of Charcter
    ///
    /// :return start index of .None if not found
    public func indexOf(char: Character) -> Int? {
        return self.indexOf(char.description)
    }
    
    /// Get the start index of string
    ///
    /// :return start index of .None if not found
    public func indexOf(str: String) -> Int? {
        return self.indexOfRegex(Regex.escapeStr(str))
    }
    
    /// Get the start index of regex pattern
    ///
    /// :return start index of .None if not found
    public func indexOfRegex(pattern: String) -> Int? {
        if let range = Regex(pattern).rangeOfFirstMatch(self).toRange() {
            return range.startIndex
        }
        return .None
    }
    
    /// Get an array from string split using the delimiter character
    ///
    /// :return Array of strings after spliting
    public func split(delimiter: Character) -> [String] {
        return self.componentsSeparatedByString(String(delimiter))
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

extension Character {
    public var description: String {
        get {
            return String(self)
        }
    }
}

infix operator =~ {}

/// Regex match the string on the left with the string pattern on the right
///
/// :return true if string matches the pattern otherwise false
public func =~(str: String, pattern: String) -> Bool {
    return Regex(pattern).test(str)
}

/// Concat the string to itself n times
///
/// :return concatenated string
public func * (str: String, n: Int) -> String {
    var stringBuilder = [String]()
    n.times {
        stringBuilder.append(str)
    }
    return Swift.join("", stringBuilder)
}

