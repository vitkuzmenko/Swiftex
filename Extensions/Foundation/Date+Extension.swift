//
//  NSDate+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 15/04/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

extension Date {
    
    public func string(format: String, timeZone: TimeZone? = nil) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        df.timeZone = timeZone
        return df.string(from: self)
    }
    
    public func string(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let df = DateFormatter()
        df.dateStyle = dateStyle
        df.timeStyle = timeStyle
        return df.string(from: self)
    }
    
}
