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
    
    public class func dateFromDateComponents(components: NSDateComponents) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone(abbreviation: "MSK")!
        calendar.locale = NSLocale.currentLocale()
        return calendar.dateFromComponents(components)
    }
    
    public class func dateWithDate(date: NSDate, hour: Int) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components([.Year, .Month, .Day], fromDate: date)
        dateComponents.hour = hour
        dateComponents.minute = 0
        return NSDate.dateFromDateComponents(dateComponents)
    }
    
}

extension NSDate {
    
    public var currentCalendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
    
    public var calendarComponents: NSCalendarUnit {
        return (NSCalendarUnit.Second.union(NSCalendarUnit.Minute).union(NSCalendarUnit.Hour).union(NSCalendarUnit.Day).union(NSCalendarUnit.Weekday).union(NSCalendarUnit.WeekOfMonth).union(NSCalendarUnit.Month).union(NSCalendarUnit.Year))
    }
    
    public var components: NSDateComponents {
        return currentCalendar.components(calendarComponents, fromDate: self)
    }
    
    public var seconds: Int {
        return components.second
    }
    
    public var minutes: Int {
        return components.minute
    }
    
    public var hours: Int {
        return components.hour
    }
    
    public var day: Int {
        return components.day
    }
    
    public var month: Int {
        return components.month
    }
    
    public var year: Int {
        return components.year
    }
    
    public var minYear: Int {
        return components.year % 100
    }
    
    public var time: String {
        return String(format: "%02d:%02d", hours, minutes)
    }

    public var isToday: Bool {
        return self.isSameDayToDate(NSDate())
    }
    
}

