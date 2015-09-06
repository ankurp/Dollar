//
//  Regex.swift
//  Cent
//
//  Created by Ankur Patel on 10/21/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

let RegexEscapePattern = "[\\-\\[\\]\\/\\{\\}\\(\\)\\*\\+\\?\\.\\\\\\^\\$\\|]"
let RegexPatternRegex = Regex(RegexEscapePattern)

public class Regex {
    
    let expression: NSRegularExpression
    let pattern: String
    
    public init(_ pattern: String) {
        self.pattern = pattern
        self.expression = try! NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    }
    
    public func matches(testStr: String) -> [AnyObject] {
        let matches = self.expression.matchesInString(testStr, options: [], range:NSMakeRange(0, testStr.characters.count))
        return matches
    }
    
    public func rangeOfFirstMatch(testStr: String) -> NSRange {
        return self.expression.rangeOfFirstMatchInString(testStr, options: [], range:NSMakeRange(0, testStr.characters.count))
    }
    
    public func test(testStr: String) -> Bool {
        let matches = self.matches(testStr)
        return matches.count > 0
    }
    
    public class func escapeStr(str: String) -> String {
        let matches = RegexPatternRegex.matches(str)
        var charArr = [Character](str.characters)
        var strBuilder = [Character]()
        var i = 0
        for match in matches {
            let range = match.range
            while i < range.location + range.length {
                if i == range.location {
                    strBuilder << "\\"
                }
                strBuilder << charArr[i++]
            }
        }
        while i < charArr.count {
            strBuilder << charArr[i++]
        }
        return String(strBuilder)
    }
}
