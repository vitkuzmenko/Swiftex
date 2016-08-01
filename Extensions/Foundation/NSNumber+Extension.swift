//
//  NSNumber+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 08/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import Foundation

let kStringToNumberFormatter = NSNumberFormatter()

extension NSNumber {
    
    convenience public init(string value: String) {
        let formatter = kStringToNumberFormatter
        formatter.numberStyle = .DecimalStyle
        
        var separator = "."
        
        if let safeSeparator = formatter.decimalSeparator {
            separator = safeSeparator
        }
        
        var safeValue = value
        
        if separator == "," {
            safeValue = value.stringByReplacingOccurrencesOfString(".", withString: ",", options: [], range: nil)
        } else {
            safeValue = value.stringByReplacingOccurrencesOfString(",", withString: ".", options: [], range: nil)
        }
        
        if safeValue.isEmpty {
            safeValue = "0"
        }
        
        let number = formatter.numberFromString(safeValue)
        if let double = number?.doubleValue {
            self.init(double: double)
        } else {
            self.init(double: 0)
        }
    }
    
    public func wordFormat(titles: [String]) -> String {
        let cases = [2, 0, 1, 1, 1, 2];
        
        let x = integerValue % 100
        if x > 4 && x < 20 {
            return titles[2]
        } else {
            let y = integerValue % 10
            let minimum = min(y, 5)
            let c = cases[minimum]
            return titles[c]
        }
    }
    
    public func stringWithWordFormats(formats: [String], format: String) -> String {
        let string = wordFormat(formats)
        return String(format: format, integerValue, string)
    }

}

//Infixes

public func + (left: NSNumber, right: NSNumber) -> NSNumber {
    return left.doubleValue + right.doubleValue
}

public func - (left: NSNumber, right: NSNumber) -> NSNumber {
    return left.doubleValue - right.doubleValue
}

public func += (inout left: NSNumber, right: NSNumber) {
    left = left.doubleValue + right.doubleValue
}

public func -= (inout left: NSNumber, right: NSNumber) {
    left = left.doubleValue - right.doubleValue
}

public func * (inout left: NSNumber, right: NSNumber) {
    left = left.doubleValue * right.doubleValue
}

public func / (inout left: NSNumber, right: NSNumber) {
    left = left.doubleValue / right.doubleValue
}

public func > (left: NSNumber, right: NSNumber) -> Bool {
    return left.doubleValue > right.doubleValue
}

public func < (left: NSNumber, right: NSNumber) -> Bool {
    return left.doubleValue < right.doubleValue
}

public func <= (left: NSNumber, right: NSNumber) -> Bool {
    return left.doubleValue <= right.doubleValue
}

public func >= (left: NSNumber, right: NSNumber) -> Bool {
    return left.doubleValue >= right.doubleValue
}

