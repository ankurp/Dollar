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
    
    /// Get character at a subscript
    ///
    /// :param i Index for which the character is returned
    /// :return Character at index i
    subscript(i: Int) -> Character? {
        if let char = Array(self).get(i) {
            return char
        }
        return nil
    }
    

    /// Get substring using subscript notation and by passing a range
    ///
    /// :param range The range from which to start and end the substring
    /// :return Substring
    subscript(range: Range<Int>) -> String {
        var start = Swift.advance(startIndex, range.startIndex)
        var end = Swift.advance(startIndex, range.endIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }

    /// Get an array from string split using the delimiter character
    ///
    /// :return Array of strings after spliting
    func split(delimiter: Character) -> String[] {
        return Swift.split(self) { (char: Character) -> Bool in
            char == delimiter
        }
    }
    
}