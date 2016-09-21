//
//  NSNumber+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 08/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import Foundation

let kStringToNumberFormatter = NumberFormatter()

extension NSNumber {
    
    convenience public init(string value: String?) {
        guard let value = value else {
            self.init(value: 0 as Double)
            return
        }
        let formatter = kStringToNumberFormatter
        formatter.numberStyle = .decimal
        
        var separator = "."
        
        if let safeSeparator = formatter.decimalSeparator {
            separator = safeSeparator
        }
        
        var safeValue = value
        
        if separator == "," {
            safeValue = value.replacingOccurrences(of: ".", with: ",", options: [], range: nil)
        } else {
            safeValue = value.replacingOccurrences(of: ",", with: ".", options: [], range: nil)
        }
        
        if safeValue.isEmpty {
            safeValue = "0"
        }
        
        let number = formatter.number(from: safeValue)
        if let double = number?.doubleValue {
            self.init(value: double as Double)
        } else {
            self.init(value: 0 as Double)
        }
    }
    
    public func wordFormat(titles: [String]) -> String {
        let cases = [2, 0, 1, 1, 1, 2];
        
        let x = intValue % 100
        if x > 4 && x < 20 {
            return titles[2]
        } else {
            let y = intValue % 10
            let minimum = min(y, 5)
            let c = cases[minimum]
            return titles[c]
        }
    }
    
    public func stringWithWordFormats(formats: [String], format: String) -> String {
        let string = wordFormat(titles: formats)
        return String(format: format, intValue, string)
    }
    
    public var roundDoubleValue: Double {
        return floor(100 * doubleValue) / 100
    }

}
