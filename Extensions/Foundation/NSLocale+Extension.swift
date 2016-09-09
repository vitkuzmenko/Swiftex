//
//  NSLocale+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 29/07/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

extension Locale {
    
    static public var UTCTimeOffset: Int {
        return NSTimeZone.local.secondsFromGMT() / 60
    }
    
}

