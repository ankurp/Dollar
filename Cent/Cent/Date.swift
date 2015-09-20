//
//  Date.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

public extension NSDate {
    
    /// Returns a new Date given the year month and day
    ///
    /// :param year
    /// :param month
    /// :param day
    /// :return Date
    public class func from(year year: Int, month: Int, day: Int) -> NSDate? {
        let c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        if let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian) {
            return gregorian.dateFromComponents(c)
        } else {
            return .None
        }
    }

    /// Returns a new Date given the unix timestamp
    ///
    /// :param unix timestamp
    /// :return Date
    public class func from(unix unix: Double) -> NSDate {
        return NSDate(timeIntervalSince1970: unix)
    }

    /// Parses the date based on the format and return a new Date
    ///
    /// :param dateStr String version of the date
    /// :param format By default it is year month day
    /// :return Date
    public class func parse(dateStr: String, format: String = "yyyy-MM-dd") -> NSDate {
        let dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.dateFromString(dateStr)!
    }
    
    /// Returns the unix timestamp of the date passed in or
    /// the current unix timestamp
    ///
    /// :param date
    /// :return Double
    public class func unix(date: NSDate = NSDate()) -> Double {
       return date.timeIntervalSince1970 as Double
    }
}

public typealias Date = NSDate
