//
//  Optional.swift
//  
//
//  Created by Harlan Haskins on 3/3/15.
//
//

import Foundation
import Dollar

func ==<T: Equatable>(value: T?, other: T?) -> Bool {
    return $.equal(value, other)
}