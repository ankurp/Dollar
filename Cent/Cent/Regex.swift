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

/// Useful regex patterns (mapped from lodash)
struct RegexHelper {
  
    /// Unicode character classes
    static let astralRange = "\\ud800-\\udfff"
    static let comboRange = "\\u0300-\\u036f\\ufe20-\\ufe23"
    static let dingbatRange = "\\u2700-\\u27bf"
    static let lowerRange = "a-z\\xdf-\\xf6\\xf8-\\xff"
    static let mathOpRange = "\\xac\\xb1\\xd7\\xf7"
    static let nonCharRange = "\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf"
    static let quoteRange = "\\u2018\\u2019\\u201c\\u201d"
    static let spaceRange = "\\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000"
    static let upperRange = "A-Z\\xc0-\\xd6\\xd8-\\xde"
    static let varRange = "\\ufe0e\\ufe0f"
    static let breakRange = mathOpRange + nonCharRange + quoteRange + spaceRange
  
    /// Unicode capture groups
    static let astral = "[" + astralRange + "]"
    static let breakGroup = "[" + breakRange + "]"
    static let combo = "[" + comboRange + "]"
    static let digits = "\\d+"
    static let dingbat = "[" + dingbatRange + "]"
    static let lower = "[" + lowerRange + "]"
    static let misc = "[^" + astralRange + breakRange + digits + dingbatRange + lowerRange + upperRange + "]"
    static let modifier = "(?:\\ud83c[\\udffb-\\udfff])"
    static let nonAstral = "[^" + astralRange + "]"
    static let regional = "(?:\\ud83c[\\udde6-\\uddff]){2}"
    static let surrPair = "[\\ud800-\\udbff][\\udc00-\\udfff]"
    static let upper = "[" + upperRange + "]"
    static let ZWJ = "\\u200d"
  
    /// Unicode regex composers
    static let lowerMisc = "(?:" + lower + "|" + misc + ")"
    static let upperMisc = "(?:" + upper + "|" + misc + ")"
    static let optMod = modifier + "?"
    static let optVar = "[" + varRange + "]"
    static let optJoin = "(?:" + ZWJ + "(?:" + [nonAstral, regional, surrPair].joinWithSeparator("|") + ")" + optVar + optMod + ")*"
    static let seq = optVar + optMod + optJoin
    static let emoji = "(?:" + [dingbat, regional, surrPair].joinWithSeparator("|") + ")" + seq
    static let symbol = "(?:" + [nonAstral + combo + "?", combo, regional, surrPair, astral].joinWithSeparator("|") + ")"
  
    /// Match non-compound words composed of alphanumeric characters
    static let basicWord = "[a-zA-Z0-9]+"
  
    /// Match complex or compound words
    static let complexWord = [
      upper + "?" + lower + "+(?=" + [breakGroup, upper, "$"].joinWithSeparator("|") + ")",
      upperMisc + "+(?=" + [breakGroup, upper + lowerMisc, "$"].joinWithSeparator("|") + ")",
      upper + "?" + lowerMisc + "+",
      digits + "(?:" + lowerMisc + "+)?",
      emoji
    ].joinWithSeparator("|")
  
    /// Detect strings that need a more robust regexp to match words
    static let hasComplexWord = "[a-z][A-Z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]"
  
}
