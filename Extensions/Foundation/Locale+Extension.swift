//
//  NSLocale+Extension.swift
// 
//
//  Created by Vitaliy Kuzmenko on 29/07/15.
//  Copyright (c) 2015. All rights reserved.
//

import Foundation

extension Locale {
    
    static public var UTCTimeOffset: Int {
        return NSTimeZone.local.secondsFromGMT() / 60
    }
    
}

