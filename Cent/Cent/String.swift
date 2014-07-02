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
    
    subscript(i: Int) -> Character? {
        if let char = Array(self).get(i) {
            return char
        }
        return nil
    }
    
    subscript(r: Range<Int>) -> String {
        var start = Swift.advance(startIndex, r.startIndex)
        var end = Swift.advance(startIndex, r.endIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }
    
    func split(delimiter: Character) -> String[] {
        return Swift.split(self) { (char: Character) -> Bool in
            char == delimiter
        }
    }
    
}