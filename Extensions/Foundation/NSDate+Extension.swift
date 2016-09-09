//
//  NSDate+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 15/04/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

public func ==(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func <(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}

public func <=(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 <= rhs.timeIntervalSince1970
}

public func >=(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 >= rhs.timeIntervalSince1970
}

public func >(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 > rhs.timeIntervalSince1970
}

extension Date {
    
    public var ISO8601String: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return dateFormatter.string(from: self) + "Z"
    }
    
    public var tomorrow: Date {
        return self.addingTimeInterval(24 * 60 * 60)
    }
    
    public func isSameMonth(date: Date) -> Bool {
        let selfComps = (Calendar.current as NSCalendar).components([.month, .year], from: self)
        let dateComps = (Calendar.current as NSCalendar).components([.month, .year], from: date)
        return selfComps.month == dateComps.month && dateComps.year == selfComps.year
    }
    
    public func isSame(date: Date?) -> Bool {
        guard let date = date else { return false }
        let selfComps = (Calendar.current as NSCalendar).components([.year, .month, .day], from: self)
        let dateComps = (Calendar.current as NSCalendar).components([.year, .month, .day], from: date)
        return selfComps.month == dateComps.month && selfComps.year == dateComps.year && selfComps.day == dateComps.day
    }
    
    public static func date(components: DateComponents) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "MSK")!
        calendar.locale = Locale.current
        return calendar.date(from: components)
    }
    
    public static func date(date: Date, hour: Int) -> Date? {
        let calendar = Calendar.current
        var dateComponents = (calendar as NSCalendar).components([.year, .month, .day], from: date)
        dateComponents.hour = hour
        dateComponents.minute = 0
        return Date.date(components: dateComponents)
    }
    
}

extension Date {
    
    public var currentCalendar: Calendar {
        return Calendar.current
    }
    
    public var calendarComponents: NSCalendar.Unit {
        return (NSCalendar.Unit.second.union(NSCalendar.Unit.minute).union(NSCalendar.Unit.hour).union(NSCalendar.Unit.day).union(NSCalendar.Unit.weekday).union(NSCalendar.Unit.weekOfMonth).union(NSCalendar.Unit.month).union(NSCalendar.Unit.year))
    }
    
    public var components: DateComponents {
        return (currentCalendar as NSCalendar).components(calendarComponents, from: self)
    }
    
    public var seconds: Int {
        return components.second!
    }
    
    public var minutes: Int {
        return components.minute!
    }
    
    public var hours: Int {
        return components.hour!
    }
    
    public var day: Int {
        return components.day!
    }
    
    public var month: Int {
        return components.month!
    }
    
    public var year: Int {
        return components.year!
    }
    
    public var minYear: Int {
        return components.year! % 100
    }
    
    public var time: String {
        return String(format: "%02d:%02d", hours, minutes)
    }

    public var isToday: Bool {
        return self.isSame(date: Date())
    }
    
}

