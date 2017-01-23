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
    
    public var roundDoubleValue: Double {
        return floor(100 * doubleValue) / 100
    }

}
