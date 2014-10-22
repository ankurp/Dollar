//
//  Regex.swift
//  Cent
//
//  Created by Ankur Patel on 10/21/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

class Regex {
    
    let expression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.expression = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error)
    }
    
    func matches(testStr: String) -> [AnyObject] {
        let matches = self.expression.matchesInString(testStr, options: nil, range:NSMakeRange(0, countElements(testStr)))
        return matches
    }
    
    func test(testStr: String) -> Bool {
        let matches = self.matches(testStr)
        return matches.count > 0
    }
}