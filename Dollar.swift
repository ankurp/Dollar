//
//  $.swift
//  Dollar
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

struct $ {
    
    //LoDash.first([0, 1, false, 2, '', 3]);
    //Gets the first element or first n elements of an array.
    static func first(collection: AnyObject[]) -> AnyObject {
        if collection.isEmpty {
            return NSNull()
        } else {
            return collection[0];
        }
    }
    
    //LoDash.noop()
    //A no-operation function.
    static func noop() -> AnyObject {
        return NSNull();
    }
}