//
//  NSObject+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 14/04/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

extension NSObject {
    
    public class var nameOfClass: String{
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
    
    public var nameOfClass: String{
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
    
    public func addNotificationObServer(name: String, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
    }
    
    public func removeNotificationObServer(name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
    }
    
    public func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}

