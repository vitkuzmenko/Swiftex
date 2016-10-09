//
//  NSObject+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 14/04/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

extension NSObject {
    
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
}

