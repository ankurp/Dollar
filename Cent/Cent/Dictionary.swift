//
//  Dictionary.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Dictionary {
    
    func isEmpty () -> Bool {
        return Array(self.keys).isEmpty
    }
    
    func merge<K, V>(dictionaries: Dictionary<K, V>...) -> Dictionary {
        return $.merge(dictionaries: reinterpretCast($.merge(arrays: [self], dictionaries)))
    }
    
}