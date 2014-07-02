//
//  Range.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Range {
    
    func eachWithIndex(callback: (T) -> ()) {
        for index in self {
            callback(index)
        }
    }
    
    func each(callback: () -> ()) {
        self.eachWithIndex { (T) -> () in
            callback()
        }
    }
    
}

@infix func ==<T: ForwardIndex>(left: Range<T>, right: Range<T>) -> Bool {
    return left.startIndex == right.startIndex && left.endIndex == right.endIndex
}
