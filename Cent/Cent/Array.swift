//
//  Array.swift
//  Cent
//
//  Created by Ankur Patel on 6/28/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Array {
    
    func at(indexes: Int...) -> Element[] {
        return $.at(self, indexes: indexes)
    }
    
    func every(iterator: (Element) -> Bool) -> Bool {
        return $.every(self, iterator: iterator)
    }
    
    func findIndex(iterator: (Element) -> Bool) -> Int? {
        return $.findIndex(self, iterator: iterator)
    }
    
    func findLastIndex(iterator: (Element) -> Bool) -> Int? {
        return $.findLastIndex(self, iterator: iterator)
    }

    func first() -> Element? {
        return $.first(self)
    }
    
    func flatten() -> Element[] {
        return $.flatten(self)
    }
    
    func get(index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
    
    func initial(numElements: Int? = 1) -> Element[] {
        return $.initial(self, numElements: numElements!)
    }
    
    func last() -> Element? {
        return $.last(self)
    }
    
    func rest(numElements: Int? = 1) -> Element[] {
        return $.rest(self, numElements: numElements!)
    }
    
    func min<T: Comparable>() -> T? {
        return $.min(map { $0 as T })
    }
    
    func max<T: Comparable>() -> T? {
        return $.max(map { $0 as T })
    }
        
}