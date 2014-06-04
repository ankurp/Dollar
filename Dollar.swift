//
//  $.swift
//  Dollar
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

struct $ {
    
    //$.first([0, 1, false, 2, '', 3]);
    //Gets the first element or first n elements of an array.
    static func first(collection: AnyObject[]) -> AnyObject {
        if collection.isEmpty {
            return NSNull()
        } else {
            return collection[0];
        }
    }
    
    //$.compact([0, 1, false, 2, '', 3])
    //Remove all falsey values
    static func compact(array: AnyObject[]) -> AnyObject[] {
        var index = -1
        let length = array.count
        var result: AnyObject[] = []
    
        while ++index < length {
            if let value : AnyObject = AnyObject?(array[index]) {
                result += value
            }
        }
        return result
    }

    //$.flatten([[2],3,4])
    //flatten array
    static func flatten(array: AnyObject[], isShallow: Bool) -> AnyObject[] {
        return self.flatten(array, isShallow: isShallow, fromIndex: 0)
    }
    
    //Private
    static func flatten(array: AnyObject[], isShallow: Bool, fromIndex: Int) -> AnyObject[] {
        let length = array.count
        if length == 0 {
            return []
        }
        var index = fromIndex - 1
        var result: AnyObject[] = [];
        
        while ++index < length {
            //Todo
        }
        return result;
    }

    //$.noop()
    //A no-operation function.
    static func noop() -> AnyObject {
        return NSNull();
    }
}