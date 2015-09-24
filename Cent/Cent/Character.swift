//
//  Character.swift
//  Cent
//
//  Created by Ankur Patel on 9/23/15.
//  Copyright © 2015 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

public extension Character {

    /// Get int representation of character
    ///
    /// :return UInt32 that represents the given character
    public var ord: UInt32 {
        get {
            let desc = self.description
            return desc.unicodeScalars[desc.unicodeScalars.startIndex].value
        }
    }

    /// Convert character to string
    ///
    /// :return String representation of character
    public var description: String {
        get {
            return String(self)
        }
    }
}
