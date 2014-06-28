//
//  Array+Cent.swift
//  Cent
//
//  Created by Ankur Patel on 6/28/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

extension Array {

    func first() -> Element? {
        return $.first(self)
    }
    
}