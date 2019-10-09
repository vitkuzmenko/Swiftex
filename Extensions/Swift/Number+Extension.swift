//
//  Int+Extension.swift
//  WOSDK
//
//  Created by Vitaliy Kuzmenko on 29/05/15.
//  Copyright (c) 2015. All rights reserved.
//

import Foundation

extension Int {
    
    public var toString: String {
        return String(self)
    }
    
    public func wordFormat(titles: [String]) -> String {
        let cases = [2, 0, 1, 1, 1, 2];
        
        let x = self % 100
        if x > 4 && x < 20 {
            return titles[2]
        } else {
            let y = self % 10
            let minimum = Swift.min(y, 5)
            let c = cases[minimum]
            return titles[c]
        }
    }
    
    public func stringWithWordFormats(formats: [String], format: String) -> String {
        let string = wordFormat(titles: formats)
        return String(format: format, self, string)
    }
    
    public func stringWithWordFormats(formats: [String]) -> String {
        let format = wordFormat(titles: formats)
        return String(format: format, self)
    }
    
}

extension Double {

    public var toString: String {
        return String(self)
    }
        
}

extension Float {
    
    public var toString: String {
        return String(self)
    }
    
}

extension Decimal {
    
    public var toString: String {
        return NSDecimalNumber(decimal: self).stringValue
    }
    
}

