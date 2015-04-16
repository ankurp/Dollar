//
//  Int.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Int {
    
    /// Invoke a callback n times
    ///
    /// :param callback The function to invoke that accepts the index
    public func times(callback: (Int) -> ()) {
        (0..<self).eachWithIndex { callback($0) }
    }
    
    /// Invoke a callback n times
    ///
    /// :param callback The function to invoke
    public func times(function: () -> ()) {
        self.times { (index: Int) -> () in
            function()
        }
    }
    
    
    /// Check if it is even
    ///
    /// :return Bool whether int is even
    public var isEven: Bool {
        get {
            return self % 2 == 0
        }
    }

    /// Check if it is odd
    ///
    /// :return Bool whether int is odd
    public var isOdd: Bool {
        get {
            return self % 2 == 1
        }
    }

    /// Splits the int into array of digits
    ///
    /// :return Bool whether int is odd
    public func digits() -> [Int] {
        var digits: [Int] = []
        var selfCopy = self
        while selfCopy > 0 {
            digits << (selfCopy % 10)
            selfCopy = (selfCopy / 10)
        }
        return digits.reverse()
    }

    /// Get the next int
    ///
    /// :return next int
    public func next() -> Int {
        return self + 1
    }
    
    /// Get the previous int
    ///
    /// :return previous int
    public func prev() -> Int {
        return self - 1
    }

    /// Invoke the callback from int up to and including limit
    ///
    /// :params limit the max value to iterate upto
    /// :params callback to invoke
    public func upTo(limit: Int, callback: () -> ()) {
        (self...limit).each { callback() }
    }

    /// Invoke the callback from int up to and including limit passing the index
    ///
    /// :params limit the max value to iterate upto
    /// :params callback to invoke
    public func upTo(limit: Int, callback: (Int) -> ()) {
        (self...limit).eachWithIndex { callback($0) }
    }
    
    /// Invoke the callback from int down to and including limit
    ///
    /// :params limit the min value to iterate upto
    /// :params callback to invoke
    public func downTo(limit: Int, callback: () -> ()) {
        var selfCopy = self
        while selfCopy-- >= limit {
            callback()
        }
    }
    
    /// Invoke the callback from int down to and including limit passing the index
    ///
    /// :params limit the min value to iterate upto
    /// :params callback to invoke
    public func downTo(limit: Int, callback: (Int) -> ()) {
        var selfCopy = self
        while selfCopy >= limit {
            callback(selfCopy--)
        }
    }
    
}

public extension Int {
    struct CalendarMath {
        private let unit: NSCalendarUnit
        private let value: Int
        private var calendar: NSCalendar {
            return NSCalendar.autoupdatingCurrentCalendar()
        }

        private init(unit: NSCalendarUnit, value: Int) {
            self.unit = unit
            self.value = value
        }

        private func generateComponents(_ modifer: (Int) -> (Int) = (+)) -> NSDateComponents {
            let components = NSDateComponents()
            components.setValue(modifer(value), forComponent: unit)
            return components
        }

        public func from(date: NSDate) -> NSDate? {
            return calendar.dateByAddingComponents(generateComponents(), toDate: date, options: nil)
        }

        public var fromNow: NSDate? {
            return from(NSDate())
        }

        public func before(date: NSDate) -> NSDate? {
            return calendar.dateByAddingComponents(generateComponents(-), toDate: date, options: nil)
        }

        public var ago: NSDate? {
            return before(NSDate())
        }
    }

    private func mathForUnit(unit: NSCalendarUnit) -> CalendarMath {
        return CalendarMath(unit: unit, value: self)
    }

    var seconds: CalendarMath {
        return mathForUnit(.CalendarUnitSecond)
    }

    var second: CalendarMath {
        return seconds
    }

    var minutes: CalendarMath {
        return mathForUnit(.CalendarUnitMinute)
    }

    var minute: CalendarMath {
        return minutes
    }

    var hours: CalendarMath {
        return mathForUnit(.CalendarUnitHour)
    }

    var hour: CalendarMath {
        return hours
    }

    var days: CalendarMath {
        return mathForUnit(.CalendarUnitDay)
    }

    var day: CalendarMath {
        return days
    }

    var weeks: CalendarMath {
        return mathForUnit(.CalendarUnitWeekOfYear)
    }

    var week: CalendarMath {
        return weeks
    }

    var months: CalendarMath {
        return mathForUnit(.CalendarUnitMonth)
    }

    var month: CalendarMath {
        return months
    }

    var years: CalendarMath {
        return mathForUnit(.CalendarUnitYear)
    }
    
    var year: CalendarMath {
        return years
    }
}
