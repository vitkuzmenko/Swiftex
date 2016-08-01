//
//  NSDate+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 15/04/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}

public func <=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 <= rhs.timeIntervalSince1970
}

public func >=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 >= rhs.timeIntervalSince1970
}

public func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 > rhs.timeIntervalSince1970
}

extension NSDate: Comparable { }


extension NSDate {
    
    public var ISO8601String: String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return dateFormatter.stringFromDate(self).stringByAppendingString("Z")
    }
    
    public var tomorrow: NSDate {
        return self.dateByAddingTimeInterval(24 * 60 * 60)
    }
    
    public func isSameMonthToDate(date: NSDate) -> Bool {
        let selfComps = NSCalendar.currentCalendar().components([.Month, .Year], fromDate: self)
        let dateComps = NSCalendar.currentCalendar().components([.Month, .Year], fromDate: date)
        return selfComps.month == dateComps.month && dateComps.year == selfComps.year
    }
    
    public func isSameDayToDate(date: NSDate) -> Bool {
        let selfComps = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: self)
        let dateComps = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: date)
        return selfComps.month == dateComps.month && selfComps.year == dateComps.year && selfComps.day == dateComps.day
    }
    
}

