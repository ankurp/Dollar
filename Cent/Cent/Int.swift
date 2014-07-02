//
//  Int.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Int {
    
    func times(callback: (Int) -> ()) {
        (0..self).eachWithIndex { callback($0) }
    }
    
    func times (function: () -> ()) {
        self.times { (index: Int) -> () in
            function()
        }
    }
    
}