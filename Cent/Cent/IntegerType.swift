//
//  IntegerType.swift
//  Cent
//
//  Created by Nikolai Vazquez on 11/11/15.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

public extension IntegerType {

    /// Invoke a callback n times
    ///
    /// :param callback The function to invoke that accepts the index
    public func times(callback: (Self) -> ()) {
        (0..<self).eachWithIndex { callback($0) }
    }

    /// Invoke a callback n times
    ///
    /// :param callback The function to invoke
    public func times(function: () -> ()) {
        self.times { (index: Self) -> () in
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
    public func digits() -> [Self] {
        var digits: [Self] = []
        var selfCopy = self
        while selfCopy > 0 {
            digits << (selfCopy % 10)
            selfCopy = (selfCopy / 10)
        }
        return Array(digits.reverse())
    }

    /// Get the next int
    ///
    /// :return next int
    public func next() -> Self {
        return self + 1
    }

    /// Get the previous int
    ///
    /// :return previous int
    public func prev() -> Self {
        return self - 1
    }

    /// Invoke the callback from int up to and including limit
    ///
    /// :params limit the max value to iterate upto
    /// :params callback to invoke
    public func upTo(limit: Self, callback: () -> ()) {
        (self...limit).each { callback() }
    }

    /// Invoke the callback from int up to and including limit passing the index
    ///
    /// :params limit the max value to iterate upto
    /// :params callback to invoke
    public func upTo(limit: Self, callback: (Self) -> ()) {
        (self...limit).eachWithIndex { callback($0) }
    }

    /// Invoke the callback from int down to and including limit
    ///
    /// :params limit the min value to iterate upto
    /// :params callback to invoke
    public func downTo(limit: Self, callback: () -> ()) {
        var selfCopy = self
        while selfCopy-- >= limit {
            callback()
        }
    }

    /// Invoke the callback from int down to and including limit passing the index
    ///
    /// :params limit the min value to iterate upto
    /// :params callback to invoke
    public func downTo(limit: Self, callback: (Self) -> ()) {
        var selfCopy = self
        while selfCopy >= limit {
            callback(selfCopy--)
        }
    }

    /// GCD metod return greatest common denominator with number passed
    ///
    /// :param number
    /// :return Greatest common denominator
    public func gcd(n: Self) -> Self {
        return $.gcd(self, n)
    }

    /// LCM method return least common multiple with number passed
    ///
    /// :param number
    /// :return Least common multiple
    public func lcm(n: Self) -> Self {
        return $.lcm(self, n)
    }

    /// Returns Factorial of integer
    ///
    /// :return factorial
    public func factorial() -> Self {
        return $.factorial(self)
    }

    /// Returns true if i is in closed interval
    ///
    /// :param i to check if it is in interval
    /// :param interval to check in
    /// :return true if it is in interval otherwise false
    public func isIn(interval: ClosedInterval<Self>) -> Bool {
        return $.it(self, isIn: interval)
    }

    /// Returns true if i is in half open interval
    ///
    /// :param i to check if it is in interval
    /// :param interval to check in
    /// :return true if it is in interval otherwise false
    public func isIn(interval: HalfOpenInterval<Self>) -> Bool {
        return $.it(self, isIn: interval)
    }

    /// Returns true if i is in range
    ///
    /// :param i to check if it is in range
    /// :param interval to check in
    /// :return true if it is in interval otherwise false
    public func isIn(interval: Range<Self>) -> Bool {
        return $.it(self, isIn: interval)
    }

}
