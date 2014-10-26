//
//  Regex.swift
//  Cent
//
//  Created by Ankur Patel on 10/21/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

public class Regex {
    
    let expression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.expression = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error)!
    }
    
    public func matches(testStr: String) -> [AnyObject] {
        let matches = self.expression.matchesInString(testStr, options: nil, range:NSMakeRange(0, countElements(testStr)))
        return matches
    }
    
    public func rangeOfFirstMatch(testStr: String) -> NSRange {
        return self.expression.rangeOfFirstMatchInString(testStr, options: nil, range:NSMakeRange(0, countElements(testStr)))
    }
    
    public func test(testStr: String) -> Bool {
        let matches = self.matches(testStr)
        return matches.count > 0
    }
}