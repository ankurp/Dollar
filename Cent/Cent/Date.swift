//
//  Date.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

extension NSDate {
    
    /// Returns a new Date given the year month and day
    ///
    /// :param year
    /// :param month
    /// :param day
    /// :return Date
    class func from(#year: Int, month: Int, day: Int) -> NSDate {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        var gregorian = NSCalendar(identifier:NSGregorianCalendar)
        var date = gregorian.dateFromComponents(c)
        return date
    }

    /// Parses the date based on the format and return a new Date
    ///
    /// :param dateStr String version of the date
    /// :param format By default it is year month day
    /// :return Date
    class func parse(dateStr: String, format: String = "yyyy-MM-dd") -> NSDate {
        var dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.dateFromString(dateStr)
    }
}

typealias Date = NSDate