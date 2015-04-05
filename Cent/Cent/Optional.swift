//
//  Optional.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//
//

import Foundation
import Dollar

func ==<T: Equatable>(value: T?, other: T?) -> Bool {
    return $.equal(value, other)
}