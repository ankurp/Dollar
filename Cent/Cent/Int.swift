//
//  Int.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

public extension Int {

    /// Get ASCII character from integer
    ///
    /// :return Character represented for the given integer
    public var char: Character {
        get {
            return Character(UnicodeScalar(self))
        }
    }

    /// Returns random number from 0 upto but not including value of integer
    ///
    /// :return Random number
    public func random() -> Int {
        return $.random(self)
    }

    private func mathForUnit(unit: NSCalendarUnit) -> CalendarMath {
        return CalendarMath(unit: unit, value: self)
    }

    var seconds: CalendarMath {
        return mathForUnit(.Second)
    }

    var second: CalendarMath {
        return seconds
    }

    var minutes: CalendarMath {
        return mathForUnit(.Minute)
    }

    var minute: CalendarMath {
        return minutes
    }

    var hours: CalendarMath {
        return mathForUnit(.Hour)
    }

    var hour: CalendarMath {
        return hours
    }

    var days: CalendarMath {
        return mathForUnit(.Day)
    }

    var day: CalendarMath {
        return days
    }

    var weeks: CalendarMath {
        return mathForUnit(.WeekOfYear)
    }

    var week: CalendarMath {
        return weeks
    }

    var months: CalendarMath {
        return mathForUnit(.Month)
    }

    var month: CalendarMath {
        return months
    }

    var years: CalendarMath {
        return mathForUnit(.Year)
    }
    
    var year: CalendarMath {
        return years
    }

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

        private func generateComponents(modifer: (Int) -> (Int) = (+)) -> NSDateComponents {
            let components = NSDateComponents()
            components.setValue(modifer(value), forComponent: unit)
            return components
        }

        public func from(date: NSDate) -> NSDate? {
            return calendar.dateByAddingComponents(generateComponents(), toDate: date, options: [])
        }

        public var fromNow: NSDate? {
            return from(NSDate())
        }

        public func before(date: NSDate) -> NSDate? {
            return calendar.dateByAddingComponents(generateComponents(-), toDate: date, options: [])
        }

        public var ago: NSDate? {
            return before(NSDate())
        }
    }
}
